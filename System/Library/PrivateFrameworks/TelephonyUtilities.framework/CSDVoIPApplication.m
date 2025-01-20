@interface CSDVoIPApplication
- (BOOL)hasPTTBackgroundMode;
- (BOOL)hasPTTSelfAddEntitlement;
- (BOOL)hasPendingChannelPushMessagesToDeliver;
- (BOOL)hasVoIPBackgroundMode;
- (BOOL)hasVoIPNetworkExtensionEntitlement;
- (BOOL)isDevelopmentOrTestFlightApp;
- (BOOL)isEligibleForPTTEntitlementDeprecationNotice;
- (BOOL)isUsingPTTEligibleSDK;
- (BOOL)meetsRequirementsForPTT;
- (BOOL)requiresStrictPolicyEnforcement;
- (CSDClient)channelPushClient;
- (CSDClient)networkExtensionClient;
- (CSDClient)pushKitClient;
- (CSDVoIPApplication)init;
- (CSDVoIPApplication)initWithBundleIdentifier:(id)a3;
- (NSData)channelPushToken;
- (NSData)voipToken;
- (NSMutableArray)pendingChannelDelegateMessageContexts;
- (NSMutableArray)pendingNetworkExtensionMessageContexts;
- (NSMutableArray)pendingPushKitVoIPMessageContexts;
- (NSString)bundleIdentifier;
- (NSString)environment;
- (NSString)localizedAppName;
- (id)applicationRecord;
- (id)description;
- (id)pushEnvironmentAccordingToLaunchServices;
- (void)_deliverChannelPushTokenToApplication;
- (void)_deliverMessageContext:(id)a3;
- (void)_deliverPendingChannelPushPayloadsToApplication;
- (void)_deliverPendingNetworkExtensionPayloadsToApplication;
- (void)_deliverPendingPushKitPayloadsToApplication;
- (void)_deliverVoIPTokenToApplication;
- (void)deliverChannelPushToken:(id)a3;
- (void)deliverMessage:(id)a3 withAssertion:(id)a4 applicationShouldPostIncomingCall:(BOOL)a5;
- (void)deliverVoIPToken:(id)a3;
- (void)dropUndeliveredChannelPushesOnTheFloor;
- (void)setChannelPushClient:(id)a3;
- (void)setChannelPushToken:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setNetworkExtensionClient:(id)a3;
- (void)setPushKitClient:(id)a3;
- (void)setVoipToken:(id)a3;
- (void)unsetChannelPushToken;
- (void)unsetVoIPToken;
@end

@implementation CSDVoIPApplication

- (CSDVoIPApplication)init
{
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[CSDVoIPApplication init] is not supported. Use -[CSDVoIPApplication initWithBundleIdentifier:] instead");
  NSLog(@"** TUAssertion failure: %@", v4);

  if (_TUAssertShouldCrashApplication())
  {
    v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"CSDVoIPApplication.m" lineNumber:100 description:@"-[CSDVoIPApplication init] is not supported. Use -[CSDVoIPApplication initWithBundleIdentifier:] instead"];
  }
  return 0;
}

- (CSDVoIPApplication)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSDVoIPApplication;
  v6 = [(CSDVoIPApplication *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    uint64_t v8 = +[NSMutableArray array];
    pendingNetworkExtensionMessageContexts = v7->_pendingNetworkExtensionMessageContexts;
    v7->_pendingNetworkExtensionMessageContexts = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableArray array];
    pendingPushKitVoIPMessageContexts = v7->_pendingPushKitVoIPMessageContexts;
    v7->_pendingPushKitVoIPMessageContexts = (NSMutableArray *)v10;

    uint64_t v12 = +[NSMutableArray array];
    pendingChannelDelegateMessageContexts = v7->_pendingChannelDelegateMessageContexts;
    v7->_pendingChannelDelegateMessageContexts = (NSMutableArray *)v12;
  }
  return v7;
}

- (id)description
{
  uint64_t v15 = objc_opt_class();
  v14 = [(CSDVoIPApplication *)self bundleIdentifier];
  v3 = [(CSDVoIPApplication *)self environment];
  v4 = [(CSDVoIPApplication *)self pushKitClient];
  id v5 = [(CSDVoIPApplication *)self channelPushClient];
  v6 = [(CSDVoIPApplication *)self networkExtensionClient];
  v7 = [(CSDVoIPApplication *)self voipToken];
  uint64_t v8 = [(CSDVoIPApplication *)self channelPushToken];
  v9 = [(CSDVoIPApplication *)self pendingPushKitVoIPMessageContexts];
  id v10 = [v9 count];
  v11 = [(CSDVoIPApplication *)self pendingNetworkExtensionMessageContexts];
  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p bundleIdentifier=%@ environment=%@ pushKitClient=%@ channelClient=%@ networkExtensionClient=%@ voipToken=%@ channelPushToken=%@ pendingPKMessageContextCount=%lu pendingNetworkExtensionContextsCount=%lu>", v15, self, v14, v3, v4, v5, v6, v7, v8, v10, [v11 count]);

  return v12;
}

- (id)applicationRecord
{
  return +[LSApplicationRecord csd_applicationRecordForBundleIdentifier:self->_bundleIdentifier];
}

- (id)pushEnvironmentAccordingToLaunchServices
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  v3 = [v2 entitlements];
  v4 = [v3 objectForKey:@"aps-environment" ofClass:objc_opt_class()];
  if (([v4 isEqualToString:APSEnvironmentProduction] & 1) != 0
    || [v4 isEqualToString:APSEnvironmentDevelopment])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)hasVoIPBackgroundMode
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  unsigned __int8 v3 = objc_msgSend(v2, "csd_hasVoIPBackgroundMode");

  return v3;
}

- (BOOL)hasPTTBackgroundMode
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  unsigned __int8 v3 = objc_msgSend(v2, "csd_hasPTTBackgroundMode");

  return v3;
}

- (BOOL)hasPTTSelfAddEntitlement
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  unsigned __int8 v3 = objc_msgSend(v2, "csd_hasPTTSelfAddEntitlement");

  return v3;
}

- (BOOL)isUsingPTTEligibleSDK
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  unsigned __int8 v3 = [v2 SDKVersion];
  BOOL v4 = sub_1000D04A4(v3, @"16.0");

  return v4;
}

- (BOOL)meetsRequirementsForPTT
{
  unsigned __int8 v3 = [(CSDVoIPApplication *)self applicationRecord];
  if (([v3 isPlaceholder] & 1) == 0
    && [(CSDVoIPApplication *)self hasPTTBackgroundMode]
    && [(CSDVoIPApplication *)self hasPTTSelfAddEntitlement])
  {
    BOOL v4 = [(CSDVoIPApplication *)self isUsingPTTEligibleSDK];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isEligibleForPTTEntitlementDeprecationNotice
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  unsigned __int8 v3 = [v2 SDKVersion];
  BOOL v4 = [v2 entitlements];
  id v5 = [v4 objectForKey:@"get-task-allow" ofClass:objc_opt_class()];
  unsigned __int8 v6 = [v5 BOOLValue];

  v7 = [v4 objectForKey:@"com.apple.developer.pushkit.unrestricted-voip.ptt" ofClass:objc_opt_class()];
  unsigned __int8 v8 = [v7 BOOLValue];

  if (v6) {
    unsigned __int8 v9 = 1;
  }
  else {
    unsigned __int8 v9 = [v2 isBeta];
  }
  BOOL v10 = sub_1000D04A4(v3, @"16.0") & v9 & v8;

  return v10;
}

- (BOOL)isDevelopmentOrTestFlightApp
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  unsigned __int8 v3 = [v2 entitlements];
  BOOL v4 = [v3 objectForKey:@"get-task-allow" ofClass:objc_opt_class()];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = [v2 isBeta];
  }

  return v6;
}

- (NSString)localizedAppName
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  unsigned __int8 v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (BOOL)hasVoIPNetworkExtensionEntitlement
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  unsigned __int8 v3 = objc_msgSend(v2, "csd_hasVoIPNetworkExtensionEntitlement");

  return v3;
}

- (BOOL)requiresStrictPolicyEnforcement
{
  v2 = [(CSDVoIPApplication *)self applicationRecord];
  unsigned __int8 v3 = [v2 SDKVersion];
  BOOL v4 = [v2 entitlements];
  unsigned __int8 v5 = [v4 objectForKey:@"com.apple.developer.pushkit.unrestricted-voip" ofClass:objc_opt_class()];
  unsigned int v6 = [v5 BOOLValue];

  v7 = [v4 objectForKey:@"com.apple.developer.pushkit.unrestricted-voip-regulatory" ofClass:objc_opt_class()];
  unsigned int v8 = [v7 BOOLValue];

  unsigned __int8 v9 = [v4 objectForKey:@"com.apple.developer.pushkit.unrestricted-voip.ptt" ofClass:objc_opt_class()];
  unsigned __int8 v10 = [v9 BOOLValue];

  v11 = [v4 objectForKey:@"com.apple.developer.pushkit.unrestricted-voip.temporary" ofClass:objc_opt_class()];
  unsigned __int8 v12 = [v11 BOOLValue];

  if (sub_1000D04A4(v3, @"13.0"))
  {
    int v13 = sub_1000D04A4(v3, @"15.0") | v6 ^ 1;
    if (v8) {
      v13 &= sub_1000D04A4(v3, @"15.4");
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13 & ~(v10 | v12);
}

- (void)setChannelPushClient:(id)a3
{
  unsigned __int8 v5 = (CSDClient *)a3;
  if (self->_channelPushClient != v5)
  {
    unsigned int v8 = v5;
    objc_storeStrong((id *)&self->_channelPushClient, a3);
    unsigned __int8 v5 = v8;
    if (v8)
    {
      unsigned int v6 = [(CSDVoIPApplication *)self channelPushToken];

      if (v6) {
        [(CSDVoIPApplication *)self _deliverChannelPushTokenToApplication];
      }
      v7 = [(CSDVoIPApplication *)self pendingChannelDelegateMessageContexts];

      unsigned __int8 v5 = v8;
      if (v7)
      {
        [(CSDVoIPApplication *)self _deliverPendingChannelPushPayloadsToApplication];
        unsigned __int8 v5 = v8;
      }
    }
  }
}

- (void)setPushKitClient:(id)a3
{
  unsigned __int8 v5 = (CSDClient *)a3;
  if (self->_pushKitClient != v5)
  {
    unsigned __int8 v9 = v5;
    objc_storeStrong((id *)&self->_pushKitClient, a3);
    unsigned __int8 v5 = v9;
    if (v9)
    {
      unsigned int v6 = [(CSDVoIPApplication *)self voipToken];

      if (v6) {
        [(CSDVoIPApplication *)self _deliverVoIPTokenToApplication];
      }
      v7 = [(CSDVoIPApplication *)self pendingPushKitVoIPMessageContexts];
      id v8 = [v7 count];

      unsigned __int8 v5 = v9;
      if (v8)
      {
        [(CSDVoIPApplication *)self _deliverPendingPushKitPayloadsToApplication];
        unsigned __int8 v5 = v9;
      }
    }
  }
}

- (void)setNetworkExtensionClient:(id)a3
{
  unsigned __int8 v5 = (CSDClient *)a3;
  if (self->_networkExtensionClient != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_networkExtensionClient, a3);
    unsigned __int8 v5 = v8;
    if (v8)
    {
      unsigned int v6 = [(CSDVoIPApplication *)self pendingNetworkExtensionMessageContexts];
      id v7 = [v6 count];

      unsigned __int8 v5 = v8;
      if (v7)
      {
        [(CSDVoIPApplication *)self _deliverPendingNetworkExtensionPayloadsToApplication];
        unsigned __int8 v5 = v8;
      }
    }
  }
}

- (void)deliverVoIPToken:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    unsigned __int8 v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to deliver voip token %@ to application %@", (uint8_t *)&v6, 0x16u);
  }

  [(CSDVoIPApplication *)self setVoipToken:v4];
  [(CSDVoIPApplication *)self _deliverVoIPTokenToApplication];
}

- (void)unsetVoIPToken
{
}

- (void)deliverChannelPushToken:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    unsigned __int8 v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to deliver PTT token %@ to application %@", (uint8_t *)&v6, 0x16u);
  }

  [(CSDVoIPApplication *)self setChannelPushToken:v4];
  [(CSDVoIPApplication *)self _deliverChannelPushTokenToApplication];
}

- (void)unsetChannelPushToken
{
}

- (BOOL)hasPendingChannelPushMessagesToDeliver
{
  v2 = [(CSDVoIPApplication *)self pendingChannelDelegateMessageContexts];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)dropUndeliveredChannelPushesOnTheFloor
{
  id v2 = [(CSDVoIPApplication *)self pendingChannelDelegateMessageContexts];
  [v2 removeAllObjects];
}

- (void)deliverMessage:(id)a3 withAssertion:(id)a4 applicationShouldPostIncomingCall:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218242;
    id v17 = v8;
    __int16 v18 = 2112;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asked to deliver message %p to application %@", (uint8_t *)&v16, 0x16u);
  }

  v11 = [[CSDVoIPApplicationMessageContext alloc] initWithMessage:v8 assertion:v9 applicationShouldPostIncomingCall:v5];
  switch((unint64_t)[v8 transportType])
  {
    case 0uLL:
      unsigned __int8 v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Message transport type is unknown; cannot enqueue message %@",
          (uint8_t *)&v16,
          0xCu);
      }

      break;
    case 1uLL:
      int v13 = [(CSDVoIPApplication *)self pendingNetworkExtensionMessageContexts];
      [v13 addObject:v11];

      [(CSDVoIPApplication *)self _deliverPendingNetworkExtensionPayloadsToApplication];
      break;
    case 2uLL:
      v14 = [(CSDVoIPApplication *)self pendingPushKitVoIPMessageContexts];
      [v14 addObject:v11];

      [(CSDVoIPApplication *)self _deliverPendingPushKitPayloadsToApplication];
      break;
    case 3uLL:
      uint64_t v15 = [(CSDVoIPApplication *)self pendingChannelDelegateMessageContexts];
      [v15 addObject:v11];

      [(CSDVoIPApplication *)self _deliverPendingChannelPushPayloadsToApplication];
      break;
    default:
      break;
  }
}

- (void)_deliverVoIPTokenToApplication
{
  BOOL v3 = [(CSDVoIPApplication *)self pushKitClient];

  if (v3)
  {
    id v4 = [(CSDVoIPApplication *)self pushKitClient];
    BOOL v5 = [v4 objectForBlock];

    if ([v5 conformsToProtocol:&OBJC_PROTOCOL___PKVoIPXPCClient])
    {
      int v6 = sub_100008DCC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(CSDVoIPApplication *)self voipToken];
        int v9 = 138412546;
        unsigned __int8 v10 = v7;
        __int16 v11 = 2112;
        unsigned __int8 v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Delivering voip token %@ to application %@", (uint8_t *)&v9, 0x16u);
      }
      id v8 = [(CSDVoIPApplication *)self voipToken];
      [v5 voipRegistrationSucceededWithDeviceToken:v8];
    }
  }
  else
  {
    BOOL v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pending VoIP token delivery until a connection exists", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)_deliverChannelPushTokenToApplication
{
  BOOL v3 = [(CSDVoIPApplication *)self channelPushClient];

  if (v3)
  {
    id v4 = [(CSDVoIPApplication *)self channelPushClient];
    BOOL v5 = [v4 objectForBlock];

    int v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(CSDVoIPApplication *)self channelPushToken];
      int v9 = 138412802;
      unsigned __int8 v10 = v7;
      __int16 v11 = 2112;
      unsigned __int8 v12 = self;
      __int16 v13 = 2048;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Delivering ptt token %@ to application %@ proxy %p", (uint8_t *)&v9, 0x20u);
    }
    id v8 = [(CSDVoIPApplication *)self channelPushToken];
    [v5 _didReceivePushToken:v8];
  }
  else
  {
    BOOL v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pending ptt token delivery until a connection exists", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)_deliverPendingNetworkExtensionPayloadsToApplication
{
  BOOL v3 = [(CSDVoIPApplication *)self networkExtensionClient];

  id v4 = sub_100008DCC();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = [(CSDVoIPApplication *)self pendingNetworkExtensionMessageContexts];
      *(_DWORD *)buf = 134218242;
      id v18 = [v6 count];
      __int16 v19 = 2112;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Delivering %lu network extension payload(s) to application %@", buf, 0x16u);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [(CSDVoIPApplication *)self pendingNetworkExtensionMessageContexts];
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        __int16 v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [(CSDVoIPApplication *)self _deliverMessageContext:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
          __int16 v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    id v4 = [(CSDVoIPApplication *)self pendingNetworkExtensionMessageContexts];
    [v4 removeAllObjects];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pending Network Extension payload deliveries until a connection exists", buf, 2u);
  }
}

- (void)_deliverPendingPushKitPayloadsToApplication
{
  BOOL v3 = [(CSDVoIPApplication *)self pushKitClient];

  id v4 = sub_100008DCC();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = [(CSDVoIPApplication *)self pendingPushKitVoIPMessageContexts];
      *(_DWORD *)buf = 134218242;
      id v18 = [v6 count];
      __int16 v19 = 2112;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Delivering %lu VoIP payload(s) to application %@", buf, 0x16u);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [(CSDVoIPApplication *)self pendingPushKitVoIPMessageContexts];
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        __int16 v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [(CSDVoIPApplication *)self _deliverMessageContext:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
          __int16 v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    id v4 = [(CSDVoIPApplication *)self pendingPushKitVoIPMessageContexts];
    [v4 removeAllObjects];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pending PushKit VoIP payload deliveries until a connection exists", buf, 2u);
  }
}

- (void)_deliverPendingChannelPushPayloadsToApplication
{
  BOOL v3 = [(CSDVoIPApplication *)self channelPushClient];

  id v4 = sub_100008DCC();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = [(CSDVoIPApplication *)self pendingChannelDelegateMessageContexts];
      *(_DWORD *)buf = 134218242;
      id v18 = [v6 count];
      __int16 v19 = 2112;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Delivering %lu channel push payload(s) to application %@", buf, 0x16u);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [(CSDVoIPApplication *)self pendingChannelDelegateMessageContexts];
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        __int16 v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [(CSDVoIPApplication *)self _deliverMessageContext:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
          __int16 v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    id v4 = [(CSDVoIPApplication *)self pendingChannelDelegateMessageContexts];
    [v4 removeAllObjects];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pending channel push payload deliveries until a connection exists", buf, 2u);
  }
}

- (void)_deliverMessageContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 message];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000D1B78;
  v21[3] = &unk_100504F10;
  id v6 = v4;
  id v22 = v6;
  v23 = self;
  id v7 = objc_retainBlock(v21);
  switch((unint64_t)[v5 transportType])
  {
    case 0uLL:
      id v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Message transport type is unknown; cannot deliver message %@",
          buf,
          0xCu);
      }
      goto LABEL_13;
    case 1uLL:
      id v9 = [(CSDVoIPApplication *)self networkExtensionClient];
      id v8 = [v9 objectForBlock];

      if (![v8 conformsToProtocol:&OBJC_PROTOCOL___CXNetworkExtensionVoIPXPCClient])goto LABEL_13; {
      id v10 = [v5 payload];
      }
      -[NSObject voipNetworkExtensionPayloadReceived:mustPostCall:withCompletionHandler:](v8, "voipNetworkExtensionPayloadReceived:mustPostCall:withCompletionHandler:", v10, [v6 applicationShouldPostIncomingCall], v7);
      break;
    case 2uLL:
      __int16 v11 = [(CSDVoIPApplication *)self pushKitClient];
      id v8 = [v11 objectForBlock];

      if (![v8 conformsToProtocol:&OBJC_PROTOCOL___PKVoIPXPCClient]) {
        goto LABEL_13;
      }
      id v10 = [v5 payload];
      -[NSObject voipPayloadReceived:mustPostCall:withCompletionHandler:](v8, "voipPayloadReceived:mustPostCall:withCompletionHandler:", v10, [v6 applicationShouldPostIncomingCall], v7);
      break;
    case 3uLL:
      id v8 = v5;
      long long v12 = [v8 reply];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000D1C68;
      v18[3] = &unk_100507058;
      __int16 v19 = v7;
      id v10 = v12;
      id v20 = v10;
      [v8 setReply:v18];
      long long v13 = [(CSDVoIPApplication *)self channelPushClient];
      long long v14 = [v13 objectForBlock];

      if ([v14 conformsToProtocol:&OBJC_PROTOCOL___CXChannelPushClientProtocol]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        long long v15 = [v8 payload];
        int v16 = [v8 channelUUID];
        id v17 = [v8 reply];
        objc_msgSend(v14, "_didReceivePushPayload:channelUUID:reply:isServiceUpdateMessage:isHighPriority:remainingHighPriorityBudget:", v15, v16, v17, -[NSObject isServiceUpdateMessage](v8, "isServiceUpdateMessage"), -[NSObject isWakingMessage](v8, "isWakingMessage"), -[NSObject remainingHighPriorityServiceUpdateBudget](v8, "remainingHighPriorityServiceUpdateBudget"));
      }
      break;
    default:
      goto LABEL_14;
  }

LABEL_13:
LABEL_14:
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSData)voipToken
{
  return self->_voipToken;
}

- (void)setVoipToken:(id)a3
{
}

- (CSDClient)pushKitClient
{
  return self->_pushKitClient;
}

- (CSDClient)networkExtensionClient
{
  return self->_networkExtensionClient;
}

- (NSData)channelPushToken
{
  return self->_channelPushToken;
}

- (void)setChannelPushToken:(id)a3
{
}

- (CSDClient)channelPushClient
{
  return self->_channelPushClient;
}

- (NSMutableArray)pendingPushKitVoIPMessageContexts
{
  return self->_pendingPushKitVoIPMessageContexts;
}

- (NSMutableArray)pendingNetworkExtensionMessageContexts
{
  return self->_pendingNetworkExtensionMessageContexts;
}

- (NSMutableArray)pendingChannelDelegateMessageContexts
{
  return self->_pendingChannelDelegateMessageContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingChannelDelegateMessageContexts, 0);
  objc_storeStrong((id *)&self->_pendingNetworkExtensionMessageContexts, 0);
  objc_storeStrong((id *)&self->_pendingPushKitVoIPMessageContexts, 0);
  objc_storeStrong((id *)&self->_channelPushClient, 0);
  objc_storeStrong((id *)&self->_channelPushToken, 0);
  objc_storeStrong((id *)&self->_networkExtensionClient, 0);
  objc_storeStrong((id *)&self->_pushKitClient, 0);
  objc_storeStrong((id *)&self->_voipToken, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end