@interface CSDIDSGroupSession
- (BOOL)isJoined;
- (BOOL)isUnderlyingLinksConnected;
- (CSDConversationServerBag)serverBag;
- (CSDIDSGroupSession)initWithGroupSessionProvider:(id)a3;
- (CSDIDSGroupSession)initWithGroupSessionProvider:(id)a3 featureFlags:(id)a4;
- (CSDIDSGroupSessionDelegate)delegate;
- (CSDIDSGroupSessionProvider)sessionProvider;
- (NSArray)participantDestinationIDs;
- (NSMutableDictionary)preferences;
- (NSSet)requiredCapabilities;
- (NSSet)requiredLackOfCapabilities;
- (NSString)idsDestination;
- (TUFeatureFlags)featureFlags;
- (id)_updateParticipantDestinationIDForParticipant:(id)a3 members:(id)a4;
- (id)idsDestinationForActiveParticipant:(id)a3;
- (unint64_t)callTypeForJoinContext:(id)a3;
- (unint64_t)lightweightRetryCount;
- (unint64_t)localParticipantIdentifier;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (unint64_t)retryCount;
- (unsigned)localParticipantType;
- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4;
- (void)addMembers:(id)a3 toExistingMembers:(id)a4 activeParticipants:(id)a5 activitySessions:(id)a6 link:(id)a7 otherInvitedHandles:(id)a8 report:(id)a9 invitationPreferences:(id)a10 requiredCapabilities:(id)a11 messagesGroupUUID:(id)a12 messagesGroupName:(id)a13 addingFromLetMeIn:(BOOL)a14 triggeredLocally:(BOOL)a15 highlightIdentifier:(id)a16 stagedActivitySession:(id)a17 avMode:(unint64_t)a18;
- (void)addMembers:(id)a3 toExistingMembers:(id)a4 participantDestinationIDs:(id)a5 webDestinationIDs:(id)a6 activeParticipants:(id)a7 activitySessions:(id)a8 link:(id)a9 otherInvitedHandles:(id)a10 report:(id)a11 invitationPreferences:(id)a12;
- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)allowMember:(id)a3;
- (void)joinUsingContext:(id)a3 localParticipantAVCData:(id)a4 members:(id)a5 otherInvitedHandles:(id)a6 participantDestinationIDs:(id)a7 link:(id)a8 report:(id)a9 stagedActivitySession:(id)a10 personaHandshakeBlob:(id)a11 activitySession:(id)a12;
- (void)kickMember:(id)a3;
- (void)leaveGroupSessionWithContext:(id)a3;
- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5;
- (void)reconnect;
- (void)registerPluginWithOptions:(id)a3;
- (void)removeMembers:(id)a3 fromExistingMembers:(id)a4 activeParticipants:(id)a5 triggeredLocally:(BOOL)a6;
- (void)requestActiveParticipants;
- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4;
- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4;
- (void)restart;
- (void)sendLocalParticipant:(id)a3;
- (void)sessionProvider:(id)a3 didJoinGroupWithParticipantIdentifiers:(id)a4 localParticipantIdentifier:(unint64_t)a5 error:(id)a6;
- (void)sessionProvider:(id)a3 didLeaveGroupWithError:(id)a4;
- (void)sessionProvider:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5;
- (void)sessionProvider:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5;
- (void)sessionProvider:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6;
- (void)sessionProvider:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5;
- (void)sessionProvider:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)sessionProvider:(id)a3 didReceiveKickedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7;
- (void)sessionProvider:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5;
- (void)sessionProvider:(id)a3 didReceiveLocalParticipantType:(unsigned __int16)a4 error:(id)a5;
- (void)sessionProvider:(id)a3 didReceiveReport:(id)a4;
- (void)sessionProvider:(id)a3 didReceiveServerErrorCode:(unsigned int)a4;
- (void)sessionProvider:(id)a3 didReceiveUnderlyingLinksStatus:(BOOL)a4;
- (void)sessionProvider:(id)a3 didRegisterPluginAllocationInfo:(id)a4;
- (void)sessionProvider:(id)a3 didUnregisterPluginAllocationInfo:(id)a4;
- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5;
- (void)sessionProviderDidReceiveKeyUpdate:(id)a3;
- (void)sessionProviderDidTerminate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsUnderlyingLinksConnected:(BOOL)a3;
- (void)setJoined:(BOOL)a3;
- (void)setLightweightRetryCount:(unint64_t)a3;
- (void)setLocalParticipantIdentifier:(unint64_t)a3;
- (void)setLocalParticipantType:(unsigned __int16)a3;
- (void)setParticipantType:(unsigned __int16)a3 forParticipant:(id)a4 members:(id)a5 isLocalParticipant:(BOOL)a6;
- (void)setRetryCount:(unint64_t)a3;
- (void)setScreening:(BOOL)a3;
- (void)setServerBag:(id)a3;
- (void)updateLocalParticipantInfo:(id)a3;
@end

@implementation CSDIDSGroupSession

- (CSDIDSGroupSession)initWithGroupSessionProvider:(id)a3 featureFlags:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSDIDSGroupSession;
  v9 = [(CSDIDSSession *)&v18 initWithSessionProvider:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureFlags, a4);
    v10->_localParticipantType = (unsigned __int16)[v7 isAVLess] ^ 1;
    objc_storeStrong((id *)&v10->_sessionProvider, a3);
    [(CSDIDSGroupSessionProvider *)v10->_sessionProvider setDelegate:v10];
    v11 = objc_alloc_init(CSDSharedConversationServerBag);
    serverBag = v10->_serverBag;
    v10->_serverBag = (CSDConversationServerBag *)v11;

    v13 = +[NSMutableDictionary dictionary];
    v14 = [(CSDIDSGroupSession *)v10 sessionProvider];
    v15 = [v14 clientUUIDString];
    [(NSMutableDictionary *)v13 setObject:v15 forKeyedSubscript:IDSSessionClientUUIDKey];

    preferences = v10->_preferences;
    v10->_preferences = v13;

    v10->_isUnderlyingLinksConnected = 1;
  }

  return v10;
}

- (CSDIDSGroupSession)initWithGroupSessionProvider:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)TUFeatureFlags);
  v6 = [(CSDIDSGroupSession *)self initWithGroupSessionProvider:v4 featureFlags:v5];

  return v6;
}

- (NSString)idsDestination
{
  v2 = [(CSDIDSGroupSession *)self sessionProvider];
  v3 = [v2 destination];

  return (NSString *)v3;
}

- (NSArray)participantDestinationIDs
{
  v2 = [(CSDIDSGroupSession *)self sessionProvider];
  v3 = [v2 participantDestinationIDs];

  return (NSArray *)v3;
}

- (void)joinUsingContext:(id)a3 localParticipantAVCData:(id)a4 members:(id)a5 otherInvitedHandles:(id)a6 participantDestinationIDs:(id)a7 link:(id)a8 report:(id)a9 stagedActivitySession:(id)a10 personaHandshakeBlob:(id)a11 activitySession:(id)a12
{
  id v18 = a3;
  id v110 = a4;
  id v19 = a8;
  id v20 = a9;
  v21 = self;
  id v111 = a12;
  id v22 = a10;
  id v106 = a7;
  id v23 = a6;
  id v24 = a5;
  v25 = [(CSDIDSGroupSession *)v21 sessionProvider];
  v26 = [(CSDIDSGroupSession *)v21 preferences];
  [v25 setPreferences:v26];

  v27 = objc_alloc_init(CSDMessagingConversationParticipantDidJoinContext);
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setTuConversationMembers:v24];

  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setOtherInvitedTUHandles:v23];
  v28 = [v18 messagesGroupUUID];
  v29 = [v28 UUIDString];
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setMessagesGroupUUIDString:v29];

  v30 = [v18 messagesGroupName];
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setMessagesGroupName:v30];

  -[CSDMessagingConversationParticipantDidJoinContext setIsMomentsAvailable:](v27, "setIsMomentsAvailable:", [v18 isMomentsAvailable]);
  v31 = [(CSDIDSGroupSession *)v21 featureFlags];
  if ([v31 groupFacetimeAsAServiceEnabled])
  {
    v32 = [v18 provider];
    -[CSDMessagingConversationParticipantDidJoinContext setIsScreenSharingAvailable:](v27, "setIsScreenSharingAvailable:", [v32 supportsSharePlay]);
  }
  else
  {
    [(CSDMessagingConversationParticipantDidJoinContext *)v27 setIsScreenSharingAvailable:1];
  }

  v33 = [(CSDIDSGroupSession *)v21 featureFlags];
  if ([v33 groupFacetimeAsAServiceEnabled])
  {
    v34 = [v18 provider];
    -[CSDMessagingConversationParticipantDidJoinContext setIsGondolaCallingAvailable:](v27, "setIsGondolaCallingAvailable:", [v34 supportsLinks]);
  }
  else
  {
    [(CSDMessagingConversationParticipantDidJoinContext *)v27 setIsGondolaCallingAvailable:1];
  }

  if ([v18 isVideo])
  {
    v35 = [(CSDIDSGroupSession *)v21 featureFlags];
    if ([v35 groupFacetimeAsAServiceEnabled])
    {
      v36 = [v18 provider];
      -[CSDMessagingConversationParticipantDidJoinContext setVideo:](v27, "setVideo:", [v36 supportsVideo]);
    }
    else
    {
      [(CSDMessagingConversationParticipantDidJoinContext *)v27 setVideo:1];
    }
  }
  else
  {
    [(CSDMessagingConversationParticipantDidJoinContext *)v27 setVideo:0];
  }
  if ([v18 isVideoEnabled])
  {
    v37 = [(CSDIDSGroupSession *)v21 featureFlags];
    if ([v37 groupFacetimeAsAServiceEnabled])
    {
      v38 = [v18 provider];
      -[CSDMessagingConversationParticipantDidJoinContext setVideoEnabled:](v27, "setVideoEnabled:", [v38 supportsVideo]);
    }
    else
    {
      [(CSDMessagingConversationParticipantDidJoinContext *)v27 setVideoEnabled:1];
    }
  }
  else
  {
    [(CSDMessagingConversationParticipantDidJoinContext *)v27 setVideoEnabled:0];
  }
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setSupportsLeaveContext:1];
  -[CSDMessagingConversationParticipantDidJoinContext setSupportsRequestToScreenShare:](v27, "setSupportsRequestToScreenShare:", [v18 supportsRequestToScreenShare]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsPersonaAvailable:](v27, "setIsPersonaAvailable:", [v18 isPersonaAvailable]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsGFTDowngradeToOneToOneAvailable:](v27, "setIsGFTDowngradeToOneToOneAvailable:", [v18 isGFTDowngradeToOneToOneAvailable]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsUPlusNDowngradeAvailable:](v27, "setIsUPlusNDowngradeAvailable:", [v18 isUPlusNDowngradeAvailable]);
  v39 = [v18 provider];
  v40 = [v39 identifier];
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setProviderIdentifier:v40];

  -[CSDMessagingConversationParticipantDidJoinContext setIsLightweight:](v27, "setIsLightweight:", [v18 isLightweight]);
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setSharePlayProtocolVersion:TUSharePlayProtocolVersion()];
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setVisionFeatureVersion:TUVisionFeatureVersion()];
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setVisionCallEstablishmentVersion:TUVisionCallEstablishmentVersion()];
  -[CSDMessagingConversationParticipantDidJoinContext setIsUPlusOneVisionToVisionAvailable:](v27, "setIsUPlusOneVisionToVisionAvailable:", [v18 isUPlusOneVisionToVisionAvailable]);
  v41 = [v18 collaborationIdentifier];
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setCollaborationIdentifier:v41];

  -[CSDMessagingConversationParticipantDidJoinContext setIsUPlusOneScreenSharingAvailable:](v27, "setIsUPlusOneScreenSharingAvailable:", [v18 isUPlusOneScreenShareAvailable]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsSpatialPersonaEnabled:](v27, "setIsSpatialPersonaEnabled:", [v18 isSpatialPersonaEnabled]);
  -[CSDMessagingConversationParticipantDidJoinContext setIsUPlusOneAVLessAvailable:](v27, "setIsUPlusOneAVLessAvailable:", [v18 isUPlusOneAVLessAvailable]);
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setIsPhotosSharePlayAvailable:TUIsPhotosSharePlayAvailable()];
  uint64_t v42 = [v18 screenSharingRequest];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(CSDIDSGroupSession *)v21 featureFlags];
    unsigned int v45 = [v44 usesModernScreenSharingFromMessages];

    if (v45)
    {
      v46 = [CSDMessagingScreenShareContext alloc];
      v47 = [v18 screenSharingRequest];
      id v48 = [(CSDMessagingScreenShareContext *)v46 initOutgoingRequestWithScreenSharingRequest:v47];
      [(CSDMessagingConversationParticipantDidJoinContext *)v27 setScreenSharingRequest:v48];
    }
  }
  v49 = [(CSDIDSGroupSession *)v21 featureFlags];
  if ([v49 conversationHandoffEnabled])
  {
    v50 = [v18 participantAssociation];

    if (!v50) {
      goto LABEL_26;
    }
    v49 = [v18 participantAssociation];
    v51 = +[CSDMessagingConversationParticipantAssociation participantAssociationWithTUConversationParticipantAssociation:v49];
    [(CSDMessagingConversationParticipantDidJoinContext *)v27 setParticipantAssociation:v51];
  }
LABEL_26:
  v52 = objc_alloc_init(CSDMessagingConversationMessage);
  v53 = [[CSDMessagingConversationReport alloc] initWithTUConversationReport:v20];
  [(CSDMessagingConversationMessage *)v52 setReportData:v53];

  [(CSDMessagingConversationMessage *)v52 setStagedActivitySession:v22];
  v54 = [(CSDIDSGroupSession *)v21 featureFlags];
  unsigned int v55 = [v54 avLessSharePlayEnabled];

  if (v55)
  {
    uint64_t v56 = (uint64_t)[v18 avMode];
  }
  else if ([v18 isVideo])
  {
    uint64_t v56 = 2;
  }
  else
  {
    uint64_t v56 = 1;
  }
  [(CSDMessagingConversationMessage *)v52 setAvMode:v56];
  -[CSDMessagingConversationMessage setPresentationMode:](v52, "setPresentationMode:", [v18 presentationMode]);
  if (v111) {
    [(CSDMessagingConversationMessage *)v52 addActivitySessions:v111];
  }
  v57 = [v18 invitationPreferences];
  id v58 = [v57 count];

  if (v58)
  {
    v59 = [v18 invitationPreferences];
    [(CSDMessagingConversationMessage *)v52 setTUInvitationPreferences:v59];
  }
  v60 = [(CSDIDSGroupSession *)v21 featureFlags];
  if ([v60 groupFacetimeAsAServiceEnabled])
  {
    v61 = [v18 provider];
    unsigned __int8 v62 = [v61 supportsLinks];

    char v63 = v62 ^ 1;
  }
  else
  {
    char v63 = 0;
  }

  if (v19 && (v63 & 1) == 0)
  {
    v64 = +[CSDMessagingConversationLink linkWithTUConversationLink:v19 includeGroupUUID:1];
    [(CSDMessagingConversationMessage *)v52 setLink:v64];
  }
  if ([v18 isInvitation])
  {
    -[CSDMessagingConversationMessage setShouldSuppressInCallUI:](v52, "setShouldSuppressInCallUI:", [v18 shouldSuppressInCallUI]);
  }
  else if ([v18 isUpgrade] {
         && ([v18 upgradeSessionUUID],
  }
             v65 = objc_claimAutoreleasedReturnValue(),
             v65,
             v65))
  {
    [(CSDMessagingConversationMessage *)v52 setType:2];
    v66 = [v18 upgradeSessionUUID];
    v67 = [v66 UUIDString];
    [(CSDMessagingConversationMessage *)v52 setProtoUpgradeSessionUUID:v67];
  }
  else if ([v18 isOneToOneModeEnabled] && objc_msgSend(v18, "isInitiator"))
  {
    [(CSDMessagingConversationMessage *)v52 setType:1];
  }
  [(CSDMessagingConversationParticipantDidJoinContext *)v27 setMessage:v52];
  if ([v18 isOneToOneModeEnabled]) {
    id v68 = [v18 isInitiator];
  }
  else {
    id v68 = 0;
  }
  v105 = v52;
  v109 = v19;
  v69 = sub_100008DCC();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    if ([v18 isOneToOneModeEnabled]) {
      CFStringRef v70 = @"YES";
    }
    else {
      CFStringRef v70 = @"NO";
    }
    *(_DWORD *)buf = 136315906;
    if ([v18 isInitiator]) {
      CFStringRef v71 = @"YES";
    }
    else {
      CFStringRef v71 = @"NO";
    }
    v115 = "-[CSDIDSGroupSession joinUsingContext:localParticipantAVCData:members:otherInvitedHandles:participantDestinat"
           "ionIDs:link:report:stagedActivitySession:personaHandshakeBlob:activitySession:]";
    if (v68) {
      CFStringRef v72 = @"YES";
    }
    else {
      CFStringRef v72 = @"NO";
    }
    __int16 v116 = 2112;
    v117 = (void *)v70;
    __int16 v118 = 2112;
    CFStringRef v119 = v71;
    __int16 v120 = 2112;
    CFStringRef v121 = v72;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%s: isOneToOneModeEnabled: %@, isInitiator: %@, shouldHaveNewServerAllocation: %@", buf, 0x2Au);
  }
  v108 = v20;

  v73 = sub_100008DCC();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v115 = "-[CSDIDSGroupSession joinUsingContext:localParticipantAVCData:members:otherInvitedHandles:participantDestinat"
           "ionIDs:link:report:stagedActivitySession:personaHandshakeBlob:activitySession:]";
    __int16 v116 = 2112;
    v117 = v27;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "%s: Joining with participantJoinContext: %@", buf, 0x16u);
  }

  v103 = [(CSDMessagingConversationParticipantDidJoinContext *)v27 data];
  uint64_t v102 = IDSGroupSessionClientContextDataKey;
  uint64_t v112 = IDSGroupSessionAllParticipantsKey;
  uint64_t v113 = IDSGroupSessionNoStreamsKey;
  v96 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
  uint64_t v101 = IDSGroupSessionSubscribedStreamsKey;
  v100 = +[NSNumber numberWithInteger:TUMultiwayMaxConcurrentStreams()];
  uint64_t v99 = IDSGroupSessionMaxConcurrentStreamsKey;
  v98 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v18 isUpgrade]);
  uint64_t v97 = IDSGroupSessionJoinTypeKey;
  v107 = v21;
  v74 = +[NSNumber numberWithUnsignedInteger:[(CSDIDSGroupSession *)v21 callTypeForJoinContext:v18]];
  uint64_t v95 = IDSGroupSessionCommandContextKey;
  v75 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 isOneToOneModeEnabled]);
  uint64_t v94 = IDSGroupSessionStartedAsUPlusOneKey;
  v76 = +[NSNumber numberWithBool:v68];
  v77 = [v106 allObjects];

  uint64_t v78 = IDSGroupSessionMessagesGroupMembersKey;
  v79 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 isInitiator]);
  uint64_t v80 = IDSGroupSessionIsInitiatorKey;
  v81 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 isScreening]);
  +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v103, v102, v96, v101, v100, v99, v98, v97, v74, v95, v75, v94, v76, @"gs-new-server-allocation-key", v77, v78, v79,
    v80,
    v81,
    IDSGroupSessionCallScreeningMode,
  v104 = 0);

  v82 = v27;
  if ([(CSDMessagingConversationParticipantDidJoinContext *)v27 isLightweight])
  {
    id v83 = objc_alloc_init((Class)NSData);
    v84 = v104;
    [v104 setObject:v83 forKeyedSubscript:IDSSessionParticipantDataKey];

    v85 = v110;
  }
  else
  {
    v84 = v104;
    v85 = v110;
    [v104 setObject:v110 forKeyedSubscript:IDSSessionParticipantDataKey];
  }
  v86 = [v108 conversationID];

  if (v86)
  {
    v87 = [v108 conversationID];
    [v84 setObject:v87 forKeyedSubscript:IDSGroupSessionConversationIDKey];
  }
  v88 = [v108 timebase];

  if (v88)
  {
    v89 = [v108 timebase];
    [v84 setObject:v89 forKeyedSubscript:IDSGroupSessionTimeBaseKey];
  }
  v90 = +[CSDMessagingConversationParticipant participantWithCSDConversationJoinContext:v82];
  [v90 setAvcData:v85];
  v91 = [v90 data];
  [v84 setObject:v91 forKeyedSubscript:IDSGroupSessionParticipantInfoKey];

  v92 = sub_100008DCC();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v115 = (const char *)v90;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "joinUsingContext: sending dataBlob %@", buf, 0xCu);
  }

  v93 = [(CSDIDSGroupSession *)v107 sessionProvider];
  [v93 joinWithOptions:v84];
}

- (void)removeMembers:(id)a3 fromExistingMembers:(id)a4 activeParticipants:(id)a5 triggeredLocally:(BOOL)a6
{
  uint64_t v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v40 = a5;
  v11 = +[NSMutableArray array];
  id v12 = [v10 mutableCopy];
  [v12 minusSet:v9];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v50;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = +[IDSDestination destinationWithTUConversationMember:*(void *)(*((void *)&v49 + 1) + 8 * i)];
        [v11 addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v15);
  }

  if (v6)
  {
    unsigned int v36 = v6;
    id v37 = v10;
    v38 = v9;
    v35 = objc_alloc_init(CSDMessagingConversationParticipantDidJoinContext);
    [(CSDMessagingConversationParticipantDidJoinContext *)v35 setTuConversationMembers:v13];
    id v19 = objc_alloc_init(CSDMessagingConversationMessage);
    [(CSDMessagingConversationMessage *)v19 setType:19];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v20 = v40;
    id v21 = [v20 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v46;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
          v26 = +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:v25];
          if ([v25 isLightweight]) {
            [(CSDMessagingConversationMessage *)v19 addActiveLightweightParticipants:v26];
          }
          else {
            [(CSDMessagingConversationMessage *)v19 addActiveParticipants:v26];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v22);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = v38;
    id v27 = v38;
    id v28 = [v27 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (k = 0; k != v29; k = (char *)k + 1)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = +[CSDMessagingConversationMember memberWithTUConversationMember:*(void *)(*((void *)&v41 + 1) + 8 * (void)k)];
          [(CSDMessagingConversationMessage *)v19 addRemovedMembers:v32];
        }
        id v29 = [v27 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v29);
    }

    [(CSDMessagingConversationParticipantDidJoinContext *)v35 setMessage:v19];
    v33 = [(CSDMessagingConversationParticipantDidJoinContext *)v35 data];

    id v10 = v37;
    uint64_t v6 = v36;
  }
  else
  {
    v33 = 0;
  }
  v34 = [(CSDIDSGroupSession *)self sessionProvider];
  [v34 updateParticipantDestinationIDs:v11 withContextData:v33 triggeredLocally:v6];
}

- (void)addMembers:(id)a3 toExistingMembers:(id)a4 activeParticipants:(id)a5 activitySessions:(id)a6 link:(id)a7 otherInvitedHandles:(id)a8 report:(id)a9 invitationPreferences:(id)a10 requiredCapabilities:(id)a11 messagesGroupUUID:(id)a12 messagesGroupName:(id)a13 addingFromLetMeIn:(BOOL)a14 triggeredLocally:(BOOL)a15 highlightIdentifier:(id)a16 stagedActivitySession:(id)a17 avMode:(unint64_t)a18
{
  id v134 = a3;
  id v128 = a4;
  id v115 = a5;
  id v124 = a6;
  id v121 = a7;
  id v116 = a8;
  id v123 = a9;
  id v122 = a10;
  id v125 = a11;
  id v120 = a12;
  id v119 = a13;
  id v118 = a16;
  id v117 = a17;
  uint64_t v23 = +[NSMutableArray array];
  v131 = +[NSMutableArray array];
  v133 = +[NSMutableArray array];
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  id obj = v134;
  id v24 = [obj countByEnumeratingWithState:&v167 objects:v180 count:16];
  v135 = v23;
  if (v24)
  {
    id v25 = v24;
    char v132 = 0;
    char v127 = 0;
    uint64_t v26 = *(void *)v168;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v168 != v26) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(void **)(*((void *)&v167 + 1) + 8 * i);
        id v29 = +[IDSDestination destinationWithTUConversationMember:v28];
        [v23 addObject:v29];
        uint64_t v30 = [v28 handle];
        v31 = [v30 value];
        unsigned int v32 = [v31 destinationIdIsPseudonym];

        if (v32)
        {
          [v133 addObject:v29];
        }
        else
        {
          v33 = [v28 handle];
          v34 = [v33 value];
          unsigned int v35 = [v34 destinationIdIsTemporary];

          if (v35)
          {
            unsigned int v36 = +[IDSDestination destinationWithTUConversationMember:v28];
            [v131 addObject:v36];
          }
          else
          {
            id v37 = +[TUIDSLookupManager sharedManager];
            v38 = [v28 idsDestination];
            unsigned int v39 = [v37 faceTimeMultiwayAvailabilityForDestination:v38];

            if (v39)
            {
              id v40 = +[TUIDSLookupManager sharedManager];
              long long v41 = [v28 idsDestination];
              unsigned __int8 v42 = [v40 isWebCapableFaceTimeAvailableForDestination:v41];

              v132 |= v42;
            }
            else
            {
              char v127 = 1;
            }
          }
        }

        uint64_t v23 = v135;
      }
      id v25 = [obj countByEnumeratingWithState:&v167 objects:v180 count:16];
    }
    while (v25);
  }
  else
  {
    char v132 = 0;
    char v127 = 0;
  }

  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  id v129 = v128;
  id v43 = [v129 countByEnumeratingWithState:&v163 objects:v179 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v164;
    do
    {
      for (j = 0; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v164 != v45) {
          objc_enumerationMutation(v129);
        }
        long long v47 = *(void **)(*((void *)&v163 + 1) + 8 * (void)j);
        long long v48 = +[IDSDestination destinationWithTUConversationMember:v47];
        [v135 addObject:v48];
        long long v49 = [v47 handle];
        long long v50 = [v49 value];
        unsigned int v51 = [v50 destinationIdIsPseudonym];

        if (v51)
        {
          long long v52 = v133;
LABEL_26:
          [v52 addObject:v48];
          goto LABEL_28;
        }
        v53 = [v47 handle];
        v54 = [v53 value];
        unsigned int v55 = [v54 destinationIdIsTemporary];

        if (v55)
        {
          long long v52 = v131;
          goto LABEL_26;
        }
        uint64_t v56 = +[TUIDSLookupManager sharedManager];
        v57 = [v47 idsDestination];
        [v56 faceTimeMultiwayAvailabilityForDestination:v57];

        id v58 = +[TUIDSLookupManager sharedManager];
        v59 = [v47 idsDestination];
        unsigned __int8 v60 = [v58 isWebCapableFaceTimeAvailableForDestination:v59];

        v132 |= v60;
LABEL_28:
      }
      id v44 = [v129 countByEnumeratingWithState:&v163 objects:v179 count:16];
    }
    while (v44);
  }

  BOOL v61 = a15;
  if (a15)
  {
    unsigned __int8 v62 = v115;
    if ([v131 count])
    {
      if (v132)
      {
        [(CSDIDSGroupSession *)self addMembers:obj toExistingMembers:v129 participantDestinationIDs:v135 webDestinationIDs:v131 activeParticipants:v115 activitySessions:v124 link:v121 otherInvitedHandles:v116 report:v123 invitationPreferences:v122];
      }
      else if (v127)
      {
        v65 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v135 count]);
        long long v159 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        long long v162 = 0u;
        id v66 = v135;
        id v67 = [v66 countByEnumeratingWithState:&v159 objects:v178 count:16];
        if (v67)
        {
          id v68 = v67;
          uint64_t v69 = *(void *)v160;
          do
          {
            for (k = 0; k != v68; k = (char *)k + 1)
            {
              if (*(void *)v160 != v69) {
                objc_enumerationMutation(v66);
              }
              CFStringRef v71 = *(void **)(*((void *)&v159 + 1) + 8 * (void)k);
              if (([v131 containsObject:v71] & 1) == 0)
              {
                CFStringRef v72 = [v71 destinationURIs];
                v73 = [v72 allObjects];
                [v65 addObjectsFromArray:v73];
              }
            }
            id v68 = [v66 countByEnumeratingWithState:&v159 objects:v178 count:16];
          }
          while (v68);
        }

        v74 = sub_100008DCC();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v175 = (const char *)v65;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Querying for capabilities of call members using native destinations: %@", buf, 0xCu);
        }

        v75 = +[TUIDSLookupManager sharedManager];
        v148[0] = _NSConcreteStackBlock;
        v148[1] = 3221225472;
        v148[2] = sub_10014D38C;
        v148[3] = &unk_1005085E0;
        v148[4] = self;
        id v149 = obj;
        id v150 = v129;
        id v151 = v66;
        id v152 = v131;
        id v153 = v115;
        id v154 = v124;
        id v155 = v121;
        id v156 = v116;
        id v157 = v123;
        id v158 = v122;
        [v75 queryHasWebOnlyEndpointsForDestinations:v65 completionBlock:v148];
      }
    }
    v76 = objc_alloc_init(CSDMessagingConversationParticipantDidJoinContext);
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setTuConversationMembers:v129];
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setIsScreenSharingAvailable:1];
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setIsGondolaCallingAvailable:1];
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setSharePlayProtocolVersion:TUSharePlayProtocolVersion()];
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setVisionFeatureVersion:TUVisionFeatureVersion()];
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setVisionCallEstablishmentVersion:TUVisionCallEstablishmentVersion()];
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setIsPhotosSharePlayAvailable:TUIsPhotosSharePlayAvailable()];
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setMessagesGroupName:v119];
    v77 = [v120 UUIDString];
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setMessagesGroupUUIDString:v77];

    uint64_t v78 = objc_alloc_init(CSDMessagingConversationMessage);
    v79 = [[CSDMessagingConversationReport alloc] initWithTUConversationReport:v123];
    [(CSDMessagingConversationMessage *)v78 setReportData:v79];

    uint64_t v80 = sub_100008DCC();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      v81 = [(CSDMessagingConversationMessage *)v78 reportData];
      *(_DWORD *)buf = 136315394;
      v175 = "-[CSDIDSGroupSession addMembers:toExistingMembers:activeParticipants:activitySessions:link:otherInvitedHand"
             "les:report:invitationPreferences:requiredCapabilities:messagesGroupUUID:messagesGroupName:addingFromLetMeIn"
             ":triggeredLocally:highlightIdentifier:stagedActivitySession:avMode:]";
      __int16 v176 = 2112;
      v177 = v81;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "%s: Conversation report = %@", buf, 0x16u);
    }
    [(CSDMessagingConversationMessage *)v78 setType:3];
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v82 = v115;
    id v83 = [v82 countByEnumeratingWithState:&v144 objects:v173 count:16];
    if (v83)
    {
      id v84 = v83;
      uint64_t v85 = *(void *)v145;
      do
      {
        for (m = 0; m != v84; m = (char *)m + 1)
        {
          if (*(void *)v145 != v85) {
            objc_enumerationMutation(v82);
          }
          v87 = *(void **)(*((void *)&v144 + 1) + 8 * (void)m);
          v88 = +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:v87];
          if ([v87 isLightweight]) {
            [(CSDMessagingConversationMessage *)v78 addActiveLightweightParticipants:v88];
          }
          else {
            [(CSDMessagingConversationMessage *)v78 addActiveParticipants:v88];
          }
        }
        id v84 = [v82 countByEnumeratingWithState:&v144 objects:v173 count:16];
      }
      while (v84);
    }

    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    id v89 = obj;
    id v90 = [v89 countByEnumeratingWithState:&v140 objects:v172 count:16];
    if (v90)
    {
      id v91 = v90;
      uint64_t v92 = *(void *)v141;
      do
      {
        for (n = 0; n != v91; n = (char *)n + 1)
        {
          if (*(void *)v141 != v92) {
            objc_enumerationMutation(v89);
          }
          uint64_t v94 = *(void **)(*((void *)&v140 + 1) + 8 * (void)n);
          unsigned int v95 = [v94 isLightweightMember];
          v96 = +[CSDMessagingConversationMember memberWithTUConversationMember:v94];
          if (v95) {
            [(CSDMessagingConversationMessage *)v78 addLightweightMembers:v96];
          }
          else {
            [(CSDMessagingConversationMessage *)v78 addAddedMembers:v96];
          }
        }
        id v91 = [v89 countByEnumeratingWithState:&v140 objects:v172 count:16];
      }
      while (v91);
    }

    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v97 = v124;
    id v98 = [v97 countByEnumeratingWithState:&v136 objects:v171 count:16];
    v64 = v121;
    if (v98)
    {
      id v99 = v98;
      uint64_t v100 = *(void *)v137;
      do
      {
        for (ii = 0; ii != v99; ii = (char *)ii + 1)
        {
          if (*(void *)v137 != v100) {
            objc_enumerationMutation(v97);
          }
          [(CSDMessagingConversationMessage *)v78 addActivitySessions:*(void *)(*((void *)&v136 + 1) + 8 * (void)ii)];
        }
        id v99 = [v97 countByEnumeratingWithState:&v136 objects:v171 count:16];
      }
      while (v99);
    }

    if (v121)
    {
      uint64_t v102 = +[CSDMessagingConversationLink linkWithTUConversationLink:v121 includeGroupUUID:1];
      [(CSDMessagingConversationMessage *)v78 setLink:v102];

      v103 = [v121 groupUUID];
      [(CSDMessagingConversationMessage *)v78 setConversationGroupUUID:v103];
    }
    if (v122) {
      -[CSDMessagingConversationMessage setTUInvitationPreferences:](v78, "setTUInvitationPreferences:");
    }
    if (a14) {
      [(CSDMessagingConversationMessage *)v78 setIsLetMeInApproved:1];
    }
    if (v118) {
      -[CSDMessagingConversationMessage setHighlightIdentifier:](v78, "setHighlightIdentifier:");
    }
    [(CSDMessagingConversationMessage *)v78 setStagedActivitySession:v117];
    v104 = [(CSDIDSGroupSession *)self featureFlags];
    unsigned int v105 = [v104 avLessSharePlayEnabled];

    if (v105) {
      [(CSDMessagingConversationMessage *)v78 setAvMode:a18];
    }
    [(CSDMessagingConversationParticipantDidJoinContext *)v76 setMessage:v78];
    char v63 = [(CSDMessagingConversationParticipantDidJoinContext *)v76 data];

    BOOL v61 = a15;
  }
  else
  {
    char v63 = 0;
    unsigned __int8 v62 = v115;
    v64 = v121;
  }
  if ([v133 count])
  {
    if ([v125 count]) {
      +[NSMutableSet setWithArray:v125];
    }
    else {
    id v106 = +[NSMutableSet set];
    }
    [v106 addObject:IDSRegistrationPropertySupportsModernGFT];
    [(CSDIDSGroupSession *)self addRequiredCapabilities:v106 requiredLackOfCapabilities:0];
  }
  if (v61 && ([v131 count] || objc_msgSend(v133, "count")))
  {
    if ([v125 count]) {
      +[NSMutableSet setWithArray:v125];
    }
    else {
    id v110 = +[NSMutableSet set];
    }
    uint64_t v112 = v122;
    [v110 addObject:IDSRegistrationPropertySupportsGondola];
    [v110 addObject:IDSRegistrationPropertySupportsModernGFT];
    uint64_t v113 = [(CSDIDSGroupSession *)self sessionProvider];
    v114 = [v110 allObjects];
    id v111 = v135;
    [v113 updateParticipantDestinationIDs:v135 withContextData:v63 requiredCapabilities:v114 requiredLackOfCapabilities:&__NSArray0__struct triggeredLocally:1];

    v107 = v125;
  }
  else
  {
    v107 = v125;
    id v108 = [v125 count];
    v109 = [(CSDIDSGroupSession *)self sessionProvider];
    id v110 = v109;
    id v111 = v135;
    if (v108) {
      [v109 updateParticipantDestinationIDs:v135 withContextData:v63 requiredCapabilities:v125 requiredLackOfCapabilities:&__NSArray0__struct triggeredLocally:v61];
    }
    else {
      [v109 updateParticipantDestinationIDs:v135 withContextData:v63 triggeredLocally:v61];
    }
    uint64_t v112 = v122;
  }
}

- (void)addMembers:(id)a3 toExistingMembers:(id)a4 participantDestinationIDs:(id)a5 webDestinationIDs:(id)a6 activeParticipants:(id)a7 activitySessions:(id)a8 link:(id)a9 otherInvitedHandles:(id)a10 report:(id)a11 invitationPreferences:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v84 = a5;
  id v83 = a7;
  id v82 = a8;
  id v18 = a9;
  id v81 = a10;
  id v80 = a11;
  id v79 = a12;
  id v85 = [v16 mutableCopy];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v16;
  id v19 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v104;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v104 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        id v24 = [v23 handle];
        id v25 = [v24 value];
        unsigned int v26 = [v25 destinationIdIsTemporary];

        if (v26) {
          [v85 removeObject:v23];
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
    }
    while (v20);
  }

  if ([v85 count])
  {
    v77 = v18;
    id v27 = [v17 mutableCopy];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v28 = v17;
    id v29 = [v28 countByEnumeratingWithState:&v99 objects:v112 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v100;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v100 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v99 + 1) + 8 * (void)j);
          v34 = [v33 handle];
          unsigned int v35 = [v34 value];
          unsigned int v36 = [v35 destinationIdIsTemporary];

          if (v36) {
            [v27 removeObject:v33];
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v99 objects:v112 count:16];
      }
      while (v30);
    }

    id v37 = [v81 mutableCopy];
    v38 = (char *)[v27 count];
    if (&v38[(void)[v85 count]] <= (char *)2)
    {
      do
      {
        if (![v37 count]) {
          break;
        }
        unsigned int v39 = [v37 anyObject];
        id v40 = [objc_alloc((Class)TUConversationMember) initWithHandle:v39];
        [v85 addObject:v40];
        [v37 removeObject:v39];

        long long v41 = (char *)[v27 count];
      }
      while (&v41[(void)[v85 count]] < (char *)3);
    }
    v75 = v37;
    unsigned __int8 v42 = objc_alloc_init(CSDMessagingConversationParticipantDidJoinContext);
    v76 = v27;
    [(CSDMessagingConversationParticipantDidJoinContext *)v42 setTuConversationMembers:v27];
    [(CSDMessagingConversationParticipantDidJoinContext *)v42 setIsScreenSharingAvailable:1];
    [(CSDMessagingConversationParticipantDidJoinContext *)v42 setIsGondolaCallingAvailable:1];
    [(CSDMessagingConversationParticipantDidJoinContext *)v42 setSharePlayProtocolVersion:TUSharePlayProtocolVersion()];
    [(CSDMessagingConversationParticipantDidJoinContext *)v42 setVisionFeatureVersion:TUVisionFeatureVersion()];
    [(CSDMessagingConversationParticipantDidJoinContext *)v42 setVisionCallEstablishmentVersion:TUVisionCallEstablishmentVersion()];
    v74 = v42;
    [(CSDMessagingConversationParticipantDidJoinContext *)v42 setIsPhotosSharePlayAvailable:TUIsPhotosSharePlayAvailable()];
    id v43 = objc_alloc_init(CSDMessagingConversationMessage);
    id v44 = [[CSDMessagingConversationReport alloc] initWithTUConversationReport:v80];
    [(CSDMessagingConversationMessage *)v43 setReportData:v44];

    [(CSDMessagingConversationMessage *)v43 setType:3];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v45 = v83;
    id v46 = [v45 countByEnumeratingWithState:&v95 objects:v111 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v96;
      do
      {
        for (k = 0; k != v47; k = (char *)k + 1)
        {
          if (*(void *)v96 != v48) {
            objc_enumerationMutation(v45);
          }
          long long v50 = *(void **)(*((void *)&v95 + 1) + 8 * (void)k);
          unsigned int v51 = [v50 handle];
          long long v52 = [v51 value];
          unsigned __int8 v53 = [v52 destinationIdIsTemporary];

          if ((v53 & 1) == 0)
          {
            v54 = +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:v50];
            [(CSDMessagingConversationMessage *)v43 addActiveParticipants:v54];
          }
        }
        id v47 = [v45 countByEnumeratingWithState:&v95 objects:v111 count:16];
      }
      while (v47);
    }

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v55 = v85;
    id v56 = [v55 countByEnumeratingWithState:&v91 objects:v110 count:16];
    if (v56)
    {
      id v57 = v56;
      uint64_t v58 = *(void *)v92;
      do
      {
        for (m = 0; m != v57; m = (char *)m + 1)
        {
          if (*(void *)v92 != v58) {
            objc_enumerationMutation(v55);
          }
          unsigned __int8 v60 = *(void **)(*((void *)&v91 + 1) + 8 * (void)m);
          unsigned int v61 = [v60 isLightweightMember];
          unsigned __int8 v62 = +[CSDMessagingConversationMember memberWithTUConversationMember:v60];
          if (v61) {
            [(CSDMessagingConversationMessage *)v43 addLightweightMembers:v62];
          }
          else {
            [(CSDMessagingConversationMessage *)v43 addAddedMembers:v62];
          }
        }
        id v57 = [v55 countByEnumeratingWithState:&v91 objects:v110 count:16];
      }
      while (v57);
    }

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v63 = v82;
    id v64 = [v63 countByEnumeratingWithState:&v87 objects:v109 count:16];
    if (v64)
    {
      id v65 = v64;
      uint64_t v66 = *(void *)v88;
      do
      {
        for (n = 0; n != v65; n = (char *)n + 1)
        {
          if (*(void *)v88 != v66) {
            objc_enumerationMutation(v63);
          }
          [(CSDMessagingConversationMessage *)v43 addActivitySessions:*(void *)(*((void *)&v87 + 1) + 8 * (void)n)];
        }
        id v65 = [v63 countByEnumeratingWithState:&v87 objects:v109 count:16];
      }
      while (v65);
    }

    id v18 = v77;
    if (v77)
    {
      id v68 = +[CSDMessagingConversationLink linkWithTUConversationLink:v77 includeGroupUUID:1];
      [(CSDMessagingConversationMessage *)v43 setLink:v68];

      uint64_t v69 = [v77 groupUUID];
      [(CSDMessagingConversationMessage *)v43 setConversationGroupUUID:v69];
    }
    if (v79) {
      -[CSDMessagingConversationMessage setTUInvitationPreferences:](v43, "setTUInvitationPreferences:");
    }
    [(CSDMessagingConversationParticipantDidJoinContext *)v74 setMessage:v43];
    CFStringRef v70 = [(CSDMessagingConversationParticipantDidJoinContext *)v74 data];
    CFStringRef v71 = [(CSDIDSGroupSession *)self sessionProvider];
    uint64_t v108 = IDSRegistrationPropertySupportsGondola;
    CFStringRef v72 = +[NSArray arrayWithObjects:&v108 count:1];
    uint64_t v107 = IDSRegistrationPropertySupportsModernGFT;
    v73 = +[NSArray arrayWithObjects:&v107 count:1];
    [v71 updateParticipantDestinationIDs:v84 withContextData:v70 requiredCapabilities:v72 requiredLackOfCapabilities:v73 triggeredLocally:1];
  }
}

- (void)sendLocalParticipant:(id)a3
{
  id v4 = a3;
  id v11 = +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:v4];
  id v5 = [v11 data];
  id v6 = [v5 copy];

  id v7 = [(CSDIDSGroupSession *)self sessionProvider];
  [v7 updateParticipantInfo:v6];

  [v11 setAvcData:0];
  id v8 = [(CSDIDSGroupSession *)self sessionProvider];
  id v9 = [v4 avcData];

  id v10 = [v11 data];
  [v8 sendParticipantData:v9 withContext:v10];
}

- (void)updateLocalParticipantInfo:(id)a3
{
  id v6 = +[CSDMessagingConversationParticipant participantWithCSDConversationParticipant:a3];
  id v4 = [(CSDIDSGroupSession *)self sessionProvider];
  id v5 = [v6 data];
  [v4 updateParticipantInfo:v5];
}

- (void)requestActiveParticipants
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "requestActiveParticipants self: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(CSDIDSGroupSession *)self sessionProvider];
  [v4 requestActiveParticipants];
}

- (void)leaveGroupSessionWithContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = objc_alloc_init(CSDMessagingConversationParticipantDidLeaveContext);
    -[CSDMessagingConversationParticipantDidLeaveContext setLeaveReason:](v5, "setLeaveReason:", [v4 leaveReason]);
  }
  else
  {
    int v5 = 0;
  }
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Leaving with participantLeaveContext: %@", buf, 0xCu);
  }

  id v7 = [(CSDMessagingConversationParticipantDidLeaveContext *)v5 data];

  if (v7)
  {
    id v8 = [(CSDMessagingConversationParticipantDidLeaveContext *)v5 data];
    id v9 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, IDSGroupSessionClientContextDataKey, 0);
  }
  else
  {
    id v9 = +[NSDictionary dictionary];
  }
  id v10 = [(CSDIDSGroupSession *)self sessionProvider];
  [v10 leaveWithOptions:v9];
}

- (void)registerPluginWithOptions:(id)a3
{
  id v4 = a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "registerPluginWithOptions:%@ self: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(CSDIDSGroupSession *)self sessionProvider];
  [v6 registerPluginWithOptions:v4];
}

- (void)restart
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "restart self: %@", (uint8_t *)&v5, 0xCu);
  }

  [(CSDIDSGroupSession *)self setJoined:0];
  id v4 = [(CSDIDSGroupSession *)self sessionProvider];
  [v4 restart];
}

- (void)reconnect
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reconnect self: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(CSDIDSGroupSession *)self sessionProvider];
  [v4 reconnect];
}

- (void)kickMember:(id)a3
{
  id v4 = a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "member: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [v4 idsDestinations];
  int v7 = +[NSArray arrayWithArray:v6];

  id v8 = [(CSDIDSGroupSession *)self sessionProvider];
  [v8 kickParticipants:v7];
}

- (void)allowMember:(id)a3
{
  id v4 = a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "member: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [v4 idsDestinations];
  int v7 = +[NSArray arrayWithArray:v6];

  id v8 = [(CSDIDSGroupSession *)self sessionProvider];
  [v8 allowParticipants:v7];
}

- (void)requestDataCryptorForTopic:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "requestDataCryptorForTopic: %@ self: %@", (uint8_t *)&v10, 0x16u);
  }

  int v9 = [(CSDIDSGroupSession *)self sessionProvider];
  [v9 requestDataCryptorForTopic:v6 completionHandler:v7];
}

- (void)requestEncryptionKeyForParticipants:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "requestEncryptionKeyForParticipants: %@ topic: %@ self: %@", (uint8_t *)&v10, 0x20u);
  }

  int v9 = [(CSDIDSGroupSession *)self sessionProvider];
  [v9 requestEncryptionKeyForParticipants:v6 topic:v7];
}

- (void)addAliasesToConversationContainer:(id)a3 withSalt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "addAliasesToConversationContainer: %@ salt: %@ self: %@", (uint8_t *)&v10, 0x20u);
  }

  int v9 = [(CSDIDSGroupSession *)self sessionProvider];
  [v9 addAliasesToConversationContainer:v6 withSalt:v7];
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218498;
    unint64_t v12 = a3;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "participantIDForAlias: %llu salt: %@ self: %@", (uint8_t *)&v11, 0x20u);
  }

  id v8 = [(CSDIDSGroupSession *)self sessionProvider];
  id v9 = [v8 participantIDForAlias:a3 salt:v6];

  return (unint64_t)v9;
}

- (void)participantIDForAlias:(unint64_t)a3 salt:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218498;
    unint64_t v13 = a3;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "participantIDForAlias: %llu salt: %@ self: %@", (uint8_t *)&v12, 0x20u);
  }

  int v11 = [(CSDIDSGroupSession *)self sessionProvider];
  [v11 participantIDForAlias:a3 salt:v8 completion:v9];
}

- (NSSet)requiredCapabilities
{
  v2 = [(CSDIDSGroupSession *)self sessionProvider];
  v3 = [v2 requiredCapabilities];

  return (NSSet *)v3;
}

- (NSSet)requiredLackOfCapabilities
{
  v2 = [(CSDIDSGroupSession *)self sessionProvider];
  v3 = [v2 requiredLackOfCapabilities];

  return (NSSet *)v3;
}

- (void)addRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "addRequiredCapabilities: %@ requiredLackOfCapabilities: %@ self: %@", (uint8_t *)&v10, 0x20u);
  }

  id v9 = [(CSDIDSGroupSession *)self sessionProvider];
  [v9 addRequiredCapabilities:v6 requiredLackOfCapabilities:v7];
}

- (void)setParticipantType:(unsigned __int16)a3 forParticipant:(id)a4 members:(id)a5 isLocalParticipant:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218754;
    uint64_t v18 = v8;
    CFStringRef v13 = @"YES";
    __int16 v19 = 2112;
    if (!v6) {
      CFStringRef v13 = @"NO";
    }
    CFStringRef v20 = v13;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setParticipantType: %ld isLocalParticipant: %@, for forParticipant: %@, members: %@", (uint8_t *)&v17, 0x2Au);
  }

  __int16 v14 = [(CSDIDSGroupSession *)self _updateParticipantDestinationIDForParticipant:v10 members:v11];
  id v15 = [(CSDIDSGroupSession *)self sessionProvider];
  __int16 v16 = v15;
  if (v6) {
    [v15 setLocalParticipantType:v8 memberDestinations:v14];
  }
  else {
    [v15 setParticipantType:v8 forRemoteMemberDestinations:v14];
  }
}

- (void)setScreening:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v8 = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSDIDSGroupSession: setScreening: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(CSDIDSGroupSession *)self sessionProvider];
  [v7 setScreening:v3];
}

- (void)setIsUnderlyingLinksConnected:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CSDIDSGroupSession *)self featureFlags];
  unsigned int v6 = [v5 callRecordingEnabled];

  if (v6 && [(CSDIDSGroupSession *)self isUnderlyingLinksConnected] != v3)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      int v10 = 138412290;
      CFStringRef v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting underlying network link status to %@", (uint8_t *)&v10, 0xCu);
    }

    self->_isUnderlyingLinksConnected = v3;
    CFStringRef v9 = [(CSDIDSGroupSession *)self delegate];
    [v9 session:self didReceiveUnderlyingLinksStatus:v3];
  }
}

- (id)_updateParticipantDestinationIDForParticipant:(id)a3 members:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = [(CSDIDSGroupSession *)self participantDestinationIDs];
  id v9 = [v8 mutableCopy];

  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "participantDestinationIDs: %@", buf, 0xCu);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v30;
    *(void *)&long long v13 = 138412290;
    long long v28 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v11);
        }
        int v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v17, "handle", v28);
        __int16 v19 = [v6 handle];
        unsigned int v20 = [v18 isEqualToHandle:v19];

        if (v20)
        {
          __int16 v21 = +[IDSDestination destinationWithTUConversationMember:v17];
          if ([v9 containsObject:v21])
          {
            [v9 removeObject:v21];
            id v22 = [v6 tuConversationParticipant];
            __int16 v23 = +[IDSDestination destinationWithTUConversationParticipant:v22];
            [v9 addObject:v23];

            id v24 = sub_100008DCC();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = [v6 tuConversationParticipant];
              *(_DWORD *)buf = 138412546;
              id v34 = v21;
              __int16 v35 = 2112;
              unsigned int v36 = v25;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "_updateParticipantDestinationIDForParticipant: remove: %@, add: %@", buf, 0x16u);
            }
          }
          else
          {
            id v24 = sub_100008DCC();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v28;
              id v34 = v21;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "_updateParticipantDestinationIDForParticipant: couldn't find idsDestination: %@", buf, 0xCu);
            }
          }
        }
      }
      id v14 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v14);
  }

  id v26 = [v9 copy];

  return v26;
}

- (id)idsDestinationForActiveParticipant:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 participantPushToken];
  if (v4
    && (int v5 = (void *)v4,
        [v3 participantURI],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = [v3 participantPushToken];
    CFStringRef v8 = [v3 participantURI];
    id v9 = (void *)IDSCopyIDForTokenWithID();
  }
  else
  {
    id v9 = [v3 participantURI];
  }

  return v9;
}

- (unint64_t)callTypeForJoinContext:(id)a3
{
  id v4 = a3;
  int v5 = [(CSDIDSGroupSession *)self featureFlags];
  if ([v5 groupFacetimeAsAServiceEnabled])
  {
    id v6 = [v4 provider];
    unsigned int v7 = [v6 supportsVideo];
  }
  else
  {
    unsigned int v7 = 1;
  }

  if (([v4 isVideo] & v7) != 0) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = 2;
  }

  return v8;
}

- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sessionProvider: %@ reason: %d error: %@", (uint8_t *)&v12, 0x1Cu);
  }

  [(CSDIDSGroupSession *)self setJoined:0];
  id v11 = [(CSDIDSGroupSession *)self delegate];
  [v11 session:self endedWithError:v9 reason:v6];
}

- (void)sessionProvider:(id)a3 didJoinGroupWithParticipantIdentifiers:(id)a4 localParticipantIdentifier:(unint64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2048;
    unint64_t v31 = a5;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sessionProvider: %@ participantIDs: %@ localParticipantID: %llu error: %@", buf, 0x2Au);
  }

  [(CSDIDSGroupSession *)self setLocalParticipantIdentifier:a5];
  [(CSDIDSGroupSession *)self setJoined:v12 == 0];
  __int16 v14 = +[NSMutableSet set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v15 = objc_msgSend(v11, "allValues", 0);
  id v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      __int16 v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        [v14 addObjectsFromArray:*(void *)(*((void *)&v21 + 1) + 8 * (void)v19)];
        __int16 v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }

  unsigned int v20 = [(CSDIDSGroupSession *)self delegate];
  objc_msgSend(v20, "session:didJoinGroup:participantIdentifiers:error:", self, -[CSDIDSGroupSession isJoined](self, "isJoined"), v14, v12);
}

- (void)sessionProvider:(id)a3 didLeaveGroupWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sessionProvider: %@ error: %@", (uint8_t *)&v10, 0x16u);
  }

  [(CSDIDSGroupSession *)self setJoined:0];
  id v9 = [(CSDIDSGroupSession *)self delegate];
  [v9 session:self didLeaveGroupWithError:v7];
}

- (void)sessionProvider:(id)a3 didReceiveLocalParticipantType:(unsigned __int16)a4 error:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sessionProvider: %@ participantType: %ld error: %@", (uint8_t *)&v12, 0x20u);
  }

  if (!v9) {
    [(CSDIDSGroupSession *)self setLocalParticipantType:v6];
  }
  id v11 = [(CSDIDSGroupSession *)self delegate];
  [v11 session:self didReceiveLocalParticipantType:v6 error:v9];
}

- (void)sessionProviderDidTerminate:(id)a3
{
  id v4 = a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sessionProviderDidTerminate: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(CSDIDSGroupSession *)self delegate];
  [v6 sessionDidTerminate:self];
}

- (void)sessionProvider:(id)a3 didReceiveActiveParticipants:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    unint64_t v41 = (unint64_t)v8;
    __int16 v42 = 2112;
    id v43 = v9;
    __int16 v44 = 1024;
    BOOL v45 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sessionProvider: %@ activeParticipants: %@ success: %d", buf, 0x1Cu);
  }

  if (v5)
  {
    id v33 = v8;
    [(CSDIDSGroupSession *)self setRetryCount:0];
    id v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v9 count]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v32 = v9;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(obj);
          }
          __int16 v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v17 = [(CSDIDSGroupSession *)self idsDestinationForActiveParticipant:v16];
          uint64_t v18 = self;
          __int16 v19 = (void *)v17;
          if (v17) {
            CFStringRef v20 = (const __CFString *)v17;
          }
          else {
            CFStringRef v20 = &stru_100517F40;
          }
          long long v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v16 participantIdentifier]);
          [v11 setObject:v20 forKeyedSubscript:v21];

          self = v18;
        }
        id v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v13);
    }

    long long v22 = [(CSDIDSGroupSession *)self delegate];
    [v22 session:self receivedActiveParticipantDestinationsByIdentifier:v11];

    id v9 = v32;
    id v8 = v33;
  }
  else
  {
    long long v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Received an error for active remote participants", buf, 2u);
    }

    unint64_t v24 = [(CSDIDSGroupSession *)self retryCount];
    id v25 = [(CSDIDSGroupSession *)self serverBag];
    id v26 = [v25 maxActiveParticipantFetchRetries];

    if (v24 >= (unint64_t)v26)
    {
      id v29 = sub_100008DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v30 = [(CSDIDSGroupSession *)self serverBag];
        id v31 = [v30 maxActiveParticipantFetchRetries];
        *(_DWORD *)buf = 134217984;
        unint64_t v41 = (unint64_t)v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] Not retrying requestActiveParticipants, max retry count (%lu) reached", buf, 0xCu);
      }
    }
    else
    {
      [(CSDIDSGroupSession *)self setRetryCount:(char *)[(CSDIDSGroupSession *)self retryCount] + 1];
      id v27 = sub_100008DCC();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v28 = [(CSDIDSGroupSession *)self retryCount];
        *(_DWORD *)buf = 134217984;
        unint64_t v41 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Retrying requestActiveParticipants, retry_count=%lu", buf, 0xCu);
      }

      [(CSDIDSGroupSession *)self requestActiveParticipants];
    }
  }
}

- (void)sessionProvider:(id)a3 didReceiveActiveLightweightParticipants:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    unint64_t v41 = (unint64_t)v8;
    __int16 v42 = 2112;
    id v43 = v9;
    __int16 v44 = 1024;
    BOOL v45 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sessionProvider: %@ didReceiveActiveLightweightParticipants: %@ success: %d", buf, 0x1Cu);
  }

  if (v5)
  {
    id v33 = v8;
    [(CSDIDSGroupSession *)self setLightweightRetryCount:0];
    id v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v9 count]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v32 = v9;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(obj);
          }
          __int16 v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v17 = [(CSDIDSGroupSession *)self idsDestinationForActiveParticipant:v16];
          uint64_t v18 = self;
          __int16 v19 = (void *)v17;
          if (v17) {
            CFStringRef v20 = (const __CFString *)v17;
          }
          else {
            CFStringRef v20 = &stru_100517F40;
          }
          long long v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v16 participantIdentifier]);
          [v11 setObject:v20 forKeyedSubscript:v21];

          self = v18;
        }
        id v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v13);
    }

    long long v22 = [(CSDIDSGroupSession *)self delegate];
    [v22 session:self receivedActiveLightweightParticipantDestinationsByIdentifier:v11];

    id v9 = v32;
    id v8 = v33;
  }
  else
  {
    long long v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Received an error for active remote participants", buf, 2u);
    }

    unint64_t v24 = [(CSDIDSGroupSession *)self lightweightRetryCount];
    id v25 = [(CSDIDSGroupSession *)self serverBag];
    id v26 = [v25 maxActiveParticipantFetchRetries];

    if (v24 >= (unint64_t)v26)
    {
      id v29 = sub_100008DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v30 = [(CSDIDSGroupSession *)self serverBag];
        id v31 = [v30 maxActiveParticipantFetchRetries];
        *(_DWORD *)buf = 134217984;
        unint64_t v41 = (unint64_t)v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] Not retrying requestActiveLightweightParticipants, max retry count (%lu) reached", buf, 0xCu);
      }
    }
    else
    {
      [(CSDIDSGroupSession *)self setLightweightRetryCount:(char *)[(CSDIDSGroupSession *)self lightweightRetryCount] + 1];
      id v27 = sub_100008DCC();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v28 = [(CSDIDSGroupSession *)self lightweightRetryCount];
        *(_DWORD *)buf = 134217984;
        unint64_t v41 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Retrying requestActiveLightweightParticipants, retry_count=%lu", buf, 0xCu);
      }

      [(CSDIDSGroupSession *)self requestActiveParticipants];
    }
  }
}

- (void)sessionProvider:(id)a3 didReceiveJoinedParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sessionProvider: %@ didReceiveJoinedParticipantID: %llu clientContext: %@", (uint8_t *)&v12, 0x20u);
  }

  id v11 = [(CSDIDSGroupSession *)self delegate];
  [v11 session:self didReceiveJoinedParticipantID:a4 withContext:v9];
}

- (void)sessionProvider:(id)a3 didReceiveLeftParticipantID:(unint64_t)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sessionProvider: %@ didReceiveLeftParticipantID: %llu clientContext: %@", (uint8_t *)&v12, 0x20u);
  }

  id v11 = [(CSDIDSGroupSession *)self delegate];
  [v11 session:self didReceiveLeftParticipantID:a4 withContext:v9];
}

- (void)sessionProvider:(id)a3 didReceiveReport:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDIDSGroupSession *)self delegate];
  [v6 session:self didReceiveReport:v5];
}

- (void)sessionProvider:(id)a3 didReceiveKickedParticipantIDs:(id)a4 withCode:(unsigned int)a5 withType:(unsigned __int16)a6 isTruncated:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = *(void *)&a5;
  id v11 = a4;
  id v12 = [(CSDIDSGroupSession *)self delegate];
  [v12 session:self didReceiveKickedParticipantIDs:v11 withCode:v9 withType:v8 isTruncated:v7];
}

- (void)sessionProvider:(id)a3 didRegisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDIDSGroupSession *)self delegate];
  [v6 session:self didRegisterPluginAllocationInfo:v5];
}

- (void)sessionProvider:(id)a3 didUnregisterPluginAllocationInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDIDSGroupSession *)self delegate];
  [v6 session:self didUnregisterPluginAllocationInfo:v5];
}

- (void)sessionProviderDidReceiveKeyUpdate:(id)a3
{
  id v4 = [(CSDIDSGroupSession *)self delegate];
  [v4 sessionDidReceiveKeyUpdate:self];
}

- (void)sessionProvider:(id)a3 didReceiveDataBlob:(id)a4 forParticipant:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(CSDIDSGroupSession *)self delegate];
  [v9 session:self didReceiveDataBlob:v8 forParticipant:v7];
}

- (void)sessionProvider:(id)a3 didReceiveData:(id)a4 dataType:(unsigned __int16)a5 forParticipant:(id)a6
{
  uint64_t v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = [(CSDIDSGroupSession *)self delegate];
  [v11 session:self didReceiveData:v10 dataType:v6 forParticipant:v9];
}

- (void)sessionProvider:(id)a3 didReceiveServerErrorCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(CSDIDSGroupSession *)self delegate];
  [v6 session:self didReceiveServerErrorCode:v4];
}

- (void)sessionProvider:(id)a3 didReceiveUnderlyingLinksStatus:(BOOL)a4
{
}

- (BOOL)isUnderlyingLinksConnected
{
  return self->_isUnderlyingLinksConnected;
}

- (CSDIDSGroupSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDIDSGroupSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isJoined
{
  return self->_joined;
}

- (void)setJoined:(BOOL)a3
{
  self->_joined = a3;
}

- (unint64_t)localParticipantIdentifier
{
  return self->_localParticipantIdentifier;
}

- (void)setLocalParticipantIdentifier:(unint64_t)a3
{
  self->_localParticipantIdentifier = a3;
}

- (unsigned)localParticipantType
{
  return self->_localParticipantType;
}

- (void)setLocalParticipantType:(unsigned __int16)a3
{
  self->_localParticipantType = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDIDSGroupSessionProvider)sessionProvider
{
  return self->_sessionProvider;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)lightweightRetryCount
{
  return self->_lightweightRetryCount;
}

- (void)setLightweightRetryCount:(unint64_t)a3
{
  self->_lightweightRetryCount = a3;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (NSMutableDictionary)preferences
{
  return self->_preferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_sessionProvider, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end