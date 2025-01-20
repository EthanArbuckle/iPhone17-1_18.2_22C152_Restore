@interface CSDGFTServiceConversationProviderDelegate
- (BOOL)isManagingCallWithUUID:(id)a3;
- (BOOL)isProviderForeground:(id)a3;
- (BOOL)shouldHandleProvider:(id)a3;
- (BOOL)shouldHandleProviderWithIdentifier:(id)a3;
- (CSDGFTServiceConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5;
- (CSDProcessObserverProtocol)processObserver;
- (void)conversationManager:(id)a3 conversationChanged:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
@end

@implementation CSDGFTServiceConversationProviderDelegate

- (CSDGFTServiceConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CSDGFTServiceConversationProviderDelegate;
  v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)&v18 initWithConversationManager:v8 queue:v9 invitationResolver:v10];
  if (v11)
  {
    v12 = [[CSDProcessObserver alloc] initWithQueue:v9];
    processObserver = v11->_processObserver;
    v11->_processObserver = (CSDProcessObserverProtocol *)v12;

    objc_initWeak(&location, v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10018D628;
    v15[3] = &unk_100507080;
    objc_copyWeak(&v16, &location);
    [(CSDProcessObserverProtocol *)v11->_processObserver setProcessStateChanged:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (BOOL)isProviderForeground:(id)a3
{
  id v4 = a3;
  v5 = [(CSDGFTServiceConversationProviderDelegate *)self processObserver];
  v6 = [v5 fetchCurrentProcessStatesForBundleIdentifier:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = objc_msgSend(v6, "allValues", 0);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) integerValue] == (id)4)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
  id v5 = a4;
  v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v72 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  v7 = +[CSDConversationProviderManager sharedInstance];
  id v8 = [v5 conversationProviderIdentifier];
  uint64_t v9 = [v7 tuConversationProviderForIdentifier:v8];

  uint64_t v10 = [v9 bundleIdentifier];
  if (v10
    && (v11 = (void *)v10,
        [v9 bundleIdentifier],
        long long v12 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v13 = [(CSDGFTServiceConversationProviderDelegate *)self isProviderForeground:v12],
        v12,
        v11,
        (v13 & 1) == 0))
  {
    v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v9 bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      id v72 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[WARN] bundleIdentifer: %@ not in the foreground, failing join call action", buf, 0xCu);
    }
    [v5 fail];
  }
  else
  {
    v51 = v9;
    long long v14 = [v5 callerID];
    long long v15 = LSApplicationWorkspace_ptr;
    v50 = self;
    if (v14)
    {
      id v16 = objc_alloc((Class)TUConversationMember);
      v17 = [v5 callerID];
      objc_super v18 = [v17 tuHandle];
      id v53 = [v16 initWithHandle:v18 nickname:0];
    }
    else
    {
      id v53 = 0;
    }

    v21 = [v5 remoteMembers];
    v55 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v21 count]);

    v22 = [v5 otherInvitedHandles];
    v23 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v22 count]);

    v24 = +[NSMutableSet set];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v52 = v5;
    id obj = [v5 remoteMembers];
    id v25 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
    v54 = v24;
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v67;
      do
      {
        v28 = 0;
        id v56 = v26;
        do
        {
          if (*(void *)v67 != v27) {
            objc_enumerationMutation(obj);
          }
          v29 = [*(id *)(*((void *)&v66 + 1) + 8 * (void)v28) tuHandle];
          if ([v24 containsObject:v29])
          {
            v30 = sub_100008DCC();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v72 = v29;
              __int16 v73 = 2112;
              v74 = v24;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[WARN] Skipping member with handle %@ because it already exists in seen handles: %@", buf, 0x16u);
            }
          }
          else
          {
            v31 = v15;
            v30 = [objc_alloc((Class)v15[134]) initWithHandle:v29 nickname:0];
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            v32 = v23;
            id v33 = v23;
            id v34 = [v33 countByEnumeratingWithState:&v62 objects:v75 count:16];
            if (v34)
            {
              id v35 = v34;
              uint64_t v36 = *(void *)v63;
              do
              {
                for (i = 0; i != v35; i = (char *)i + 1)
                {
                  if (*(void *)v63 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  if ([*(id *)(*((void *)&v62 + 1) + 8 * i) isEquivalentToHandle:v29])-[NSObject setIsOtherInvitedHandle:](v30, "setIsOtherInvitedHandle:", 1); {
                }
                  }
                id v35 = [v33 countByEnumeratingWithState:&v62 objects:v75 count:16];
              }
              while (v35);
            }

            [v55 addObject:v30];
            v24 = v54;
            [v54 addObject:v29];
            v23 = v32;
            long long v15 = v31;
            id v26 = v56;
          }

          v28 = (char *)v28 + 1;
        }
        while (v28 != v26);
        id v26 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
      }
      while (v26);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v5 = v52;
    v38 = [v52 otherInvitedHandles];
    id v39 = [v38 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v59;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v59 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) tuHandle];
          [v23 addObject:v43];
        }
        id v40 = [v38 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v40);
    }

    v44 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v50 conversationManager];
    v45 = [v52 groupUUID];
    v46 = [v52 messagesGroupUUID];
    v47 = [v52 remotePushTokens];
    if ([v52 isVideo]) {
      uint64_t v48 = 2;
    }
    else {
      uint64_t v48 = 1;
    }
    uint64_t v9 = v51;
    v49 = objc_msgSend(v44, "findOrCreateConversationWithGroupUUID:messagesGroupUUID:remoteMembers:otherInvitedHandles:localMember:remotePushTokens:link:activity:avMode:presentationMode:conversationProvider:screenSharingRequest:", v45, v46, v55, v23, v53, v47, 0, 0, v48, objc_msgSend(v52, "presentationMode"), v51, 0);

    if (v49) {
      [(CSDAbstractFaceTimeConversationProviderDelegate *)v50 proceedToJoinForConversation:v49 action:v52];
    }
    else {
      [v52 fail];
    }
  }
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v5 = a4;
  v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Performing end call action %@", (uint8_t *)&v18, 0xCu);
  }

  id v8 = [v5 callUUID];
  uint64_t v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];

  v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  long long v12 = [v11 conversationsByUUID];
  unsigned __int8 v13 = [v12 objectForKeyedSubscript:v10];

  if (v13)
  {
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self leaveConversation:v13 withCallUUID:v8 reason:-1];
    [v5 fulfill];
  }
  else
  {
    long long v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
      id v16 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      v17 = [v16 conversationsByUUID];
      int v18 = 138412802;
      id v19 = v8;
      __int16 v20 = 2112;
      v21 = v15;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for end call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v18, 0x20u);
    }
    [v5 fail];
  }
  [(CSDAbstractFaceTimeConversationProviderDelegate *)self leaveConversationForCallUUID:v8 endedReason:-1];
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v5 = a4;
  v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failing %@ It is not supported by GFTaaS", (uint8_t *)&v8, 0xCu);
  }

  [v5 fail];
}

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v5 = a4;
  v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failing %@ It is not supported by GFTaaS", (uint8_t *)&v8, 0xCu);
  }

  [v5 fail];
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  id v10 = a3;
  id v4 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  v6 = [v5 objectForKeyedSubscript:v10];

  v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  int v8 = [v7 conversationsByUUID];
  id v9 = [v8 objectForKeyedSubscript:v6];

  v13.receiver = self;
  v13.super_class = (Class)CSDGFTServiceConversationProviderDelegate;
  LODWORD(self) = [(CSDAbstractFaceTimeConversationProviderDelegate *)&v13 isManagingCallWithUUID:v10];

  LOBYTE(v10) = 0;
  if (self && v9)
  {
    v11 = [v9 provider];
    LODWORD(v10) = [v11 isDefaultProvider] ^ 1;
  }
  return (char)v10;
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  id v5 = a4;
  v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  v44 = self;
  v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  int v8 = [v5 UUID];
  v45 = [v7 objectForKeyedSubscript:v8];

  id v9 = [objc_alloc((Class)CXCallUpdate) initWithTUConversation:v5];
  id v10 = [v5 remoteMembers];
  v11 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v10 count]);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v12 = [v5 remoteMembers];
  id v13 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v51;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v50 + 1) + 8 * i) handle];
        int v18 = +[CXHandle handleWithTUHandle:v17];
        [v11 addObject:v18];
      }
      id v14 = [v12 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v14);
  }

  [v9 setRemoteParticipantHandles:v11];
  id v19 = [v5 activeRemoteParticipantCXHandles];
  [v9 setActiveRemoteParticipantHandles:v19];

  objc_msgSend(v9, "setOneToOneModeEnabled:", objc_msgSend(v5, "isOneToOneModeEnabled"));
  objc_msgSend(v9, "setScreenSharingType:", objc_msgSend(v5, "screenSharingType"));
  if (![v5 isOneToOneModeEnabled]) {
    goto LABEL_13;
  }
  __int16 v20 = [v5 mergedActiveRemoteParticipants];
  if ([v20 count] != (id)1) {
    goto LABEL_12;
  }
  v21 = [v5 mergedActiveRemoteParticipants];
  __int16 v22 = [v21 anyObject];
  id v23 = [v22 streamToken];

  if (v23)
  {
    __int16 v20 = [v5 mergedActiveRemoteParticipants];
    v24 = [v20 anyObject];
    objc_msgSend(v9, "setVideoStreamToken:", objc_msgSend(v24, "streamToken"));

LABEL_12:
  }
LABEL_13:
  switch((unint64_t)[v5 state])
  {
    case 0uLL:
      id v25 = [v5 UUID];
      unsigned __int8 v26 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 _isWaitingToJoinForConversationUUID:v25];

      if (v26) {
        goto LABEL_28;
      }
      id v27 = objc_alloc_init((Class)CXCallFailureContext);
      [v27 setFailureReason:0];
      [v27 setProviderEndedReason:504];
      v28 = [v5 UUID];
      [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 cleanUpConversationIfNecessaryForConversationUUID:v28 failureContext:v27];

      goto LABEL_48;
    case 1uLL:
      [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 fullfillPendingJoinActionsForCallUUIDIfNecessary:v45];
      if (!v45) {
        goto LABEL_31;
      }
      goto LABEL_29;
    case 2uLL:
      if (v45)
      {
        if ([v5 isLocallyCreated])
        {
          if (([v5 isOneToOneModeEnabled] & 1) == 0)
          {
            [v9 setRequiresInCallSounds:0];
            v29 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 provider];
            v30 = +[NSDate date];
            [v29 reportOutgoingCallWithUUID:v45 startedConnectingAtDate:v30];
          }
          v31 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 provider];
          v32 = +[NSDate date];
          [v31 reportOutgoingCallWithUUID:v45 sentInvitationAtDate:v32];
        }
        [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 fullfillPendingJoinActionsForCallUUIDIfNecessary:v45];
        goto LABEL_29;
      }
      id v35 = sub_100008DCC();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1003AF3A8((uint64_t)v5, v35);
      }
      goto LABEL_30;
    case 3uLL:
      if (!v45)
      {
        uint64_t v36 = sub_100008DCC();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_1003AF330((uint64_t)v5, v36);
        }

        id v35 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 conversationManager];
        v37 = [v5 UUID];
        [v35 leaveConversationWithUUID:v37];

        goto LABEL_30;
      }
      if ([v5 isOneToOneModeEnabled])
      {
        id v33 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 faceTimeDemuxerDelegate];
        id v34 = +[NSDate date];
        [v33 providerDelegate:v44 callWithUUID:v45 connectedAtDate:v34];
      }
      else
      {
        id v33 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 provider];
        id v34 = +[NSDate date];
        [v33 reportOutgoingCallWithUUID:v45 connectedAtDate:v34];
      }

      if ([v5 isOneToOneModeEnabled]) {
        [v9 setConversation:1];
      }
      v38 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 provider];
      id v39 = [v38 pendingCallActionsOfClass:objc_opt_class() withCallUUID:v45];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v27 = v39;
      id v40 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v47;
        do
        {
          for (j = 0; j != v41; j = (char *)j + 1)
          {
            if (*(void *)v47 != v42) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v46 + 1) + 8 * (void)j) fulfill];
          }
          id v41 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v41);
      }

LABEL_48:
      if (v45)
      {
LABEL_29:
        id v35 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v44 provider];
        [v35 reportCallWithUUID:v45 updated:v9];
LABEL_30:
      }
LABEL_31:

      return;
    case 4uLL:
      [v9 setMixesVoiceWithMedia:0];
      goto LABEL_28;
    default:
LABEL_28:
      if (v45) {
        goto LABEL_29;
      }
      goto LABEL_31;
  }
}

- (BOOL)shouldHandleProviderWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[CSDConversationProviderManager sharedInstance];
  id v5 = [v4 conversationProviderForIdentifier:v3];

  return v5 != 0;
}

- (BOOL)shouldHandleProvider:(id)a3
{
  if (a3) {
    return [a3 isDefaultProvider] ^ 1;
  }
  else {
    return 0;
  }
}

- (CSDProcessObserverProtocol)processObserver
{
  return self->_processObserver;
}

- (void).cxx_destruct
{
}

@end