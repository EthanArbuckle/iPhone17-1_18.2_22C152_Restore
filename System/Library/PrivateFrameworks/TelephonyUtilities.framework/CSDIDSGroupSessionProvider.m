@interface CSDIDSGroupSessionProvider
- (BOOL)isAVLess;
- (BOOL)isInitiator;
- (BOOL)isLightweightMember;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isScreenSharingRequest;
- (CSDConversationABTestConfiguration)testConfiguration;
- (CSDConversationServerBag)serverBag;
- (CSDIDSGroupSessionProvider)initWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 isLightweightMember:(BOOL)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13;
- (CSDIDSGroupSessionProviderDelegate)delegate;
- (IDSAccount)account;
- (IDSGroupSession)session;
- (NSArray)participantDestinationIDs;
- (NSSet)requiredCapabilities;
- (NSSet)requiredLackOfCapabilities;
- (NSString)UUID;
- (NSString)callerID;
- (NSString)clientUUIDString;
- (NSString)description;
- (NSString)destination;
- (NSString)groupID;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (unsigned)endedReason;
- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4;
- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)allowParticipants:(id)a3;
- (void)dealloc;
- (void)groupSessionDidConnectUnderlyingLinks:(id)a3;
- (void)groupSessionDidDisconnectUnderlyingLinks:(id)a3;
- (void)groupSessionDidTerminate:(id)a3;
- (void)groupSessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)joinWithOptions:(id)a3;
- (void)kickParticipants:(id)a3;
- (void)leave;
- (void)leaveWithOptions:(id)a3;
- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5;
- (void)reconnect;
- (void)registerPluginWithOptions:(id)a3;
- (void)removeRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)requestActiveParticipants;
- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4;
- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4;
- (void)restart;
- (void)sendParticipantData:(id)a3 withContext:(id)a4;
- (void)session:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5;
- (void)session:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5;
- (void)session:(id)a3 didReceiveBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7;
- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6;
- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5;
- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)session:(id)a3 didReceiveParticipantIDs:(id)a4 withCode:(unsigned int)a5 managementType:(unsigned __int16)a6;
- (void)session:(id)a3 didReceiveReport:(id)a4;
- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4;
- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4;
- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4;
- (void)sessionDidJoinGroup:(id)a3 participantUpdate:(id)a4 error:(id)a5;
- (void)sessionDidLeaveGroup:(id)a3 error:(id)a4;
- (void)sessionDidReceiveParticipantUpgrade:(id)a3 participantType:(unsigned __int16)a4 error:(id)a5;
- (void)sessiondidReceiveKeyUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalParticipantType:(unsigned __int16)a3 memberDestinations:(id)a4;
- (void)setParticipantDestinationIDs:(id)a3;
- (void)setParticipantType:(unsigned __int16)a3 forRemoteMemberDestinations:(id)a4;
- (void)setPreferences:(id)a3;
- (void)setScreening:(BOOL)a3;
- (void)setServerBag:(id)a3;
- (void)setSession:(id)a3;
- (void)setUpSession;
- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 requiredCapabilities:(id)a5 requiredLackOfCapabilities:(id)a6 triggeredLocally:(BOOL)a7;
- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 triggeredLocally:(BOOL)a5;
- (void)updateParticipantInfo:(id)a3;
@end

@implementation CSDIDSGroupSessionProvider

- (CSDIDSGroupSessionProvider)initWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 isLightweightMember:(BOOL)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v44 = a7;
  id v45 = a12;
  v46.receiver = self;
  v46.super_class = (Class)CSDIDSGroupSessionProvider;
  v23 = [(CSDIDSGroupSessionProvider *)&v46 init];
  v24 = v23;
  if (v23)
  {
    id v42 = v22;
    objc_storeStrong((id *)&v23->_groupID, a3);
    objc_storeStrong((id *)&v24->_participantDestinationIDs, a4);
    objc_storeStrong((id *)&v24->_account, a6);
    objc_storeStrong((id *)&v24->_queue, a7);
    v25 = (NSString *)[v21 copy];
    callerID = v24->_callerID;
    v24->_callerID = v25;

    v24->_isOneToOneModeEnabled = a8;
    v24->_isLightweightMember = a9;
    v24->_isScreenSharingRequest = a11;
    v24->_avLess = a10;
    v27 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v24->_featureFlags;
    v24->_featureFlags = v27;

    v29 = objc_alloc_init(CSDSharedConversationServerBag);
    serverBag = v24->_serverBag;
    v24->_serverBag = (CSDConversationServerBag *)v29;

    objc_storeStrong((id *)&v24->_testConfiguration, a12);
    v31 = +[CSDIDSChat faceTimeAppUUID];
    v32 = [v31 UUIDString];
    if (v32)
    {
      v33 = +[CSDIDSChat faceTimeAppUUID];
      uint64_t v34 = [v33 UUIDString];
      p_clientUUIDString = &v24->_clientUUIDString;
      clientUUIDString = v24->_clientUUIDString;
      v24->_clientUUIDString = (NSString *)v34;
    }
    else
    {
      v33 = +[NSUUID UUID];
      clientUUIDString = [v33 UUIDString];
      v37 = (NSString *)[clientUUIDString copy];
      p_clientUUIDString = &v24->_clientUUIDString;
      v38 = v24->_clientUUIDString;
      v24->_clientUUIDString = v37;
    }
    v24->_isInitiator = a13;
    [(CSDIDSGroupSessionProvider *)v24 setUpSession];
    v39 = sub_100008DCC();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = *p_clientUUIDString;
      *(_DWORD *)buf = 138412802;
      id v48 = v20;
      __int16 v49 = 2112;
      v50 = v40;
      __int16 v51 = 2112;
      id v52 = v45;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "initWithGroupID: participantDestinationIDs: %@, clientUUIDString: %@, testConfiguration: %@", buf, 0x20u);
    }

    id v22 = v42;
  }

  return v24;
}

- (void)dealloc
{
  if (objc_opt_respondsToSelector()) {
    [(IDSGroupSession *)self->_session invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)CSDIDSGroupSessionProvider;
  [(CSDIDSGroupSessionProvider *)&v3 dealloc];
}

- (NSString)description
{
  v2 = [(CSDIDSGroupSessionProvider *)self session];
  objc_super v3 = [v2 description];

  return (NSString *)v3;
}

- (void)setUpSession
{
  v30[0] = IDSSessionTransportTypeKey;
  v30[1] = IDSSessionAlwaysSkipSelfKey;
  v31[0] = &off_100523A58;
  v31[1] = &__kCFBooleanTrue;
  v30[2] = IDSGroupSessionMessagesGroupIDKey;
  objc_super v3 = [(CSDIDSGroupSessionProvider *)self groupID];
  v31[2] = v3;
  v30[3] = IDSGroupSessionMessagesGroupMembersKey;
  v4 = [(CSDIDSGroupSessionProvider *)self participantDestinationIDs];
  v31[3] = v4;
  v30[4] = IDSGroupSessionMessagesCallerIDKey;
  v5 = [(CSDIDSGroupSessionProvider *)self callerID];
  v31[4] = v5;
  v30[5] = IDSGroupSessionStartedAsUPlusOneKey;
  if ([(CSDIDSGroupSessionProvider *)self isOneToOneModeEnabled]) {
    v6 = &__kCFBooleanTrue;
  }
  else {
    v6 = &__kCFBooleanFalse;
  }
  v31[5] = v6;
  v30[6] = IDSGroupSessionIsLightweightParticipantKey;
  if ([(CSDIDSGroupSessionProvider *)self isLightweightMember]) {
    v7 = &__kCFBooleanTrue;
  }
  else {
    v7 = &__kCFBooleanFalse;
  }
  v31[6] = v7;
  v30[7] = IDSSessionClientUUIDKey;
  v8 = [(CSDIDSGroupSessionProvider *)self clientUUIDString];
  v31[7] = v8;
  v30[8] = IDSGroupSessionShortMKIEnabledKey;
  v9 = [(CSDIDSGroupSessionProvider *)self testConfiguration];
  if ([v9 isShortMKIEnabled]) {
    v10 = &__kCFBooleanTrue;
  }
  else {
    v10 = &__kCFBooleanFalse;
  }
  v31[8] = v10;
  v30[9] = IDSGroupSessionTLEEnabledKey;
  v11 = [(CSDIDSGroupSessionProvider *)self testConfiguration];
  if ([v11 isTLEEnabled]) {
    v12 = &__kCFBooleanTrue;
  }
  else {
    v12 = &__kCFBooleanFalse;
  }
  v31[9] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:10];
  id v14 = [v13 mutableCopy];

  if ([(CSDIDSGroupSessionProvider *)self isOneToOneModeEnabled])
  {
    v15 = +[NSNumber numberWithBool:[(CSDIDSGroupSessionProvider *)self isInitiator]];
    [v14 setObject:v15 forKeyedSubscript:IDSGroupSessionIsInitiatorKey];
  }
  v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = TULoggableStringForObject();
    int v28 = 138412290;
    v29 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating IDSGroupSession with options %@", (uint8_t *)&v28, 0xCu);
  }
  id v18 = objc_alloc((Class)IDSGroupSession);
  id v19 = [(CSDIDSGroupSessionProvider *)self account];
  id v20 = [v14 copy];
  id v21 = [v18 initWithAccount:v19 options:v20];
  [(CSDIDSGroupSessionProvider *)self setSession:v21];

  if ([(CSDIDSGroupSessionProvider *)self isOneToOneModeEnabled])
  {
    id v22 = [(CSDIDSGroupSessionProvider *)self featureFlags];
    if (![v22 uPlusOneSessionWithCapabilitiesEnabled])
    {
LABEL_22:

      goto LABEL_23;
    }
    v23 = [(CSDIDSGroupSessionProvider *)self serverBag];
    unsigned int v24 = [v23 isUPlusOneSessionCapabilitiesEnabled];

    if (v24)
    {
      v25 = +[NSSet setWithObject:IDSRegistrationPropertySupportsModernGFT];
      [(CSDIDSGroupSessionProvider *)self addRequiredCapabilities:v25 requiredLackOfCapabilities:0];

      if ([(CSDIDSGroupSessionProvider *)self isScreenSharingRequest])
      {
        id v22 = +[NSSet setWithObject:IDSRegistrationPropertySupportsSSRC];
        [(CSDIDSGroupSessionProvider *)self addRequiredCapabilities:v22 requiredLackOfCapabilities:0];
        goto LABEL_22;
      }
    }
  }
LABEL_23:
  v26 = [(CSDIDSGroupSessionProvider *)self session];
  v27 = [(CSDIDSGroupSessionProvider *)self queue];
  [v26 setDelegate:self queue:v27];
}

- (IDSGroupSession)session
{
  return self->_session;
}

- (unsigned)endedReason
{
  v2 = [(CSDIDSGroupSessionProvider *)self session];
  unsigned int v3 = [v2 sessionEndedReason];

  return v3;
}

- (NSString)UUID
{
  v2 = [(CSDIDSGroupSessionProvider *)self session];
  unsigned int v3 = [v2 sessionID];

  return (NSString *)v3;
}

- (NSString)destination
{
  v2 = [(CSDIDSGroupSessionProvider *)self session];
  unsigned int v3 = [v2 destination];

  return (NSString *)v3;
}

- (void)setPreferences:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "preferences: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(CSDIDSGroupSessionProvider *)self session];
  [v6 setPreferences:v4];
}

- (void)joinWithOptions:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = TULoggableStringForObject();
    int v15 = 138412290;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "options: %@", (uint8_t *)&v15, 0xCu);
  }
  int v7 = [(CSDIDSGroupSessionProvider *)self featureFlags];
  if (![v7 uPlusOneSessionWithCapabilitiesEnabled]) {
    goto LABEL_9;
  }
  id v8 = [(CSDIDSGroupSessionProvider *)self serverBag];
  if (![(CSDMessagingConversationParticipantDidJoinContext *)v8 isUPlusOneSessionCapabilitiesEnabled])
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  v9 = [v4 objectForKeyedSubscript:IDSGroupSessionStartedAsUPlusOneKey];
  int v10 = [v9 intValue];

  if (v10 >= 1)
  {
    v11 = +[NSSet setWithObject:IDSRegistrationPropertySupportsModernGFT];
    [(CSDIDSGroupSessionProvider *)self addRequiredCapabilities:v11 requiredLackOfCapabilities:0];

    int v7 = [v4 objectForKeyedSubscript:IDSGroupSessionClientContextDataKey];
    id v8 = [[CSDMessagingConversationParticipantDidJoinContext alloc] initWithData:v7];
    v12 = [(CSDMessagingConversationParticipantDidJoinContext *)v8 screenSharingRequest];

    if (v12)
    {
      v13 = +[NSSet setWithObject:IDSRegistrationPropertySupportsSSRC];
      [(CSDIDSGroupSessionProvider *)self addRequiredCapabilities:v13 requiredLackOfCapabilities:0];
    }
    goto LABEL_8;
  }
LABEL_10:
  id v14 = [(CSDIDSGroupSessionProvider *)self session];
  [v14 joinWithOptions:v4];
}

- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 triggeredLocally:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = TULoggableStringForHandles();
    int v13 = 138412802;
    id v14 = v11;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 1024;
    BOOL v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "participantDestinationIDs: %@ contextData: %@ triggeredLocally: %d", (uint8_t *)&v13, 0x1Cu);
  }
  [(CSDIDSGroupSessionProvider *)self setParticipantDestinationIDs:v8];
  v12 = [(CSDIDSGroupSessionProvider *)self session];
  [v12 updateMembers:v8 withContext:v9 triggeredLocally:v5];
}

- (void)updateParticipantDestinationIDs:(id)a3 withContextData:(id)a4 requiredCapabilities:(id)a5 requiredLackOfCapabilities:(id)a6 triggeredLocally:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = TULoggableStringForHandles();
    int v23 = 138413314;
    unsigned int v24 = v17;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 1024;
    BOOL v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "participantDestinationIDs: %@ contextData: %@ requiredCapabilities: %@ requiredLackOfCapabilities: %@ triggeredLocally: %d", (uint8_t *)&v23, 0x30u);
  }
  id v18 = objc_alloc((Class)IDSMessagingCapabilities);
  id v19 = +[NSSet setWithArray:v14];
  id v20 = +[NSSet setWithArray:v15];
  id v21 = [v18 initWithRequiredCapabilities:v19 requiredMissingCapabilities:v20];

  [(CSDIDSGroupSessionProvider *)self setParticipantDestinationIDs:v12];
  id v22 = [(CSDIDSGroupSessionProvider *)self session];
  [v22 updateMembers:v12 withContext:v13 messagingCapabilities:v21 triggeredLocally:v7];
}

- (void)sendParticipantData:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending participantData: %@, context: %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(CSDIDSGroupSessionProvider *)self session];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(CSDIDSGroupSessionProvider *)self session];
    [v11 updateParticipantData:v6 withContext:v7];
  }
}

- (void)updateParticipantInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updateParticipantInfo: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(CSDIDSGroupSessionProvider *)self session];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CSDIDSGroupSessionProvider *)self session];
    [v8 updateParticipantInfo:v4];
  }
}

- (void)leave
{
  unsigned int v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }

  id v4 = [(CSDIDSGroupSessionProvider *)self session];
  [v4 leaveGroupSession];
}

- (void)leaveWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Leaving with options: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(CSDIDSGroupSessionProvider *)self session];
  char v7 = objc_opt_respondsToSelector();

  id v8 = [(CSDIDSGroupSessionProvider *)self session];
  int v9 = v8;
  if (v7) {
    [v8 leaveGroupSessionWithOptions:v4];
  }
  else {
    [v8 leaveGroupSession];
  }
}

- (void)restart
{
  unsigned int v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  id v4 = [(CSDIDSGroupSessionProvider *)self session];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CSDIDSGroupSessionProvider *)self session];
    [v6 invalidate];

    [(CSDIDSGroupSessionProvider *)self setUpSession];
  }
}

- (void)requestActiveParticipants
{
  unsigned int v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CSDIDSGroupSessionProvider *)self session];
    int v6 = 138412290;
    char v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "session: %@", (uint8_t *)&v6, 0xCu);
  }
  char v5 = [(CSDIDSGroupSessionProvider *)self session];
  [v5 requestActiveParticipants];
}

- (void)reconnect
{
  unsigned int v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CSDIDSGroupSessionProvider *)self session];
    int v8 = 138412290;
    int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "session: %@", (uint8_t *)&v8, 0xCu);
  }
  char v5 = [(CSDIDSGroupSessionProvider *)self session];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(CSDIDSGroupSessionProvider *)self session];
    [v7 performSelector:"reconnectUPlusOneSession"];
  }
}

- (void)kickParticipants:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSGroupSessionProvider *)self session];
  [v5 manageDesignatedMembers:v4 withType:1];
}

- (void)allowParticipants:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSGroupSessionProvider *)self session];
  [v5 manageDesignatedMembers:v4 withType:2];
}

- (void)registerPluginWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [(CSDIDSGroupSessionProvider *)self session];
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "session: %@, options: %@", (uint8_t *)&v10, 0x16u);
  }
  char v7 = [(CSDIDSGroupSessionProvider *)self session];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(CSDIDSGroupSessionProvider *)self session];
    [v9 performSelector:"registerPluginWithOptions:" withObject:v4];
  }
}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(CSDIDSGroupSessionProvider *)self session];
    int v11 = 138412546;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "session: %@, requestDataCryptor: %@", (uint8_t *)&v11, 0x16u);
  }
  int v10 = [(CSDIDSGroupSessionProvider *)self session];
  [v10 requestDataCryptorForTopic:v6 completionHandler:v7];
}

- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(CSDIDSGroupSessionProvider *)self session];
    int v11 = 138412802;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "session: %@, requestEncryptionKeyForParticipants: %@ topic: %@", (uint8_t *)&v11, 0x20u);
  }
  int v10 = [(CSDIDSGroupSessionProvider *)self session];
  [v10 requestEncryptionKeyForParticipants:v6];
}

- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(CSDIDSGroupSessionProvider *)self session];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(CSDIDSGroupSessionProvider *)self session];
      int v21 = 138412802;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "session: %@, setRequiredCapabilities: %@ requiredLackOfCapabilities: %@", (uint8_t *)&v21, 0x20u);
    }
    __int16 v12 = [(CSDIDSGroupSessionProvider *)self session];
    __int16 v13 = [v12 requiredCapabilities];
    id v14 = [v13 mutableCopy];

    if ([v6 count])
    {
      if (!v14)
      {
        id v14 = +[NSMutableSet set];
      }
      __int16 v15 = [v6 allObjects];
      [v14 addObjectsFromArray:v15];
    }
    id v16 = [(CSDIDSGroupSessionProvider *)self session];
    __int16 v17 = [v16 requiredLackOfCapabilities];
    id v18 = [v17 mutableCopy];

    if ([v7 count])
    {
      if (!v18)
      {
        id v18 = +[NSMutableSet set];
      }
      id v19 = [v7 allObjects];
      [v18 addObjectsFromArray:v19];
    }
    id v20 = [(CSDIDSGroupSessionProvider *)self session];
    [v20 setRequiredCapabilities:v14 requiredLackOfCapabilities:v18];
  }
}

- (void)removeRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = [(CSDIDSGroupSessionProvider *)self session];
    int v17 = 138412802;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "session: %@, removeRequiredCapabilities: %@ requiredLackOfCapabilities: %@", (uint8_t *)&v17, 0x20u);
  }
  int v10 = [(CSDIDSGroupSessionProvider *)self session];
  int v11 = [v10 requiredCapabilities];
  id v12 = [v11 mutableCopy];

  if ([v6 count]) {
    [v12 minusSet:v6];
  }
  __int16 v13 = [(CSDIDSGroupSessionProvider *)self session];
  id v14 = [v13 requiredLackOfCapabilities];
  id v15 = [v14 mutableCopy];

  if ([v7 count]) {
    [v15 minusSet:v7];
  }
  id v16 = [(CSDIDSGroupSessionProvider *)self session];
  [v16 setRequiredCapabilities:v12 requiredLackOfCapabilities:v15];
}

- (NSSet)requiredCapabilities
{
  v2 = [(CSDIDSGroupSessionProvider *)self session];
  unsigned int v3 = [v2 requiredCapabilities];

  return (NSSet *)v3;
}

- (NSSet)requiredLackOfCapabilities
{
  v2 = [(CSDIDSGroupSessionProvider *)self session];
  unsigned int v3 = [v2 requiredLackOfCapabilities];

  return (NSSet *)v3;
}

- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = [(CSDIDSGroupSessionProvider *)self session];
    *(_DWORD *)buf = 138412802;
    v37 = v9;
    __int16 v38 = 2112;
    id v39 = v6;
    __int16 v40 = 2112;
    id v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "session: %@, addAliasesToConversationContainer: %@ salt: %@", buf, 0x20u);
  }
  id v10 = objc_alloc((Class)NSUUID);
  int v11 = [(CSDIDSGroupSessionProvider *)self session];
  id v12 = [v11 sessionIDAliasWithSalt:v7];
  id v13 = [v10 initWithUUIDString:v12];
  [v6 setGroupUUID:v13];

  id v14 = [(CSDIDSGroupSessionProvider *)self session];
  objc_msgSend(v6, "setLocalParticipantIdentifier:", objc_msgSend(v14, "createAliasForParticipantID:salt:", objc_msgSend(v6, "localParticipantIdentifier"), v7));

  id v15 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  __int16 v29 = v6;
  id obj = [v6 virtualParticipants];
  id v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      __int16 v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v19);
        __int16 v21 = [(CSDIDSGroupSessionProvider *)self session];
        id v22 = self;
        id v23 = v7;
        id v24 = objc_msgSend(v21, "createAliasForParticipantID:salt:", objc_msgSend(v20, "identifier"), v7);

        id v25 = objc_alloc((Class)TUConversationVirtualParticipant);
        id v26 = [v20 pluginName];
        id v27 = v24;
        id v7 = v23;
        self = v22;
        id v28 = [v25 initWithIdentifier:v27 pluginName:v26];
        [v15 addObject:v28];

        __int16 v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }

  [v29 setVirtualParticipants:v15];
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = [(CSDIDSGroupSessionProvider *)self session];
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "session: %@, participantIDForAlias: %llu salt: %@", (uint8_t *)&v12, 0x20u);
  }
  char v9 = [(CSDIDSGroupSessionProvider *)self session];
  id v10 = [v9 participantIDForAlias:a3 salt:v6];

  return (unint64_t)v10;
}

- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5
{
  id v8 = a4;
  char v9 = (void (**)(id, unint64_t))a5;
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = [(CSDIDSGroupSessionProvider *)self session];
    int v17 = 138412802;
    uint64_t v18 = v11;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "session: %@, participantIDForAlias: %llu salt: %@", (uint8_t *)&v17, 0x20u);
  }
  int v12 = [(CSDIDSGroupSessionProvider *)self session];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    __int16 v14 = [(CSDIDSGroupSessionProvider *)self session];
    [v14 getParticipantIDForAlias:a3 salt:v8 completionHandler:v9];
  }
  else
  {
    unint64_t v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [(CSDIDSGroupSessionProvider *)self session];
      int v17 = 138412290;
      uint64_t v18 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "session: %@ doesn't support async participantID fetching, falling back to sync form.", (uint8_t *)&v17, 0xCu);
    }
    v9[2](v9, [(CSDIDSGroupSessionProvider *)self participantIDForAlias:a3 salt:v8]);
  }
}

- (void)setLocalParticipantType:(unsigned __int16)a3 memberDestinations:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if (v4 == 1)
  {
    id v7 = +[NSSet setWithObject:IDSRegistrationPropertySupportsAVLess];
    [(CSDIDSGroupSessionProvider *)self removeRequiredCapabilities:v7 requiredLackOfCapabilities:0];
  }
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = [(CSDIDSGroupSessionProvider *)self session];
    id v10 = TULoggableStringForHandles();
    int v12 = 138412802;
    char v13 = v9;
    __int16 v14 = 1024;
    int v15 = v4;
    __int16 v16 = 2112;
    int v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "session: %@ updating local participant type: %hu destinations: %@", (uint8_t *)&v12, 0x1Cu);
  }
  [(CSDIDSGroupSessionProvider *)self setParticipantDestinationIDs:v6];
  self->_avLess = v4 == 0;
  int v11 = [(CSDIDSGroupSessionProvider *)self session];
  [v11 updateParticipantType:v4 members:v6 withContext:0 triggeredLocally:1];
}

- (void)setParticipantType:(unsigned __int16)a3 forRemoteMemberDestinations:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CSDIDSGroupSessionProvider *)self session];
    char v9 = TULoggableStringForHandles();
    int v11 = 138412802;
    int v12 = v8;
    __int16 v13 = 1024;
    int v14 = v4;
    __int16 v15 = 2112;
    __int16 v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "session: %@ updating remote participant type: %hu destinations: %@", (uint8_t *)&v11, 0x1Cu);
  }
  [(CSDIDSGroupSessionProvider *)self setParticipantDestinationIDs:v6];
  id v10 = [(CSDIDSGroupSessionProvider *)self session];
  [v10 updateParticipantType:v4 members:v6 withContext:0 triggeredLocally:0];
}

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(CSDIDSGroupSessionProvider *)self session];
    id v7 = (void *)v6;
    CFStringRef v8 = @"NO";
    if (v3) {
      CFStringRef v8 = @"YES";
    }
    int v10 = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    CFStringRef v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "session: %@ setScreening: %@", (uint8_t *)&v10, 0x16u);
  }
  char v9 = [(CSDIDSGroupSessionProvider *)self session];
  [v9 setCallScreeningMode:v3];
}

- (void)groupSessionDidTerminate:(id)a3
{
  id v4 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v4 sessionProviderDidTerminate:self];
}

- (void)groupSessionDidDisconnectUnderlyingLinks:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "groupSessionDidDisconnectUnderlyingLinks for session: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v6 sessionProvider:self didReceiveUnderlyingLinksStatus:0];
}

- (void)groupSessionDidConnectUnderlyingLinks:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "groupSessionDidConnectUnderlyingLinks for session: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v6 sessionProvider:self didReceiveUnderlyingLinksStatus:1];
}

- (void)groupSessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v8 sessionProvider:self endedWithReason:v5 error:v7];
}

- (void)sessionDidJoinGroup:(id)a3 participantUpdate:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v11 = [(CSDIDSGroupSessionProvider *)self delegate];
  char v9 = [v8 participantIDs];
  id v10 = [v8 participantIdentifier];

  [v11 sessionProvider:self didJoinGroupWithParticipantIdentifiers:v9 localParticipantIdentifier:v10 error:v7];
}

- (void)sessionDidLeaveGroup:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v6 sessionProvider:self didLeaveGroupWithError:v5];
}

- (void)session:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v8 sessionProvider:self didReceiveActiveParticipants:v7 success:v5];
}

- (void)session:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v8 sessionProvider:self didReceiveActiveLightweightParticipants:v7 success:v5];
}

- (void)session:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v8 sessionProvider:self didReceiveLeftParticipantID:a4 withContext:v7];
}

- (void)session:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v8 sessionProvider:self didReceiveJoinedParticipantID:a4 withContext:v7];
}

- (void)session:(id)a3 didReceiveReport:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v6 sessionProvider:self didReceiveReport:v5];
}

- (void)session:(id)a3 didReceiveBlockedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = *(void *)&a5;
  id v11 = a4;
  id v12 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v12 sessionProvider:self didReceiveKickedParticipantIDs:v11 withCode:v9 withType:v8 isTruncated:v7];
}

- (void)session:(id)a3 didReceiveParticipantIDs:(id)a4 withCode:(unsigned int)a5 managementType:(unsigned __int16)a6
{
  if (a6 <= 3u) {
    -[CSDIDSGroupSessionProvider session:didReceiveBlockedParticipantIDs:withCode:withType:isTruncated:](self, "session:didReceiveBlockedParticipantIDs:withCode:withType:isTruncated:", a3, a4, *(void *)&a5);
  }
}

- (void)sessionDidReceiveParticipantUpgrade:(id)a3 participantType:(unsigned __int16)a4 error:(id)a5
{
  uint64_t v5 = a4;
  id v7 = a5;
  id v8 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v8 sessionProvider:self didReceiveLocalParticipantType:v5 error:v7];
}

- (void)session:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v6 sessionProvider:self didRegisterPluginAllocationInfo:v5];
}

- (void)session:(id)a3 didUnregisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v6 sessionProvider:self didUnregisterPluginAllocationInfo:v5];
}

- (void)sessiondidReceiveKeyUpdate:(id)a3
{
  id v4 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v4 sessionProviderDidReceiveKeyUpdate:self];
}

- (void)session:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v9 sessionProvider:self didReceiveDataBlob:v8 forParticipant:v7];
}

- (void)session:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6
{
  uint64_t v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v11 sessionProvider:self didReceiveData:v10 dataType:v6 forParticipant:v9];
}

- (void)session:(id)a3 didReceiveServerErrorCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(CSDIDSGroupSessionProvider *)self delegate];
  [v6 sessionProvider:self didReceiveServerErrorCode:v4];
}

- (BOOL)isAVLess
{
  return self->_avLess;
}

- (void)setSession:(id)a3
{
}

- (CSDIDSGroupSessionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDIDSGroupSessionProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)participantDestinationIDs
{
  return self->_participantDestinationIDs;
}

- (void)setParticipantDestinationIDs:(id)a3
{
}

- (NSString)clientUUIDString
{
  return self->_clientUUIDString;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (IDSAccount)account
{
  return self->_account;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_isOneToOneModeEnabled;
}

- (BOOL)isLightweightMember
{
  return self->_isLightweightMember;
}

- (BOOL)isScreenSharingRequest
{
  return self->_isScreenSharingRequest;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (NSString)callerID
{
  return self->_callerID;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (CSDConversationABTestConfiguration)testConfiguration
{
  return self->_testConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testConfiguration, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_clientUUIDString, 0);
  objc_storeStrong((id *)&self->_participantDestinationIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_session, 0);
}

@end