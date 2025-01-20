@interface CSDAbstractFaceTimeConversationProviderDelegate
- (BOOL)_isWaitingToJoinForConversationUUID:(id)a3;
- (BOOL)hasCallStartedConnectingWithUUID:(id)a3;
- (BOOL)isAudioSessionActive;
- (BOOL)isConversationJoiningOrJoined:(id)a3;
- (BOOL)isLocalMemberOf:(id)a3 associatedTo:(id)a4;
- (BOOL)isManagingCallWithUUID:(id)a3;
- (BOOL)isManagingPendingConversationForCallWithUUID:(id)a3;
- (BOOL)isWaitingToJoinForConversationUUID:(id)a3;
- (BOOL)shouldAutomaticallyLeaveConversation:(id)a3;
- (BOOL)usesAudioSession;
- (CSDAbstractFaceTimeConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5;
- (CSDAbstractFaceTimeConversationProviderDelegate)initWithQueue:(id)a3 conversationManager:(id)a4 networkSupport:(id)a5 serverBag:(id)a6 featureFlags:(id)a7 invitationResolver:(id)a8;
- (CSDConversationInvitationResolving)invitationResolver;
- (CSDConversationManager)conversationManager;
- (CSDConversationServerBag)serverBag;
- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate;
- (CXProvider)provider;
- (FTDeviceSupport)deviceSupport;
- (FTNetworkSupport)networkSupport;
- (NSMutableDictionary)callUUIDsByConversationUUID;
- (NSMutableDictionary)conversationUUIDsByCallUUID;
- (NSMutableSet)callUUIDsUpgradedForAVMode;
- (NSMutableSet)conversationUUIDsAwaitingActiveAudioSession;
- (NSMutableSet)conversationUUIDsWaitingToJoin;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)_findPendingConversationWithCallUUID:(id)a3;
- (id)callUUIDForConversationUUID:(id)a3;
- (id)conversationUUIDForCallUUID:(id)a3;
- (id)pendingConversationUUIDForCallWithUUID:(id)a3;
- (id)providerDidBegin;
- (id)upgradeSessionUUIDForCallWithUUID:(id)a3;
- (void)associateCallUUID:(id)a3 withConversationUUID:(id)a4 waitingToJoin:(BOOL)a5;
- (void)cleanUpConversationIfNecessaryForConversationUUID:(id)a3 failureContext:(id)a4;
- (void)conversationManager:(id)a3 avModeChanged:(unint64_t)a4 toAVMode:(unint64_t)a5 forParticipantWithHandle:(id)a6 forConversation:(id)a7;
- (void)conversationManager:(id)a3 conversation:(id)a4 removedActiveParticipant:(id)a5 withReason:(unint64_t)a6;
- (void)conversationManager:(id)a3 reportedNewIncomingConversation:(id)a4 fromHandle:(id)a5;
- (void)dealloc;
- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3;
- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3;
- (void)endCallWithUUIDAsLocalHangup:(id)a3;
- (void)enqueueConversationWaitingForAudioWithConversationUUID:(id)a3;
- (void)enqueueOrStartAudioForConversationUUID:(id)a3;
- (void)fullfillPendingJoinActionsForCallUUIDIfNecessary:(id)a3;
- (void)handleAudioInterruptionPropertiesChanged:(id)a3;
- (void)leaveConversation:(id)a3 withCallUUID:(id)a4 reason:(int64_t)a5;
- (void)leaveConversationForCallUUID:(id)a3 endedReason:(int64_t)a4;
- (void)proceedToJoinForConversation:(id)a3 action:(id)a4;
- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 timedOutPerformingAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
- (void)removeActiveAudioSessionObjectForConversationWithUUID:(id)a3;
- (void)reportNewIncomingCallForConversation:(id)a3 fromHandle:(id)a4 callUUID:(id)a5 isReRing:(BOOL)a6;
- (void)reportNewIncomingCallForConversation:(id)a3 fromHandle:(id)a4 isReRing:(BOOL)a5;
- (void)setAudioSessionActive:(BOOL)a3;
- (void)setCallUUID:(id)a3 forConversationUUID:(id)a4;
- (void)setConversationUUID:(id)a3 forCallUUID:(id)a4;
- (void)setDeviceSupport:(id)a3;
- (void)setFaceTimeDemuxerDelegate:(id)a3;
- (void)setInvitationResolver:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderDidBegin:(id)a3;
- (void)setWaitingToJoin:(BOOL)a3 forConversationUUID:(id)a4;
- (void)startAudioForConversationsIfNecessary;
- (void)updateNetworkCriticalStateIfNecessary;
@end

@implementation CSDAbstractFaceTimeConversationProviderDelegate

- (CSDAbstractFaceTimeConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)TUFeatureFlags);
  v12 = objc_alloc_init(CSDSharedConversationServerBag);
  v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self initWithQueue:v9 conversationManager:v10 networkSupport:0 serverBag:v12 featureFlags:v11 invitationResolver:v8];

  return v13;
}

- (CSDAbstractFaceTimeConversationProviderDelegate)initWithQueue:(id)a3 conversationManager:(id)a4 networkSupport:(id)a5 serverBag:(id)a6 featureFlags:(id)a7 invitationResolver:(id)a8
{
  id v36 = a3;
  id v35 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v37.receiver = self;
  v37.super_class = (Class)CSDAbstractFaceTimeConversationProviderDelegate;
  v19 = [(CSDAbstractFaceTimeConversationProviderDelegate *)&v37 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_queue, a3);
    objc_storeStrong((id *)&v20->_conversationManager, a4);
    -[CSDConversationManager addDelegate:queue:](v20->_conversationManager, "addDelegate:queue:", v20, v20->_queue, v35, v36);
    if (v15)
    {
      v21 = (FTNetworkSupport *)v15;
    }
    else
    {
      v21 = +[FTNetworkSupport sharedInstance];
    }
    networkSupport = v20->_networkSupport;
    v20->_networkSupport = v21;

    objc_storeStrong((id *)&v20->_serverBag, a6);
    objc_storeStrong((id *)&v20->_invitationResolver, a8);
    objc_storeStrong((id *)&v20->_featureFlags, a7);
    uint64_t v23 = +[NSMutableSet set];
    conversationUUIDsWaitingToJoin = v20->_conversationUUIDsWaitingToJoin;
    v20->_conversationUUIDsWaitingToJoin = (NSMutableSet *)v23;

    uint64_t v25 = +[NSMutableDictionary dictionary];
    callUUIDsByConversationUUID = v20->_callUUIDsByConversationUUID;
    v20->_callUUIDsByConversationUUID = (NSMutableDictionary *)v25;

    uint64_t v27 = +[NSMutableDictionary dictionary];
    conversationUUIDsByCallUUID = v20->_conversationUUIDsByCallUUID;
    v20->_conversationUUIDsByCallUUID = (NSMutableDictionary *)v27;

    uint64_t v29 = +[NSMutableSet set];
    conversationUUIDsAwaitingActiveAudioSession = v20->_conversationUUIDsAwaitingActiveAudioSession;
    v20->_conversationUUIDsAwaitingActiveAudioSession = (NSMutableSet *)v29;

    uint64_t v31 = +[NSMutableSet set];
    callUUIDsUpgradedForAVMode = v20->_callUUIDsUpgradedForAVMode;
    v20->_callUUIDsUpgradedForAVMode = (NSMutableSet *)v31;

    v33 = +[NSNotificationCenter defaultCenter];
    [v33 addObserver:v20 selector:"handleAudioInterruptionPropertiesChanged:" name:@"CSDCallAudioInterruptionPropertiesChangedNotification" object:0];
  }
  return v20;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDAbstractFaceTimeConversationProviderDelegate;
  [(CSDAbstractFaceTimeConversationProviderDelegate *)&v4 dealloc];
}

- (NSMutableSet)conversationUUIDsWaitingToJoin
{
  v3 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  conversationUUIDsWaitingToJoin = self->_conversationUUIDsWaitingToJoin;

  return conversationUUIDsWaitingToJoin;
}

- (BOOL)isWaitingToJoinForConversationUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E89B0;
  block[3] = &unk_100507368;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)_isWaitingToJoinForConversationUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsWaitingToJoin];
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (void)setWaitingToJoin:(BOOL)a3 forConversationUUID:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  if (v9)
  {
    v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsWaitingToJoin];
    id v8 = v7;
    if (v4) {
      [v7 addObject:v9];
    }
    else {
      [v7 removeObject:v9];
    }
  }
}

- (NSMutableDictionary)callUUIDsByConversationUUID
{
  v3 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  callUUIDsByConversationUUID = self->_callUUIDsByConversationUUID;

  return callUUIDsByConversationUUID;
}

- (id)callUUIDForConversationUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1001E8C80;
  id v16 = sub_1001E8C90;
  id v17 = 0;
  v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E8C98;
  block[3] = &unk_100507368;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setCallUUID:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  [v9 setObject:v7 forKeyedSubscript:v6];
}

- (void)removeActiveAudioSessionObjectForConversationWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsAwaitingActiveAudioSession];
  [v6 removeObject:v4];
}

- (void)updateNetworkCriticalStateIfNecessary
{
  v3 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  v5 = [v4 allKeys];
  id v6 = [v5 count];

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v6) {
      CFStringRef v8 = @"YES";
    }
    int v10 = 138412290;
    CFStringRef v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting enableCriticalReliability %@", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self networkSupport];
  [v9 setEnableCriticalReliability:v6 != 0];
}

- (NSMutableDictionary)conversationUUIDsByCallUUID
{
  v3 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  conversationUUIDsByCallUUID = self->_conversationUUIDsByCallUUID;

  return conversationUUIDsByCallUUID;
}

- (id)conversationUUIDForCallUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1001E8C80;
  id v16 = sub_1001E8C90;
  id v17 = 0;
  v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E90CC;
  block[3] = &unk_100507368;
  id v10 = v4;
  CFStringRef v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setConversationUUID:(id)a3 forCallUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringRef v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  [v9 setObject:v7 forKeyedSubscript:v6];
}

- (void)handleAudioInterruptionPropertiesChanged:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"CSDCallAudioInterruptionProviderUserInfoKey"];
  unsigned int v6 = [v5 isEqualToString:@"CSDCallAudioInterruptionProviderUserInfoAVAudioClient"];

  if (v6)
  {
    id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001E92A8;
    block[3] = &unk_100504EC0;
    block[4] = self;
    dispatch_async(v7, block);
  }
}

- (BOOL)usesAudioSession
{
  return 1;
}

- (void)enqueueConversationWaitingForAudioWithConversationUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsAwaitingActiveAudioSession];
  [v5 addObject:v4];

  [(CSDAbstractFaceTimeConversationProviderDelegate *)self startAudioForConversationsIfNecessary];
}

- (void)enqueueOrStartAudioForConversationUUID:(id)a3
{
  id v7 = a3;
  id v4 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned __int8 v5 = [v4 isConversationWithUUIDRedirectingAudio:v7];

  if (v5)
  {
    unsigned int v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    [v6 startAudioForConversationWithUUID:v7];
  }
  else
  {
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self enqueueConversationWaitingForAudioWithConversationUUID:v7];
  }
}

- (void)startAudioForConversationsIfNecessary
{
  if ([(CSDAbstractFaceTimeConversationProviderDelegate *)self usesAudioSession]
    && ![(CSDAbstractFaceTimeConversationProviderDelegate *)self isAudioSessionActive])
  {
    CFStringRef v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if ([(CSDAbstractFaceTimeConversationProviderDelegate *)self usesAudioSession]) {
        CFStringRef v12 = @"YES";
      }
      else {
        CFStringRef v12 = @"NO";
      }
      if ([(CSDAbstractFaceTimeConversationProviderDelegate *)self isAudioSessionActive]) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v19 = v12;
      __int16 v20 = 2112;
      CFStringRef v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not starting audio for conversation: usesAudioSession: %@, isAudioSessionActive: %@", buf, 0x16u);
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v3 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsAwaitingActiveAudioSession];
    id v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          CFStringRef v8 = *(const __CFString **)(*((void *)&v14 + 1) + 8 * i);
          id v9 = sub_100008DCC();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v19 = v8;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting audio for conversation with conversationUUID %@", buf, 0xCu);
          }

          id v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
          [v10 startAudioForConversationWithUUID:v8];
        }
        id v5 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v5);
    }

    CFStringRef v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsAwaitingActiveAudioSession];
    [v11 removeAllObjects];
  }
}

- (id)_findPendingConversationWithCallUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v7 = [v6 pseudonymsByCallUUID];
    CFStringRef v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v9 = [v8 conversationsByUUID];
    *(_DWORD *)buf = 138412546;
    v33 = v7;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pseudonymsByCallUUID: %@, conversationsByUUID: %@", buf, 0x16u);
  }
  id v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  CFStringRef v11 = [v10 pseudonymsByCallUUID];
  CFStringRef v12 = [v11 objectForKeyedSubscript:v4];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  CFStringRef v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  long long v14 = [v13 conversationsByUUID];
  long long v15 = [v14 allValues];

  id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    id v26 = v4;
    uint64_t v17 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v15);
        }
        CFStringRef v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v19 isPendingConversation])
        {
          uint64_t v20 = [v19 link];
          if (v20)
          {
            CFStringRef v21 = (void *)v20;
            v22 = [v19 link];
            uint64_t v23 = [v22 pseudonym];
            unsigned int v24 = [v23 isEqualToString:v12];

            if (v24)
            {
              id v16 = v19;
              goto LABEL_15;
            }
          }
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16) {
        continue;
      }
      break;
    }
LABEL_15:
    id v4 = v26;
  }

  return v16;
}

- (void)associateCallUUID:(id)a3 withConversationUUID:(id)a4 waitingToJoin:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(CSDAbstractFaceTimeConversationProviderDelegate *)self setCallUUID:v9 forConversationUUID:v8];
  [(CSDAbstractFaceTimeConversationProviderDelegate *)self setConversationUUID:v8 forCallUUID:v9];

  [(CSDAbstractFaceTimeConversationProviderDelegate *)self setWaitingToJoin:v5 forConversationUUID:v8];

  [(CSDAbstractFaceTimeConversationProviderDelegate *)self updateNetworkCriticalStateIfNecessary];
}

- (void)conversationManager:(id)a3 reportedNewIncomingConversation:(id)a4 fromHandle:(id)a5
{
  id v7 = (CSDAbstractFaceTimeConversationProviderDelegate *)a4;
  id v8 = (CSDAbstractFaceTimeConversationProviderDelegate *)a5;
  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 provider];
  unsigned __int8 v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self shouldHandleProvider:v10];

  CFStringRef v12 = sub_100008DCC();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      int v18 = 138412546;
      CFStringRef v19 = v7;
      __int16 v20 = 2112;
      CFStringRef v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Conversation manager reported a new incoming conversation %@ from handle %@", (uint8_t *)&v18, 0x16u);
    }

    long long v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
    long long v15 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 UUID];
    CFStringRef v12 = [v14 objectForKeyedSubscript:v15];

    if (v12)
    {
      id v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 UUID];
        int v18 = 138412546;
        CFStringRef v19 = v17;
        __int16 v20 = 2112;
        CFStringRef v21 = (CSDAbstractFaceTimeConversationProviderDelegate *)v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Ignoring new conversation %@ since we are already tracking this with call %@", (uint8_t *)&v18, 0x16u);
      }
    }
    else
    {
      [(CSDAbstractFaceTimeConversationProviderDelegate *)self reportNewIncomingCallForConversation:v7 fromHandle:v8 isReRing:0];
    }
  }
  else if (v13)
  {
    int v18 = 138412546;
    CFStringRef v19 = self;
    __int16 v20 = 2112;
    CFStringRef v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ should not handle conversation: %@", (uint8_t *)&v18, 0x16u);
  }
}

- (void)conversationManager:(id)a3 avModeChanged:(unint64_t)a4 toAVMode:(unint64_t)a5 forParticipantWithHandle:(id)a6 forConversation:(id)a7
{
  id v9 = a6;
  id v10 = a7;
  unsigned __int8 v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  CFStringRef v12 = [v10 UUID];
  BOOL v13 = [v11 objectForKeyedSubscript:v12];

  if (v13)
  {
    long long v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v10 UUID];
      int v18 = 138412546;
      CFStringRef v19 = v13;
      __int16 v20 = 2112;
      CFStringRef v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping to report a new call since we already have a call with UUID: %@ for conversationUUID: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    id v16 = +[NSUUID UUID];
    uint64_t v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsUpgradedForAVMode];
    [v17 addObject:v16];

    [(CSDAbstractFaceTimeConversationProviderDelegate *)self reportNewIncomingCallForConversation:v10 fromHandle:v9 callUUID:v16 isReRing:0];
  }
}

- (void)reportNewIncomingCallForConversation:(id)a3 fromHandle:(id)a4 isReRing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSUUID UUID];
  [(CSDAbstractFaceTimeConversationProviderDelegate *)self reportNewIncomingCallForConversation:v9 fromHandle:v8 callUUID:v10 isReRing:v5];
}

- (void)reportNewIncomingCallForConversation:(id)a3 fromHandle:(id)a4 callUUID:(id)a5 isReRing:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [v10 remoteMembers];
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_1001EA764;
  v97[3] = &unk_10050A750;
  id v14 = v11;
  id v98 = v14;
  id v15 = v10;
  id v99 = v15;
  unsigned int v16 = objc_msgSend(v13, "tu_containsObjectPassingTest:", v97);

  if (v16)
  {
    uint64_t v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [v15 UUID];
      *(_DWORD *)buf = 138412290;
      v104 = v18;
      CFStringRef v19 = "Incoming call is from associated handle; will not report incoming call for conversation with UUID %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

      goto LABEL_49;
    }
    goto LABEL_49;
  }
  if (([v15 isEligibleForCall] & 1) == 0
    && ([v15 anyActiveParticipantHasAV] & 1) == 0)
  {
    uint64_t v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [v15 UUID];
      *(_DWORD *)buf = 138412290;
      v104 = v18;
      CFStringRef v19 = "Conversation is not call eligible; will not report incoming call for conversation with UUID %@";
      goto LABEL_16;
    }
    goto LABEL_49;
  }
  __int16 v20 = [v15 provider];
  unsigned __int8 v21 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self shouldHandleProvider:v20];

  if ((v21 & 1) == 0)
  {
    uint64_t v17 = sub_100008DCC();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 138412546;
    v104 = self;
    __int16 v105 = 2112;
    id v106 = v15;
    long long v27 = "%@ should not handle conversation: %@";
    long long v28 = v17;
    uint32_t v29 = 22;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
    goto LABEL_49;
  }
  v22 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self networkSupport];
  unsigned __int8 v23 = [v22 validNetworkReachable];

  if ((v23 & 1) == 0)
  {
    uint64_t v17 = sub_100008DCC();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    long long v27 = "Not reporting call since validNetworkReachable is false";
    long long v28 = v17;
    uint32_t v29 = 2;
    goto LABEL_19;
  }
  unsigned int v24 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self deviceSupport];
  if (([v24 isGreenTea] & 1) == 0)
  {

LABEL_21:
    BOOL v76 = v6;
    long long v30 = [v15 UUID];
    v79 = v12;
    v80 = self;
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self associateCallUUID:v12 withConversationUUID:v30 waitingToJoin:1];

    uint64_t v31 = [v15 remoteMembers];
    uint64_t v17 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v31 count]);

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v32 = [v15 remoteMembers];
    id v33 = [v32 countByEnumeratingWithState:&v93 objects:v102 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v94;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v94 != v35) {
            objc_enumerationMutation(v32);
          }
          objc_super v37 = [*(id *)(*((void *)&v93 + 1) + 8 * i) handle];
          v38 = +[CXHandle handleWithTUHandle:v37];
          [v17 addObject:v38];
        }
        id v34 = [v32 countByEnumeratingWithState:&v93 objects:v102 count:16];
      }
      while (v34);
    }

    v39 = [v15 otherInvitedHandles];
    v40 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v39 count]);

    long long v91 = 0u;
    long long v92 = 0u;
    long long v90 = 0u;
    long long v89 = 0u;
    v41 = [v15 otherInvitedHandles];
    id v42 = [v41 countByEnumeratingWithState:&v89 objects:v101 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v90;
      do
      {
        for (j = 0; j != v43; j = (char *)j + 1)
        {
          if (*(void *)v90 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = +[CXHandle handleWithTUHandle:*(void *)(*((void *)&v89 + 1) + 8 * (void)j)];
          [v40 addObject:v46];
        }
        id v43 = [v41 countByEnumeratingWithState:&v89 objects:v101 count:16];
      }
      while (v43);
    }

    id v47 = [objc_alloc((Class)CXCallUpdate) initWithTUConversation:v15];
    [v47 setRemoteParticipantHandles:v17];
    v48 = +[CXHandle handleWithTUHandle:v14];
    [v47 setRemoteHandle:v48];

    [v47 setConversation:1];
    [v47 setIsReRing:v76];
    v49 = [v47 localSenderIdentityUUID];

    v50 = v80;
    if (!v49)
    {
      v51 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v80 conversationManager];
      v52 = [v15 localMember];
      v53 = [v52 handle];
      v54 = [v51 senderIdentityUUIDForCallerIDHandle:v53];
      [v47 setLocalSenderIdentityUUID:v54];
    }
    v55 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v80 featureFlags];
    if (-[CSDAbstractFaceTimeConversationProviderDelegate avLessSharePlayEnabled](v55, "avLessSharePlayEnabled")&& ![v15 avMode])
    {
      unsigned __int8 v66 = [v47 hasVideo];

      if (v66) {
        goto LABEL_40;
      }
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      v67 = [v15 activeRemoteParticipants];
      id v68 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v67 countByEnumeratingWithState:&v85 objects:v100 count:16];
      if (v68)
      {
        id v69 = v68;
        v75 = v47;
        uint64_t v78 = *(void *)v86;
LABEL_53:
        uint64_t v70 = 0;
        while (1)
        {
          if (*(void *)v86 != v78) {
            objc_enumerationMutation(v67);
          }
          v71 = *(void **)(*((void *)&v85 + 1) + 8 * v70);
          v72 = [v71 handle];
          unsigned __int8 v73 = [v72 isEquivalentToHandle:v14];

          if (v73) {
            break;
          }
          if (v69 == (id)++v70)
          {
            id v69 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v67 countByEnumeratingWithState:&v85 objects:v100 count:16];
            if (v69) {
              goto LABEL_53;
            }
            v55 = v67;
            v50 = v80;
            id v47 = v75;
            goto LABEL_39;
          }
        }
        v55 = v71;

        v50 = v80;
        id v47 = v75;
        if (!v55) {
          goto LABEL_40;
        }
        v74 = sub_100008DCC();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v104 = v55;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Incoming invite is from an participant %@, upgrading CXCallUpdate", buf, 0xCu);
        }

        objc_msgSend(v75, "updatePropertiesForVideo:", -[CSDAbstractFaceTimeConversationProviderDelegate audioVideoMode](v55, "audioVideoMode") == (id)2);
      }
      else
      {
        v55 = v67;
      }
    }
LABEL_39:

LABEL_40:
    if ([v47 hasVideo])
    {
      v56 = [v47 remoteParticipantHandles];
      id v57 = [v56 count];

      if ((unint64_t)v57 >= 2) {
        objc_msgSend(v47, "setSendingVideo:", objc_msgSend(v15, "resolvedAudioVideoMode") == (id)2);
      }
    }
    v58 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v50 featureFlags];
    if ([v58 dualSIMRingtoneEnabled])
    {
      uint64_t v59 = [v15 localMember];
      if (v59)
      {
        v60 = (void *)v59;
        v81 = [v15 localMember];
        v61 = [v81 handle];
        v62 = [v61 normalizedValue];
        unsigned int v77 = [v62 _appearsToBePhoneNumber];

        if (!v77)
        {
LABEL_48:
          v65 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v50 provider];
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = sub_1001EA828;
          v82[3] = &unk_1005055F8;
          v82[4] = v50;
          id v83 = v15;
          id v12 = v79;
          id v84 = v79;
          [v65 reportNewIncomingCallWithUUID:v84 update:v47 completion:v82];

          goto LABEL_49;
        }
        v58 = [v15 localMember];
        v63 = [v58 handle];
        v64 = [v63 normalizedValue];
        [v47 setLocalMemberHandleValue:v64];
      }
    }

    goto LABEL_48;
  }
  uint64_t v25 = [v15 remoteMembers];
  id v26 = [v25 count];

  if ((unint64_t)v26 < 2) {
    goto LABEL_21;
  }
  uint64_t v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = [v15 remoteMembers];
    *(_DWORD *)buf = 138412290;
    v104 = v18;
    CFStringRef v19 = "[WARN] GreenTea device does not support multiple remote members. remoteMembers = %@";
    goto LABEL_16;
  }
LABEL_49:
}

- (void)fullfillPendingJoinActionsForCallUUIDIfNecessary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
  id v7 = [v6 pendingCallActionsOfClass:objc_opt_class() withCallUUID:v4];

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self faceTimeDemuxerDelegate];
  unsigned int v9 = [v8 providerDelegate:self isExclusivelyManagingCallWithUUID:v4];

  if (v9)
  {
    id v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    id v11 = [v10 pendingCallActionsOfClass:objc_opt_class() withCallUUID:v4];

    if ([v11 count])
    {
      id v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Also going to fulfill start call actions: %@ since we are exclusively managing this call", buf, 0xCu);
      }
    }
    uint64_t v13 = [v7 arrayByAddingObjectsFromArray:v11];

    id v7 = (void *)v13;
  }
  if ([v7 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v7;
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        int v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v18), "fulfill", (void)v21);
          int v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }
  }
  CFStringRef v19 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  __int16 v20 = [v19 objectForKeyedSubscript:v4];

  if (v20) {
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self setWaitingToJoin:0 forConversationUUID:v20];
  }
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7) {
    goto LABEL_4;
  }
  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v9 = [v8 conversationsByUUID];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if (v10) {
    BOOL v11 = 1;
  }
  else {
LABEL_4:
  }
    BOOL v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self isManagingPendingConversationForCallWithUUID:v4];

  return v11;
}

- (BOOL)isManagingPendingConversationForCallWithUUID:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  BOOL v6 = [v5 conversationsByUUID];
  id v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
        id v14 = [v12 UUID];
        id v15 = [v13 objectForKeyedSubscript:v14];
        unsigned __int8 v16 = [v15 isEqual:v4];

        if (v16)
        {
          BOOL v17 = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (id)pendingConversationUUIDForCallWithUUID:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  BOOL v6 = [v5 conversationsByUUID];
  id v7 = [v6 allValues];

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
        id v14 = [v12 UUID];
        id v15 = [v13 objectForKeyedSubscript:v14];
        unsigned int v16 = [v15 isEqual:v4];

        if (v16)
        {
          BOOL v17 = [v12 UUID];
          goto LABEL_11;
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (BOOL)hasCallStartedConnectingWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v8 = [v7 conversationsByUUID];
    id v9 = [v8 objectForKeyedSubscript:v6];

    if (v9) {
      BOOL v10 = ((unint64_t)[v9 state] & 0xFFFFFFFFFFFFFFFELL) == 2;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)upgradeSessionUUIDForCallWithUUID:(id)a3
{
  return 0;
}

- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "endCallWithUUIDAsAnsweredElsewhere: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDAbstractFaceTimeConversationProviderDelegate *)self leaveConversationForCallUUID:v4 endedReason:4];
}

- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "endCallWithUUIDAsDeclinedElsewhere: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDAbstractFaceTimeConversationProviderDelegate *)self leaveConversationForCallUUID:v4 endedReason:5];
}

- (void)endCallWithUUIDAsLocalHangup:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "endCallWithUUIDAsLocalHangup: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDAbstractFaceTimeConversationProviderDelegate *)self leaveConversationForCallUUID:v4 endedReason:-1];
}

- (void)cleanUpConversationIfNecessaryForConversationUUID:(id)a3 failureContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  BOOL v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    BOOL v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003B2818((uint64_t)v6, (uint64_t)v10, v11);
    }

    id v12 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    [v12 reportCallWithUUID:v10 failedAtDate:0 withContext:v7];

    uint64_t v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self faceTimeDemuxerDelegate];
    id v14 = +[NSDate now];
    id v30 = v7;
    [v13 providerDelegate:self callWithUUID:v10 endedAtDate:v14 withReason:1 failureContext:v7];

    id v15 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    [v15 leaveConversationWithUUID:v6];

    unsigned int v16 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsUpgradedForAVMode];
    [v16 removeObject:v10];

    [(CSDAbstractFaceTimeConversationProviderDelegate *)self setCallUUID:0 forConversationUUID:v6];
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self setConversationUUID:0 forCallUUID:v10];
    BOOL v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsAwaitingActiveAudioSession];
    id v31 = v6;
    [v17 removeObject:v6];

    [(CSDAbstractFaceTimeConversationProviderDelegate *)self updateNetworkCriticalStateIfNecessary];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    int v18 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    long long v19 = [v18 pendingTransactions];

    id obj = v19;
    id v34 = [v19 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v40;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v22 = [v21 actions];
          id v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v36;
            do
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v36 != v25) {
                  objc_enumerationMutation(v22);
                }
                long long v27 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v28 = [v27 callUUID];
                  unsigned int v29 = [v28 isEqual:v10];

                  if (v29) {
                    [v27 fail];
                  }
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v24);
          }
        }
        id v34 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v34);
    }

    [(CSDAbstractFaceTimeConversationProviderDelegate *)self endCallWithUUIDAsLocalHangup:v10];
    id v6 = v31;
    id v7 = v30;
  }
}

- (void)leaveConversationForCallUUID:(id)a3 endedReason:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  id v8 = [v7 copy];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v13);
        id v15 = [v9 objectForKeyedSubscript:v14];
        unsigned int v16 = [v15 isEqual:v5];

        if (v16)
        {
          BOOL v17 = sub_100008DCC();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found an extra conversation that needs to be cleaned up: %@", buf, 0xCu);
          }

          int v18 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
          long long v19 = [v18 conversationsByUUID];
          long long v20 = [v19 objectForKeyedSubscript:v14];

          if (v20
            && ([v20 provider],
                long long v21 = objc_claimAutoreleasedReturnValue(),
                unsigned int v22 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self shouldHandleProvider:v21], v21, v22))
          {
            if ([v20 avMode])
            {
              [(CSDAbstractFaceTimeConversationProviderDelegate *)self leaveConversation:v20 withCallUUID:v5 reason:a4];
LABEL_17:

              goto LABEL_18;
            }
            id v23 = sub_100008DCC();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v34 = v20;
              id v24 = v23;
              uint64_t v25 = "Not leaving avless conversation on call ending %@";
              uint32_t v26 = 12;
LABEL_15:
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
            }
          }
          else
          {
            id v23 = sub_100008DCC();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v34 = v14;
              __int16 v35 = 2112;
              id v36 = v5;
              id v24 = v23;
              uint64_t v25 = "[WARN] Asked to clean up conversation from our list but could not find it in conversation manager li"
                    "st: %@ callUUID: %@";
              uint32_t v26 = 22;
              goto LABEL_15;
            }
          }

          goto LABEL_17;
        }
LABEL_18:
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v27 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
      id v11 = v27;
    }
    while (v27);
  }
}

- (void)leaveConversation:(id)a3 withCallUUID:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = (CSDAbstractFaceTimeConversationProviderDelegate *)a4;
  id v10 = [v8 provider];
  unsigned __int8 v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self shouldHandleProvider:v10];

  if (v11)
  {
    uint64_t v12 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
    if ([v12 avLessSharePlayEnabled] && !objc_msgSend(v8, "avMode"))
    {
      long long v19 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsUpgradedForAVMode];
      unsigned int v20 = [v19 containsObject:v9];

      if (v20)
      {
        sub_100008DCC();
        uint64_t v13 = (CSDConversationLeaveContext *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        id v14 = [v8 UUID];
        int v21 = 138412546;
        unsigned int v22 = v9;
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, &v13->super, OS_LOG_TYPE_DEFAULT, "Not leaving conversation but stopped tracking callUUID: %@ for conversationUUID: %@", (uint8_t *)&v21, 0x16u);
LABEL_6:

LABEL_7:
        unsigned int v16 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsUpgradedForAVMode];
        [v16 removeObject:v9];

        BOOL v17 = [v8 UUID];
        [(CSDAbstractFaceTimeConversationProviderDelegate *)self setCallUUID:0 forConversationUUID:v17];

        [(CSDAbstractFaceTimeConversationProviderDelegate *)self setConversationUUID:0 forCallUUID:v9];
        [(CSDAbstractFaceTimeConversationProviderDelegate *)self updateNetworkCriticalStateIfNecessary];
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v13 = [[CSDConversationLeaveContext alloc] initWithLeaveReason:a5 == 102];
    id v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v15 = [v8 UUID];
    [v14 leaveConversationWithUUID:v15 withContext:v13];

    goto LABEL_6;
  }
  int v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    unsigned int v22 = self;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ should not handle conversation: %@", (uint8_t *)&v21, 0x16u);
  }

LABEL_11:
}

- (FTDeviceSupport)deviceSupport
{
  deviceSupport = self->_deviceSupport;
  if (deviceSupport)
  {
    v3 = deviceSupport;
  }
  else
  {
    v3 = +[FTDeviceSupport sharedInstance];
  }

  return v3;
}

- (void)proceedToJoinForConversation:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = (CSDAbstractFaceTimeConversationProviderDelegate *)a4;
  id v8 = [v6 provider];
  unsigned __int8 v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self shouldHandleProvider:v8];

  if (v9)
  {
    id v10 = [v6 UUID];
    unsigned __int8 v11 = [v6 localMember];
    uint64_t v12 = [v11 handle];

    if (!v12)
    {
      [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 fail];
      goto LABEL_60;
    }
    uint64_t v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
    if ([v13 avLessSharePlayEnabled])
    {
      id v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 avMode];

      if (!v14) {
        goto LABEL_16;
      }
    }
    else
    {
      unsigned int v15 = [v6 isEligibleForCall];

      if (!v15) {
        goto LABEL_16;
      }
    }
    unsigned int v16 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 callUUID];
    id v17 = [objc_alloc((Class)CXCallUpdate) initWithTUConversation:v6];
    int v18 = [v17 localSenderIdentityUUID];

    if (!v18)
    {
      long long v19 = v10;
      if ([v6 isLocallyCreated])
      {
        unsigned int v20 = [v6 initiator];
      }
      else
      {
        int v21 = [v6 localMember];
        unsigned int v20 = [v21 handle];
      }
      unsigned int v22 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      __int16 v23 = [v22 senderIdentityUUIDForCallerIDHandle:v20];
      [v17 setLocalSenderIdentityUUID:v23];

      id v10 = v19;
    }
    id v24 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    uint64_t v25 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 callUUID];
    [v24 reportCallWithUUID:v25 updated:v17];

    [(CSDAbstractFaceTimeConversationProviderDelegate *)self associateCallUUID:v16 withConversationUUID:v10 waitingToJoin:1];
LABEL_16:
    uint32_t v26 = objc_alloc_init(CSDConversationJoinContext);
    [(CSDConversationJoinContext *)v26 setShouldSuppressInCallUI:[(CSDAbstractFaceTimeConversationProviderDelegate *)v7 shouldSuppressInCallUI]];
    [(CSDConversationJoinContext *)v26 setWantsStagingArea:[(CSDAbstractFaceTimeConversationProviderDelegate *)v7 wantsStagingArea]];
    if ([(CSDAbstractFaceTimeConversationProviderDelegate *)v7 isVideoEnabled])
    {
      id v27 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
      if ([v27 groupFacetimeAsAServiceEnabled])
      {
        long long v28 = [v6 provider];
        -[CSDConversationJoinContext setVideoEnabled:](v26, "setVideoEnabled:", [v28 supportsVideo]);
      }
      else
      {
        [(CSDConversationJoinContext *)v26 setVideoEnabled:1];
      }
    }
    else
    {
      [(CSDConversationJoinContext *)v26 setVideoEnabled:0];
    }
    [(CSDConversationJoinContext *)v26 setVideo:[(CSDAbstractFaceTimeConversationProviderDelegate *)v7 isVideo]];
    [(CSDConversationJoinContext *)v26 setUpgrade:[(CSDAbstractFaceTimeConversationProviderDelegate *)v7 isUpgrade]];
    long long v29 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 upgradeSessionUUID];
    [(CSDConversationJoinContext *)v26 setUpgradeSessionUUID:v29];

    long long v30 = [v6 provider];
    [(CSDConversationJoinContext *)v26 setProvider:v30];

    [(CSDConversationJoinContext *)v26 setAvMode:(int)[(CSDAbstractFaceTimeConversationProviderDelegate *)v7 avMode]];
    [(CSDConversationJoinContext *)v26 setPresentationMode:[(CSDAbstractFaceTimeConversationProviderDelegate *)v7 presentationMode]];
    long long v31 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 joinCallActivity];
    long long v32 = [v31 tuActivity];
    [(CSDConversationJoinContext *)v26 setActivity:v32];

    uint64_t v33 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
    LODWORD(v32) = [v33 callScreeningEnabled];

    if (v32) {
      [(CSDConversationJoinContext *)v26 setScreening:[(CSDAbstractFaceTimeConversationProviderDelegate *)v7 isScreening]];
    }
    id v34 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
    if ([v34 conversationHandoffEnabled])
    {
      __int16 v35 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 associationIdentifier];

      if (!v35) {
        goto LABEL_28;
      }
      id v36 = objc_alloc_init((Class)TUConversationParticipantAssociation);
      [(CSDConversationJoinContext *)v26 setParticipantAssociation:v36];

      long long v37 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 associationIdentifier];
      id v38 = [v37 unsignedLongLongValue];
      long long v39 = [(CSDConversationJoinContext *)v26 participantAssociation];
      [v39 setIdentifier:v38];

      id v34 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 associationAVCIdentifier];
      long long v40 = [(CSDConversationJoinContext *)v26 participantAssociation];
      [v40 setAvcIdentifier:v34];
    }
LABEL_28:
    long long v41 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
    unsigned int v42 = [v41 usesModernScreenSharingFromMessages];

    if (v42)
    {
      id v43 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 tuScreenSharingRequest];
      [(CSDConversationJoinContext *)v26 setScreenSharingRequest:v43];
    }
    uint64_t v44 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 notificationStylesByHandleType];
    id v45 = [v44 count];

    if (v45)
    {
      id v84 = v26;
      long long v85 = v10;
      long long v86 = self;
      v46 = +[NSMutableSet set];
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v47 = v7;
      id obj = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 notificationStylesByHandleType];
      id v48 = [obj countByEnumeratingWithState:&v88 objects:v92 count:16];
      if (v48)
      {
        id v49 = v48;
        uint64_t v50 = *(void *)v89;
        do
        {
          for (i = 0; i != v49; i = (char *)i + 1)
          {
            if (*(void *)v89 != v50) {
              objc_enumerationMutation(obj);
            }
            v52 = *(void **)(*((void *)&v88 + 1) + 8 * i);
            id v53 = objc_alloc((Class)TUConversationInvitationPreference);
            id v54 = [v52 integerValue];
            v55 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v47 notificationStylesByHandleType];
            v56 = [v55 objectForKeyedSubscript:v52];
            id v57 = objc_msgSend(v53, "initWithHandleType:notificationStyles:", v54, objc_msgSend(v56, "integerValue"));

            [v46 addObject:v57];
          }
          id v49 = [obj countByEnumeratingWithState:&v88 objects:v92 count:16];
        }
        while (v49);
      }

      id v58 = [v46 copy];
      uint32_t v26 = v84;
      [(CSDConversationJoinContext *)v84 setInvitationPreferences:v58];

      uint64_t v59 = sub_100008DCC();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = [(CSDConversationJoinContext *)v84 invitationPreferences];
        *(_DWORD *)buf = 138412290;
        long long v94 = v60;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Invitation preferences were set on the action, using those for the join context: %@", buf, 0xCu);
      }
      self = v86;
      id v7 = v47;
      id v10 = v85;
    }
    else
    {
      v80 = [v6 invitationPreferences];

      if (!v80) {
        goto LABEL_42;
      }
      v81 = [v6 invitationPreferences];
      id v82 = [v81 copy];
      [(CSDConversationJoinContext *)v26 setInvitationPreferences:v82];

      v46 = sub_100008DCC();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        id v83 = [(CSDConversationJoinContext *)v26 invitationPreferences];
        *(_DWORD *)buf = 138412290;
        long long v94 = v83;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Invitation preferences weren't set on the action but existed on the conversation, using those for the join context: %@", buf, 0xCu);
      }
    }

LABEL_42:
    v61 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 collaborationIdentifier];

    if (v61)
    {
      v62 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 collaborationIdentifier];
      [(CSDConversationJoinContext *)v26 setCollaborationIdentifier:v62];
    }
    v63 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsUpgradedForAVMode];
    v64 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 callUUID];
    unsigned __int8 v65 = [v63 containsObject:v64];

    if (([(CSDAbstractFaceTimeConversationProviderDelegate *)v7 isUpgrade] & 1) == 0) {
      v65 |= [v6 isOneToOneModeEnabled] ^ 1;
    }
    if (+[AVAudioClient hasActiveAudioSession]
      || (v65 & 1) == 0)
    {
      [(CSDAbstractFaceTimeConversationProviderDelegate *)self setAudioSessionActive:1];
    }
    unsigned __int8 v66 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    v67 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v7 messagesGroupName];
    [v66 setMessagesGroupName:v67 onConversationWithUUID:v10];

    id v68 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v69 = [v6 UUID];
    [v68 joinExistingConversationWithUUID:v69 context:v26];

    uint64_t v70 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    objc_msgSend(v70, "setRelaying:forConversationWithUUID:", -[CSDAbstractFaceTimeConversationProviderDelegate isRelay](v7, "isRelay"), v10);

    v71 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
    LODWORD(v69) = TUCallScreeningEnabled();

    if (v69)
    {
      v72 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      objc_msgSend(v72, "setScreening:forConversationWithUUID:", -[CSDAbstractFaceTimeConversationProviderDelegate isScreening](v7, "isScreening"), v10);
    }
    if ([(CSDAbstractFaceTimeConversationProviderDelegate *)v7 isUplinkMuted])
    {
      unsigned __int8 v73 = sub_100008DCC();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v94 = v7;
        __int16 v95 = 2112;
        id v96 = v6;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Setting uplinkMuted for action: %@ conversation: %@", buf, 0x16u);
      }

      v74 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      v75 = [v6 UUID];
      [v74 setUplinkMuted:1 forConversationWithUUID:v75];
    }
    BOOL v76 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    unsigned __int8 v77 = [v76 isConversationWithUUIDRedirectingAudio:v10];

    if ((v77 & 1) == 0) {
      [(CSDAbstractFaceTimeConversationProviderDelegate *)self enqueueConversationWaitingForAudioWithConversationUUID:v10];
    }
    uint64_t v78 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    unsigned int v79 = [v78 isConversationWithUUIDRelaying:v10];

    if (v79) {
      [(CSDAbstractFaceTimeConversationProviderDelegate *)self enqueueOrStartAudioForConversationUUID:v10];
    }

    goto LABEL_60;
  }
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v94 = self;
    __int16 v95 = 2112;
    id v96 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ should not handle conversation: %@", buf, 0x16u);
  }
LABEL_60:
}

- (void)conversationManager:(id)a3 conversation:(id)a4 removedActiveParticipant:(id)a5 withReason:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v13);

  objc_initWeak(&location, self);
  __int16 v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  uint64_t v25 = sub_1001ECB0C;
  uint32_t v26 = &unk_10050A778;
  objc_copyWeak(&v31, &location);
  id v14 = v11;
  id v27 = v14;
  id v15 = v12;
  id v28 = v15;
  id v16 = v10;
  id v29 = v16;
  long long v30 = self;
  id v17 = objc_retainBlock(&v23);
  if (a6 == 1)
  {
    int v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Delaying check on whether to end call since participant %@ left conversation due to handoff", buf, 0xCu);
    }

    long long v19 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self serverBag];
    dispatch_time_t v20 = dispatch_time(0, 1000000000 * (void)[v19 handoffUPlusOneLeaveTimeout]);
    int v21 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
    dispatch_after(v20, v21, v17);
  }
  else
  {
    unsigned int v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Not delaying check on whether to end call on participant leave", buf, 2u);
    }

    ((void (*)(void ***))v17[2])(v17);
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (BOOL)shouldAutomaticallyLeaveConversation:(id)a3
{
  id v4 = a3;
  if ([(CSDAbstractFaceTimeConversationProviderDelegate *)self isConversationJoiningOrJoined:v4])
  {
    id v5 = [v4 remoteMembers];
    id v6 = [v4 activeRemoteParticipants];
    if ([v5 count] == (id)1 && !objc_msgSend(v6, "count")) {
      goto LABEL_9;
    }
    id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
    if ([v7 conversationOneToOneModeEnabled])
    {
      id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self serverBag];
      unsigned int v9 = [v8 isFaceTimeMyselfEnabled];

      if (v9
        && ![v5 count]
        && ![v6 count]
        && ([v4 isOneToOneModeEnabled] & 1) != 0)
      {
LABEL_9:
        BOOL v10 = 1;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
    }
    id v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
    unsigned int v12 = [v11 lagunaEnabled];

    if (!v12)
    {
      BOOL v10 = 0;
      goto LABEL_21;
    }
    uint64_t v13 = objc_msgSend(v5, "bs_filter:", &stru_10050A7B8);
    if ([v13 count] != (id)1) {
      goto LABEL_18;
    }
    id v14 = [v6 count];
    if (!v14)
    {
      BOOL v10 = 1;
      goto LABEL_20;
    }
    if (v14 == (id)1)
    {
      id v15 = [v6 anyObject];
      BOOL v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self isLocalMemberOf:v4 associatedTo:v15];
    }
    else
    {
LABEL_18:
      BOOL v10 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  BOOL v10 = 0;
LABEL_22:

  return v10;
}

- (BOOL)isConversationJoiningOrJoined:(id)a3
{
  return ((unint64_t)[a3 state] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isLocalMemberOf:(id)a3 associatedTo:(id)a4
{
  id v5 = a3;
  id v6 = [a4 handle];
  if (v6)
  {
    id v7 = [v5 localMember];
    id v8 = [v7 association];

    if (v8)
    {
      unsigned int v9 = [v8 handle];
      unsigned __int8 v10 = [v9 isEquivalentToHandle:v6];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)providerDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "providerDidBegin: %@", (uint8_t *)&v9, 0xCu);
  }

  [(CSDAbstractFaceTimeConversationProviderDelegate *)self setProvider:v4];
  id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self providerDidBegin];

  if (v7)
  {
    id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self providerDidBegin];
    v8[2]();
  }
}

- (void)providerDidReset:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "providerDidReset: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  [v7 leaveAllConversations];
}

- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4
{
  id v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "providerDidDeactivateAudioSession", v7, 2u);
  }

  [(CSDAbstractFaceTimeConversationProviderDelegate *)self setAudioSessionActive:0];
}

- (void)provider:(id)a3 timedOutPerformingAction:(id)a4
{
  id v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v10;
    id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
    id v7 = [v5 callUUID];
    int v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      id v9 = objc_alloc_init((Class)CXCallFailureContext);
      [v9 setFailureReason:0];
      [v9 setProviderEndedReason:503];
      [(CSDAbstractFaceTimeConversationProviderDelegate *)self cleanUpConversationIfNecessaryForConversationUUID:v8 failureContext:v9];
    }
  }
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Performing end call action %@", (uint8_t *)&v19, 0xCu);
  }

  int v8 = [v5 callUUID];
  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v10 = [v9 objectForKeyedSubscript:v8];

  id v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  uint64_t v13 = [v12 objectForKeyedSubscript:v10];

  if (v13
    || ([(CSDAbstractFaceTimeConversationProviderDelegate *)self _findPendingConversationWithCallUUID:v8], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([v13 avMode])
    {
      [(CSDAbstractFaceTimeConversationProviderDelegate *)self leaveConversation:v13 withCallUUID:v8 reason:-1];
      [(CSDAbstractFaceTimeConversationProviderDelegate *)self leaveConversationForCallUUID:v8 endedReason:-1];
    }
    else
    {
      id v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received an end call action for avLess conversation, not leaving the conversation but call will end", (uint8_t *)&v19, 2u);
      }
    }
    [v5 fulfill];
  }
  else
  {
    id v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
      id v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      int v18 = [v17 conversationsByUUID];
      int v19 = 138412802;
      id v20 = v8;
      __int16 v21 = 2112;
      unsigned int v22 = v16;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for end call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v19, 0x20u);
    }
    [v5 fail];
  }
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v6, 0xCu);
  }

  [v4 fail];
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v5 = a4;
  int v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v21, 0xCu);
  }

  int v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  id v10 = [v8 objectForKeyedSubscript:v9];

  id v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  uint64_t v13 = [v12 objectForKeyedSubscript:v10];

  if (v13)
  {
    id v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    objc_msgSend(v14, "setUplinkMuted:forConversationWithUUID:", objc_msgSend(v5, "isMuted"), v10);
  }
  else
  {
    id v15 = [v5 callUUID];
    unsigned int v16 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self isManagingPendingConversationForCallWithUUID:v15];

    if (!v16)
    {
      [v5 fail];
      goto LABEL_8;
    }
    id v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v18 = [v5 isMuted];
    int v19 = [v5 callUUID];
    id v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self pendingConversationUUIDForCallWithUUID:v19];
    [v17 setUplinkMuted:v18 forPendingConversationWithUUID:v20];
  }
  [v5 fulfill];
LABEL_8:
}

- (NSMutableSet)callUUIDsUpgradedForAVMode
{
  return self->_callUUIDsUpgradedForAVMode;
}

- (FTNetworkSupport)networkSupport
{
  return self->_networkSupport;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (CSDConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTimeDemuxerDelegate);

  return (CSDFaceTimeProviderDelegateManagerDelegate *)WeakRetained;
}

- (void)setFaceTimeDemuxerDelegate:(id)a3
{
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setDeviceSupport:(id)a3
{
}

- (CSDConversationInvitationResolving)invitationResolver
{
  return self->_invitationResolver;
}

- (void)setInvitationResolver:(id)a3
{
}

- (NSMutableSet)conversationUUIDsAwaitingActiveAudioSession
{
  return self->_conversationUUIDsAwaitingActiveAudioSession;
}

- (BOOL)isAudioSessionActive
{
  return self->_audioSessionActive;
}

- (void)setAudioSessionActive:(BOOL)a3
{
  self->_audioSessionActive = a3;
}

- (id)providerDidBegin
{
  return self->_providerDidBegin;
}

- (void)setProviderDidBegin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_providerDidBegin, 0);
  objc_storeStrong((id *)&self->_conversationUUIDsAwaitingActiveAudioSession, 0);
  objc_storeStrong((id *)&self->_invitationResolver, 0);
  objc_storeStrong((id *)&self->_deviceSupport, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_destroyWeak((id *)&self->_faceTimeDemuxerDelegate);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_networkSupport, 0);
  objc_storeStrong((id *)&self->_callUUIDsUpgradedForAVMode, 0);
  objc_storeStrong((id *)&self->_conversationUUIDsByCallUUID, 0);
  objc_storeStrong((id *)&self->_callUUIDsByConversationUUID, 0);

  objc_storeStrong((id *)&self->_conversationUUIDsWaitingToJoin, 0);
}

@end