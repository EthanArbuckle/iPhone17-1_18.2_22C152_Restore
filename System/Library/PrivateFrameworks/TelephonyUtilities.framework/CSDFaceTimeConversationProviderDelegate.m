@interface CSDFaceTimeConversationProviderDelegate
+ (id)callScreenShareAttributesForAction:(id)a3;
- (BOOL)isManagingCallWithUUID:(id)a3;
- (BOOL)isUnansweredOutgoingOneToOneConversation:(id)a3;
- (BOOL)isWaitingForRemoteJoinForConversationUUID:(id)a3;
- (BOOL)linkContainsValidLocalHandle:(id)a3;
- (BOOL)shouldHandleProvider:(id)a3;
- (BOOL)shouldHandleProviderWithIdentifier:(id)a3;
- (CSDBlockUtilitiesProtocol)blockUtilities;
- (CSDFaceTimeConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5;
- (NSMutableDictionary)recentlyDeletedCallUUIDsByConversationUUID;
- (NSMutableSet)conversationUUIDsUpgradedFromAVLess;
- (NSMutableSet)conversationUUIDsWaitingForRemoteJoin;
- (id)_findPendingConversationWithCallUUID:(id)a3;
- (id)activatedLinkForJoinCallAction:(id)a3 withError:(id *)a4;
- (id)allowsScreenSharingBlock;
- (id)deletedLinkForJoinCallAction:(id)a3 withError:(id *)a4;
- (id)linkForJoinCallAction:(id)a3 inLinks:(id)a4;
- (id)linkForJoinCallAction:(id)a3 withError:(id *)a4;
- (id)validateLinkForJoinCallActionIfNecessary:(id)a3 withError:(id *)a4;
- (int)TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3;
- (void)_failConversation:(id)a3 failureReason:(int64_t)a4 providerEndedReason:(int64_t)a5;
- (void)cleanUpConversationIfNecessaryForConversationUUID:(id)a3 failureContext:(id)a4;
- (void)conversationManager:(id)a3 avModeChanged:(unint64_t)a4 toAVMode:(unint64_t)a5 forConversation:(id)a6;
- (void)conversationManager:(id)a3 connectionDidStartForConversation:(id)a4;
- (void)conversationManager:(id)a3 conversation:(id)a4 addedActiveParticipant:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 changedBytesOfDataUsed:(int64_t)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 failedWithContext:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 receivedMessage:(id)a5 fromHandle:(id)a6 withUpdate:(id)a7;
- (void)conversationManager:(id)a3 conversationChanged:(id)a4;
- (void)conversationManager:(id)a3 conversationScreenSharingChanged:(id)a4 forParticipant:(id)a5;
- (void)conversationManager:(id)a3 joinConversationWithRequest:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChanged:(id)a4 forConversation:(id)a5;
- (void)conversationManager:(id)a3 removedConversationWithUUID:(id)a4;
- (void)conversationManager:(id)a3 reportedHandedOffConversation:(id)a4 replacedByIdentifier:(unint64_t)a5 localizedHandoffRecipientDeviceCategory:(id)a6;
- (void)conversationManager:(id)a3 reportedInvalidLinkForPendingConversation:(id)a4;
- (void)conversationManager:(id)a3 reportedLetMeInRejectedForPendingConversation:(id)a4;
- (void)conversationManager:(id)a3 reportedRemoteDoesHandedOffForConversation:(id)a4;
- (void)declineConversation:(id)a3 reason:(int64_t)a4 destinations:(id)a5;
- (void)declineRemoteDevicesForConversation:(id)a3 reason:(int64_t)a4;
- (void)declineRemoteMembersForConversation:(id)a3 reason:(int64_t)a4;
- (void)handleDeclineMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)handleInvitationMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5;
- (void)handleInvitationMessageForLetMeIn:(id)a3 forConversation:(id)a4 pendingConversation:(id)a5 link:(id)a6 fromHandle:(id)a7;
- (void)handleMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)handleNicknameUpdateMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)handleReceivedVideoUpgradeMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5;
- (void)handleRemoveMembersMessage:(id)a3 forConversation:(id)a4;
- (void)handleRespondedElsewhereMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5;
- (void)handleRespondedElsewhereMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withAliases:(id)a6;
- (void)handleScreenShareMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)handleUpgradeMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6;
- (void)leaveConversation:(id)a3 withCallUUID:(id)a4 reason:(int64_t)a5;
- (void)leaveConversationForCallUUID:(id)a3 endedReason:(int64_t)a4;
- (void)performJoinCallAction:(id)a3;
- (void)proceedToNewPendingConversationForLink:(id)a3 action:(id)a4;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)provider:(id)a3 performSetAllowUplinkAudioInjectionAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetScreenShareAttributesCallAction:(id)a4;
- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4;
- (void)setAllowsScreenSharingBlock:(id)a3;
- (void)setCallUUID:(id)a3 forConversationUUID:(id)a4;
- (void)setWaitingForRemoteJoin:(BOOL)a3 forConversationUUID:(id)a4;
- (void)startOutgoingOneToOneTimeoutIfNecessary:(id)a3;
@end

@implementation CSDFaceTimeConversationProviderDelegate

- (CSDFaceTimeConversationProviderDelegate)initWithConversationManager:(id)a3 queue:(id)a4 invitationResolver:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)CSDFaceTimeConversationProviderDelegate;
  v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)&v14 initWithConversationManager:a3 queue:a4 invitationResolver:a5];
  if (v5)
  {
    uint64_t v6 = +[NSMutableDictionary dictionary];
    recentlyDeletedCallUUIDsByConversationUUID = v5->_recentlyDeletedCallUUIDsByConversationUUID;
    v5->_recentlyDeletedCallUUIDsByConversationUUID = (NSMutableDictionary *)v6;

    uint64_t v8 = +[NSMutableSet set];
    conversationUUIDsWaitingForRemoteJoin = v5->_conversationUUIDsWaitingForRemoteJoin;
    v5->_conversationUUIDsWaitingForRemoteJoin = (NSMutableSet *)v8;

    v10 = objc_alloc_init(CSDBlockUtilities);
    blockUtilities = v5->_blockUtilities;
    v5->_blockUtilities = (CSDBlockUtilitiesProtocol *)v10;

    id allowsScreenSharingBlock = v5->_allowsScreenSharingBlock;
    v5->_id allowsScreenSharingBlock = &stru_100509060;
  }
  return v5;
}

- (void)setCallUUID:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
    v9 = [v8 objectForKeyedSubscript:v7];

    if (v9)
    {
      v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
        v12 = [v11 objectForKeyedSubscript:v7];
        *(_DWORD *)buf = 138412802;
        uint64_t v23 = 0;
        __int16 v24 = 2112;
        id v25 = v7;
        __int16 v26 = 2112;
        v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "callUUID: %@, callUUIDsByConversationUUID[%@]: %@", buf, 0x20u);
      }
      v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
      objc_super v14 = [v13 objectForKeyedSubscript:v7];
      v15 = [(CSDFaceTimeConversationProviderDelegate *)self recentlyDeletedCallUUIDsByConversationUUID];
      [v15 setObject:v14 forKeyedSubscript:v7];

      objc_initWeak((id *)buf, self);
      dispatch_time_t v16 = dispatch_time(0, 5000000000);
      v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100181310;
      block[3] = &unk_100505558;
      objc_copyWeak(&v21, (id *)buf);
      id v20 = v7;
      dispatch_after(v16, v17, block);

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)CSDFaceTimeConversationProviderDelegate;
  [(CSDAbstractFaceTimeConversationProviderDelegate *)&v18 setCallUUID:v6 forConversationUUID:v7];
}

- (BOOL)isWaitingForRemoteJoinForConversationUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDFaceTimeConversationProviderDelegate *)self conversationUUIDsWaitingForRemoteJoin];
  LOBYTE(v5) = [v6 containsObject:v4];

  return (char)v5;
}

- (NSMutableSet)conversationUUIDsWaitingForRemoteJoin
{
  v3 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  conversationUUIDsWaitingForRemoteJoin = self->_conversationUUIDsWaitingForRemoteJoin;

  return conversationUUIDsWaitingForRemoteJoin;
}

- (void)setWaitingForRemoteJoin:(BOOL)a3 forConversationUUID:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  if (v9)
  {
    id v7 = [(CSDFaceTimeConversationProviderDelegate *)self conversationUUIDsWaitingForRemoteJoin];
    uint64_t v8 = v7;
    if (v4) {
      [v7 addObject:v9];
    }
    else {
      [v7 removeObject:v9];
    }
  }
}

- (int)TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (id)callScreenShareAttributesForAction:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)TUCallScreenShareAttributes);
  if (v3)
  {
    objc_msgSend(v4, "setDeviceFamily:", objc_msgSend(v3, "deviceFamily"));
    objc_msgSend(v4, "setDeviceHomeButtonType:", objc_msgSend(v3, "deviceHomeButtonType"));
    objc_msgSend(v4, "setStyle:", objc_msgSend(v3, "style"));
    v5 = [v3 displayID];
    [v4 setDisplayID:v5];

    id v6 = [v3 frameRate];
    [v4 setFrameRate:v6];

    objc_msgSend(v4, "setWindowed:", objc_msgSend(v3, "isWindowed"));
    id v7 = [v3 windowUUID];
    [v4 setWindowUUID:v7];

    uint64_t v8 = [v3 displayScale];
    [v4 setDisplayScale:v8];

    id v9 = [v3 cornerRadius];
    [v4 setCornerRadius:v9];

    v10 = [v3 scaleFactor];
    [v4 setScaleFactor:v10];

    v11 = [v3 systemRootLayerTransform];
    [v4 setSystemRootLayerTransform:v11];

    v12 = [v3 originalResolution];
    id v13 = [v12 copy];
    [v4 setOriginalResolution:v13];
  }

  return v4;
}

- (BOOL)linkContainsValidLocalHandle:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isLocallyCreated];
  if (v5
    && ([(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v4 originatorHandle],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v6 isValidLocalHandle:v7],
        v7,
        v6,
        v8))
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v27 = @"YES";
      __int16 v28 = 2112;
      CFStringRef v29 = @"YES";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Link was created locally: %@, using valid local handle: %@", buf, 0x16u);
    }
LABEL_23:
    BOOL v17 = 1;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = objc_msgSend(v4, "invitedMemberHandles", 0);
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v15 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
          LODWORD(v14) = [v15 isValidLocalHandle:v14];

          if (v14)
          {
            objc_super v18 = sub_100008DCC();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v19 = @"NO";
              if (v5) {
                CFStringRef v19 = @"YES";
              }
              *(_DWORD *)buf = 138412290;
              CFStringRef v27 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Link was created locally: %@ using valid local handle (YES)", buf, 0xCu);
            }

            goto LABEL_23;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = @"YES";
      if (!v5) {
        CFStringRef v16 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v27 = v16;
      __int16 v28 = 2112;
      CFStringRef v29 = @"NO";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Link was created locally: %@, using valid local handle: %@", buf, 0x16u);
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (void)cleanUpConversationIfNecessaryForConversationUUID:(id)a3 failureContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v8);

  v9.receiver = self;
  v9.super_class = (Class)CSDFaceTimeConversationProviderDelegate;
  [(CSDAbstractFaceTimeConversationProviderDelegate *)&v9 cleanUpConversationIfNecessaryForConversationUUID:v7 failureContext:v6];

  [(CSDAbstractFaceTimeConversationProviderDelegate *)self setWaitingToJoin:0 forConversationUUID:v7];
}

- (void)handleMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v14);

  v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v10 type];
    if v16 < 0x25 && ((0x1FFFE9FF7FuLL >> (char)v16))
    {
      BOOL v17 = *(&off_1005090D0 + (int)v16);
    }
    else
    {
      BOOL v17 = +[NSString stringWithFormat:@"(unknown: %i)", v16];
    }
    objc_super v18 = [v11 UUID];
    *(_DWORD *)buf = 138412546;
    long long v21 = v17;
    __int16 v22 = 2112;
    long long v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received %@ conversation message for %@", buf, 0x16u);
  }
  unsigned int v19 = [v10 type];
  switch(v19)
  {
    case 1u:
    case 3u:
      [(CSDFaceTimeConversationProviderDelegate *)self handleInvitationMessage:v10 forConversation:v11 fromHandle:v12];
      break;
    case 2u:
      [(CSDFaceTimeConversationProviderDelegate *)self handleUpgradeMessage:v10 forConversation:v11 fromHandle:v12 withUpdate:v13];
      break;
    case 4u:
    case 5u:
    case 7u:
    case 8u:
    case 0xAu:
    case 0xBu:
      break;
    case 6u:
      [(CSDFaceTimeConversationProviderDelegate *)self handleRespondedElsewhereMessage:v10 forConversation:v11 fromHandle:v12];
      break;
    case 9u:
      goto LABEL_15;
    case 0xCu:
      [(CSDFaceTimeConversationProviderDelegate *)self handleNicknameUpdateMessage:v10 forConversation:v11 fromHandle:v12 withUpdate:v13];
LABEL_15:
      [(CSDFaceTimeConversationProviderDelegate *)self handleDeclineMessage:v10 forConversation:v11 fromHandle:v12 withUpdate:v13];
      break;
    default:
      if (v19 == 19)
      {
        [(CSDFaceTimeConversationProviderDelegate *)self handleRemoveMembersMessage:v10 forConversation:v11];
      }
      else if (v19 == 22)
      {
        [(CSDFaceTimeConversationProviderDelegate *)self handleReceivedVideoUpgradeMessage:v10 forConversation:v11 fromHandle:v12];
      }
      break;
  }
}

- (void)handleDeclineMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 state] == (id)3)
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 UUID];
      int v19 = 138412546;
      id v20 = v9;
      __int16 v21 = 2112;
      __int16 v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Not handling received Decline message from %@ since we are already in a joined conversation with UUID: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    id v12 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v13 = [v8 UUID];
    [v12 leaveConversationWithUUID:v13];

    uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
    v15 = [v8 UUID];
    id v16 = [v14 objectForKeyedSubscript:v15];

    if (v16)
    {
      BOOL v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self faceTimeDemuxerDelegate];
      objc_super v18 = +[NSDate now];
      [v17 providerDelegate:self callWithUUID:v16 endedAtDate:v18 withReason:2 failureContext:0];
    }
  }
}

- (void)handleNicknameUpdateMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 hasNickname])
  {
    id v12 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v13 = [v9 nickname];
    uint64_t v14 = [v10 UUID];
    [v12 processUpdatedNickname:v13 forHandle:v11 conversationUUID:v14];
  }
  else
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring nickname update message %@ because message doesn't have a nickname set.", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)handleScreenShareMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Not honoring screen sharing message", v7, 2u);
  }
}

- (void)handleReceivedVideoUpgradeMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = TUCopyIDSCanonicalAddressForHandle();
  id v11 = (void *)v10;
  if (v10)
  {
    CFStringRef v29 = (void *)v10;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = [v7 activeRemoteParticipants];
    id v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v31;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
        objc_super v18 = [v17 handle];
        unsigned __int8 v19 = [v18 isEqualToHandle:v8];

        if (v19) {
          break;
        }
        if (v14 == (id)++v16)
        {
          id v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v20 = v17;

      if (!v20) {
        goto LABEL_17;
      }
      if ([v7 state] == (id)3 || objc_msgSend(v7, "state") == (id)2)
      {
        __int16 v21 = [v7 remoteMembers];
        id v22 = [v21 count];

        if (v22 == (id)1)
        {
          long long v23 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
          long long v24 = [v7 UUID];
          id v25 = [v23 objectForKeyedSubscript:v24];

          if (v25)
          {
            __int16 v26 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
            CFStringRef v27 = [v7 UUID];
            [v26 setVideo:1 forConversationWithUUID:v27];
          }
          else
          {
            __int16 v26 = sub_100008DCC();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v7;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[WARN] No call is being tracked, dropping message for conversation: %@", buf, 0xCu);
            }
          }
          id v11 = v29;

          goto LABEL_25;
        }
      }
      __int16 v28 = sub_100008DCC();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v7;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[WARN] Conversation %@ is not in the correct state. Dropping message.", buf, 0xCu);
      }
    }
    else
    {
LABEL_10:

LABEL_17:
      id v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Dropping video upgrade message, since member is not part of conversation.", buf, 2u);
      }
    }
    id v11 = v29;
  }
  else
  {
    id v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Could not convert %@ to IDS destination", buf, 0xCu);
    }
  }
LABEL_25:
}

- (void)handleUpgradeMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withUpdate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self serverBag];
  unsigned __int8 v16 = [v15 isAutomaticUpgradingEnabled];

  if ((v16 & 1) == 0)
  {
    unsigned __int8 v19 = sub_100008DCC();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v22 = "[WARN] Not handling upgrade message for conversation since upgrades are currently disabled.";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    goto LABEL_16;
  }
  if (!v13)
  {
    unsigned __int8 v19 = sub_100008DCC();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v22 = "[WARN] Not upgrading conversation since there was no join update attached.";
    goto LABEL_15;
  }
  if ([v13 participantUpdateSubtype] != (id)1)
  {
    unsigned __int8 v19 = sub_100008DCC();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v22 = "[WARN] Not upgrading conversation since the join update has an incorrect subtype.";
    goto LABEL_15;
  }
  if (([v10 hasProtoUpgradeSessionUUID] & 1) == 0)
  {
    unsigned __int8 v19 = sub_100008DCC();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    id v22 = "[WARN] Not upgrading conversation as message is missing upgrade token.";
    goto LABEL_15;
  }
  BOOL v17 = [v13 participantDestinationID];
  id v29 = 0;
  id v18 = [v17 _stripPotentialTokenURIWithToken:&v29];
  unsigned __int8 v19 = v29;

  if (v19)
  {
    id v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self faceTimeDemuxerDelegate];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10018273C;
    v23[3] = &unk_100509088;
    long long v24 = v10;
    id v25 = v12;
    id v26 = v13;
    CFStringRef v27 = self;
    id v28 = v11;
    [v20 providerDelegate:self requestedUpgradeToExistingCallForConversation:v28 withSessionToken:v19 completion:v23];

    __int16 v21 = v24;
  }
  else
  {
    __int16 v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Not upgrading conversation as message is missing remote token.", buf, 2u);
    }
  }

LABEL_16:
}

- (void)handleRemoveMembersMessage:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 removedMembers];
  id v10 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = objc_msgSend(v6, "removedMembers", 0);
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned __int8 v16 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v15) tuConversationMember];
        [v10 addObject:v16];

        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  BOOL v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  id v18 = [v7 UUID];
  [v17 removeRemoteMembers:v10 fromConversationWithUUID:v18];
}

- (void)handleInvitationMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [v8 tuConversationLink];
  if (v12)
  {
    id v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    uint64_t v14 = [v12 pseudonym];
    uint64_t v15 = [v13 removePendingConversationWithPseudonym:v14];

    if (v15)
    {
      [(CSDFaceTimeConversationProviderDelegate *)self handleInvitationMessageForLetMeIn:v8 forConversation:v9 pendingConversation:v15 link:v12 fromHandle:v10];
      goto LABEL_42;
    }
    if ([v8 hasIsLetMeInApproved] && objc_msgSend(v8, "isLetMeInApproved"))
    {
      unsigned __int8 v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v17 = [(__CFString *)v9 UUID];
        *(_DWORD *)buf = 138412290;
        CFStringRef v52 = v17;
        id v18 = "Not ringing for incoming invitation message for %@ since message is a LMI approval";
        long long v19 = v16;
        uint32_t v20 = 12;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  long long v21 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  long long v22 = [(__CFString *)v9 UUID];
  uint64_t v15 = [v21 objectForKeyedSubscript:v22];

  if (v15)
  {
    unsigned __int8 v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = [(__CFString *)v9 UUID];
      *(_DWORD *)buf = 138412546;
      CFStringRef v52 = v17;
      __int16 v53 = 2112;
      CFStringRef v54 = v15;
      id v18 = "Ignoring incoming invitation message for %@ since we are already tracking this with call %@";
      long long v19 = v16;
      uint32_t v20 = 22;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_42;
  }
  v50 = v10;
  long long v23 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self invitationResolver];
  long long v24 = [(__CFString *)v9 localMember];
  id v25 = [v24 handle];
  id v26 = [v8 tuInvitationPreferences];
  unsigned int v27 = [v23 shouldShowInvitationRingingUIForConversation:v9 handle:v25 invitationMessagePreferences:v26];

  id v28 = sub_100008DCC();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    if (v27) {
      CFStringRef v29 = @"YES";
    }
    else {
      CFStringRef v29 = @"NO";
    }
    long long v30 = [v8 tuInvitationPreferences];
    *(_DWORD *)buf = 138412546;
    CFStringRef v52 = v29;
    __int16 v53 = 2112;
    CFStringRef v54 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "shouldRing = %@, tuInvitationPreferences: %@", buf, 0x16u);
  }
  long long v31 = [(__CFString *)v9 invitationPreferences];
  long long v32 = [v8 tuInvitationPreferences];
  unsigned int v33 = [v31 isEqualToSet:v32];

  v34 = [v8 tuInvitationPreferences];
  if ([v34 count] && !v33)
  {

    if ((v27 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_29:
    id v10 = v50;
    if ([v8 type] == 1)
    {
      v40 = [(__CFString *)v9 remoteMembers];
      if ([v40 count] != (id)1)
      {
LABEL_33:

        goto LABEL_34;
      }
      v41 = [(__CFString *)v9 activeRemoteParticipants];
      if ([v41 count])
      {

        goto LABEL_33;
      }
      v42 = [(__CFString *)v9 localMember];
      v43 = [v42 handle];
      unsigned int v49 = [v50 isEquivalentToHandle:v43];

      if (v49)
      {
        v44 = sub_100008DCC();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v52 = v9;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "This is a U+1 invite sent by the local account from a different device, not ringing on the local device for conversation: %@", buf, 0xCu);
        }

        goto LABEL_39;
      }
    }
LABEL_34:
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self reportNewIncomingCallForConversation:v9 fromHandle:v50 isReRing:0];
    goto LABEL_42;
  }
  unsigned int v35 = [v8 type];

  if (v35 == 1)
  {
    id v36 = sub_100008DCC();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [v8 tuInvitationPreferences];
      CFStringRef v38 = (const __CFString *)[v37 count];
      CFStringRef v39 = @"NO";
      if (v33) {
        CFStringRef v39 = @"YES";
      }
      *(_DWORD *)buf = 134218242;
      CFStringRef v52 = v38;
      __int16 v53 = 2112;
      CFStringRef v54 = v39;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "setting shouldRing to YES, message.tuInvitationPreferences.count: %ld, invitationPreferencesEqual %@", buf, 0x16u);
    }
    goto LABEL_29;
  }
  if (v27) {
    goto LABEL_29;
  }
LABEL_39:
  v45 = sub_100008DCC();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [(__CFString *)v9 UUID];
    v47 = [(__CFString *)v9 invitationPreferences];
    v48 = [v8 tuInvitationPreferences];
    *(_DWORD *)buf = 138412802;
    CFStringRef v52 = v46;
    __int16 v53 = 2114;
    CFStringRef v54 = v47;
    __int16 v55 = 2114;
    v56 = v48;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring incoming invitation message for %@ because invitation preferences requested no-ring. conversation.invitationPreferences=%{public}@, message.tuInvitationPreferences=%{public}@", buf, 0x20u);
  }
  id v10 = v50;
LABEL_42:
}

- (void)handleInvitationMessageForLetMeIn:(id)a3 forConversation:(id)a4 pendingConversation:(id)a5 link:(id)a6 fromHandle:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = [v14 conversationGroupUUID];
  id v18 = [v12 conversationGroupUUID];
  unsigned int v19 = [v17 isEqual:v18];

  if (v19)
  {
    uint64_t v20 = 0;
  }
  else
  {
    long long v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [v12 conversationGroupUUID];
      long long v23 = [v14 conversationGroupUUID];
      *(_DWORD *)buf = 138412802;
      id v59 = v22;
      __int16 v60 = 2112;
      id v61 = v23;
      __int16 v62 = 2112;
      id v63 = v15;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring incoming invitation (LMI approval) because message's group UUID %@ did not match the pending conversation's expected group UUID %@. (link: %@)", buf, 0x20u);
    }
    uint64_t v20 = 522;
  }
  long long v24 = [v14 approverHandle];
  unsigned __int8 v25 = [v24 isEquivalentToHandle:v16];

  if (v25)
  {
    int v26 = v19 ^ 1;
  }
  else
  {
    unsigned int v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [v14 approverHandle];
      *(_DWORD *)buf = 138412546;
      id v59 = v16;
      __int16 v60 = 2112;
      id v61 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring incoming invitation (LMI approval) because it was sent from handle %@ instead of expected approverHandle %@", buf, 0x16u);
    }
    int v26 = 1;
    uint64_t v20 = 524;
  }
  CFStringRef v29 = [v14 link];
  unsigned __int8 v30 = [v29 isEquivalentToConversationLink:v15];

  if ((v30 & 1) == 0)
  {
    v48 = sub_100008DCC();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v59 = v15;
      __int16 v60 = 2112;
      id v61 = v14;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring incoming invitation (LMI approval) because message's link %@ did not match the link the user tapped (pendingConversation: %@)", buf, 0x16u);
    }

    uint64_t v20 = 523;
    goto LABEL_27;
  }
  if (v26)
  {
LABEL_27:
    id v41 = objc_alloc_init((Class)CXCallFailureContext);
    [v41 setFailureReason:0];
    [v41 setProviderEndedReason:v20];
    unsigned int v49 = [v13 UUID];
    [(CSDFaceTimeConversationProviderDelegate *)self cleanUpConversationIfNecessaryForConversationUUID:v49 failureContext:v41];
    goto LABEL_37;
  }
  long long v31 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  long long v32 = [v13 UUID];
  unsigned int v33 = [v31 objectForKeyedSubscript:v32];

  if (!v33)
  {
    v34 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
    unsigned int v35 = [v14 temporaryGroupUUID];
    unsigned int v33 = [v34 objectForKeyedSubscript:v35];
  }
  if ([v12 type] == 1
    && ([v13 letMeInRequestState] == (id)2 || objc_msgSend(v14, "letMeInRequestState") == (id)2))
  {
    id v36 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    v37 = [v13 UUID];
    [v36 updateLetMeInRequestState:3 addLink:v15 forConversationWithUUID:v37];
  }
  CFStringRef v38 = [v13 UUID];
  [(CSDAbstractFaceTimeConversationProviderDelegate *)self associateCallUUID:v33 withConversationUUID:v38 waitingToJoin:1];

  CFStringRef v39 = +[TUCallCenter sharedInstance];
  v40 = [v39 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100183DA4;
  block[3] = &unk_100504EC0;
  id v41 = v33;
  id v57 = v41;
  dispatch_async(v40, block);

  v42 = sub_100008DCC();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v59 = v41;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "LMI: Shuttling in to new conversation and stopping the pending one (moving callUUID %@ to new conversation).", buf, 0xCu);
  }

  v43 = objc_alloc_init(CSDConversationJoinContext);
  [(CSDConversationJoinContext *)v43 setWantsStagingArea:1];
  [(CSDConversationJoinContext *)v43 setRepresentsTransitionFromPending:1];
  [(CSDConversationJoinContext *)v43 setAvMode:2];
  v44 = [v13 provider];
  [(CSDConversationJoinContext *)v43 setProvider:v44];

  -[CSDConversationJoinContext setVideoEnabled:](v43, "setVideoEnabled:", [v14 isVideoEnabled]);
  -[CSDConversationJoinContext setVideo:](v43, "setVideo:", [v14 isVideo]);
  v45 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
  unsigned int v46 = [v45 avLessSharePlayEnabled];

  if (v46)
  {
    if ([v12 hasAvMode])
    {
      uint64_t v47 = (int)[v12 avMode];
    }
    else if ([(CSDConversationJoinContext *)v43 isVideo])
    {
      uint64_t v47 = 2;
    }
    else
    {
      uint64_t v47 = 1;
    }
    [(CSDConversationJoinContext *)v43 setAvMode:v47];
  }
  v50 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  v51 = [v13 UUID];
  [v50 joinExistingConversationWithUUID:v51 context:v43];

  if ([v14 isUplinkMuted])
  {
    CFStringRef v52 = sub_100008DCC();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v59 = v13;
      __int16 v60 = 2112;
      id v61 = v14;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Setting uplinkMuted for conversation: %@ since pendingConversation:%@ has uplinkMuted", buf, 0x16u);
    }

    __int16 v53 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    CFStringRef v54 = [v13 UUID];
    [v53 setUplinkMuted:1 forConversationWithUUID:v54];
  }
  __int16 v55 = [v13 UUID];
  [(CSDAbstractFaceTimeConversationProviderDelegate *)self enqueueOrStartAudioForConversationUUID:v55];

  unsigned int v49 = v57;
LABEL_37:
}

- (void)handleRespondedElsewhereMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5 withAliases:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v14);

  id v15 = [v12 value];
  id v16 = [v15 length];
  BOOL v17 = sub_100008DCC();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v16)
  {
    if (v18)
    {
      LOWORD(v34) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring responded elsewhere message since it was not sent from a valid handle.", (uint8_t *)&v34, 2u);
    }
    goto LABEL_22;
  }
  if (v18)
  {
    unsigned int v19 = [v11 initiator];
    uint64_t v20 = [v11 remoteMembers];
    int v34 = 138413058;
    unsigned int v35 = v19;
    __int16 v36 = 2112;
    id v37 = v12;
    __int16 v38 = 2048;
    id v39 = [v20 count];
    __int16 v40 = 2112;
    id v41 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "handleRespondedElsewhereMessage: initiator: %@, handle: %@, remotemember count: %lu, allAliases: %@", (uint8_t *)&v34, 0x2Au);
  }
  long long v21 = [v11 remoteMembers];
  if ([v21 count] != (id)1)
  {
    unsigned __int8 v23 = [v13 containsObject:v15];

    if (v23) {
      goto LABEL_10;
    }
LABEL_15:
    BOOL v17 = sub_100008DCC();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    long long v24 = [v11 initiator];
    int v26 = [v24 normalizedValue];
    unsigned int v27 = [v12 normalizedValue];
    int v34 = 138412802;
    unsigned int v35 = v26;
    __int16 v36 = 2112;
    id v37 = v27;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring responded elsewhere message since this did not come from the originator (%@), handle: %@, or one of our aliases: %@.", (uint8_t *)&v34, 0x20u);

    goto LABEL_20;
  }
  long long v22 = [v11 initiator];
  if (![v22 isEquivalentToHandle:v12])
  {
    unsigned __int8 v25 = [v13 containsObject:v15];

    if (v25) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

LABEL_10:
  if ([v11 state] != (id)2 && objc_msgSend(v11, "state") != (id)3)
  {
    id v28 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
    CFStringRef v29 = [v11 UUID];
    BOOL v17 = [v28 objectForKeyedSubscript:v29];

    if (!v17) {
      goto LABEL_22;
    }
    unsigned __int8 v30 = [v11 UUID];
    [(CSDFaceTimeConversationProviderDelegate *)self setCallUUID:0 forConversationUUID:v30];

    [(CSDAbstractFaceTimeConversationProviderDelegate *)self setConversationUUID:0 forCallUUID:v17];
    long long v31 = [v11 UUID];
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self setWaitingToJoin:0 forConversationUUID:v31];

    [(CSDAbstractFaceTimeConversationProviderDelegate *)self updateNetworkCriticalStateIfNecessary];
    uint64_t v32 = [v10 disconnectedReason];
    unsigned int v33 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    [v33 reportCallWithUUID:v17 endedAtDate:0 privateReason:v32];

    if ([v11 state] != (id)1) {
      goto LABEL_22;
    }
    long long v24 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    int v26 = [v11 UUID];
    [v24 leaveConversationWithUUID:v26];
LABEL_20:

    goto LABEL_21;
  }
  BOOL v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    long long v24 = [v11 UUID];
    int v34 = 138412290;
    unsigned int v35 = v24;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring message that we've responded elsewhere for conversation %@ since the conversation is already joining or is joined.", (uint8_t *)&v34, 0xCu);
LABEL_21:
  }
LABEL_22:
}

- (void)handleRespondedElsewhereMessage:(id)a3 forConversation:(id)a4 fromHandle:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = +[CSDFaceTimeMultiwayIDSService sharedInstance];
  id v11 = [v12 allAliases];
  [(CSDFaceTimeConversationProviderDelegate *)self handleRespondedElsewhereMessage:v10 forConversation:v9 fromHandle:v8 withAliases:v11];
}

- (void)startOutgoingOneToOneTimeoutIfNecessary:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  id v9 = [v8 conversationsByUUID];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if (![(CSDFaceTimeConversationProviderDelegate *)self isWaitingForRemoteJoinForConversationUUID:v7])
  {
    if ([(CSDFaceTimeConversationProviderDelegate *)self isUnansweredOutgoingOneToOneConversation:v10])
    {
      id v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self invitationResolver];
      id v12 = [v10 localMember];
      id v13 = [v12 handle];
      unsigned int v14 = [v11 shouldStartRingingTimeoutForConversation:v10 handle:v13];

      if (v14)
      {
        [(CSDFaceTimeConversationProviderDelegate *)self setWaitingForRemoteJoin:1 forConversationUUID:v7];
        dispatch_time_t v15 = dispatch_time(0, 30000000000);
        id v16 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10018455C;
        v17[3] = &unk_1005053D0;
        v17[4] = self;
        id v18 = v7;
        id v19 = v4;
        id v20 = v10;
        dispatch_after(v15, v16, v17);
      }
    }
  }
}

- (BOOL)isUnansweredOutgoingOneToOneConversation:(id)a3
{
  id v3 = a3;
  if (![v3 isLocallyCreated] || !objc_msgSend(v3, "isOneToOneModeEnabled")) {
    goto LABEL_17;
  }
  if ([v3 state] != (id)2 && objc_msgSend(v3, "state") != (id)1)
  {
    if ([v3 state] == (id)3)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v4 = objc_msgSend(v3, "activeRemoteParticipants", 0);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v4);
            }
            if ([*(id *)(*((void *)&v11 + 1) + 8 * i) audioVideoMode])
            {
              BOOL v5 = 0;
              goto LABEL_6;
            }
          }
          id v7 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
      BOOL v5 = 1;
      goto LABEL_6;
    }
LABEL_17:
    BOOL v5 = 0;
    goto LABEL_18;
  }
  id v4 = [v3 activeRemoteParticipants];
  BOOL v5 = [v4 count] == 0;
LABEL_6:

LABEL_18:
  return v5;
}

- (void)declineRemoteDevicesForConversation:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = +[CSDFaceTimeMultiwayIDSService sharedInstance];
  uint64_t v8 = [v7 service];

  id v9 = [v8 devices];
  id v10 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v9;
  long long v12 = (char *)[v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v12)
  {
    long long v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      dispatch_time_t v15 = 0;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)IDSCopyIDForDevice();
        if ([v16 length]) {
          [v10 addObject:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      long long v13 = (char *)[v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v13);
  }

  BOOL v17 = +[CSDFaceTimeMultiwayIDSService sharedInstance];
  id v18 = [v17 allAliases];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v19 = v18;
  id v20 = (char *)[v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v20)
  {
    long long v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      unsigned __int8 v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = TUCopyIDSCanonicalAddressForDestinationID();
        if ([v24 length]) {
          [v10 addObject:v24];
        }

        ++v23;
      }
      while (v21 != v23);
      long long v21 = (char *)[v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v21);
  }

  [(CSDFaceTimeConversationProviderDelegate *)self declineConversation:v5 reason:a4 destinations:v10];
}

- (void)declineRemoteMembersForConversation:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [v6 remoteMembers];
  id v9 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v8 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        dispatch_time_t v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v14), "idsDestination", (void)v16);
        if ([v15 length]) {
          [v9 addObject:v15];
        }

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [(CSDFaceTimeConversationProviderDelegate *)self declineConversation:v6 reason:a4 destinations:v9];
}

- (void)declineConversation:(id)a3 reason:(int64_t)a4 destinations:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [CSDMessagingConversationMessage alloc];
  id v12 = [v9 groupUUID];
  uint64_t v13 = [(CSDMessagingConversationMessage *)v11 initWithType:6 groupUUID:v12 link:0];

  [(CSDMessagingConversationMessage *)v13 setDisconnectedReason:a4];
  uint64_t v14 = [v9 localMember];

  dispatch_time_t v15 = [v14 handle];
  long long v16 = [v15 value];

  long long v17 = +[CSDFaceTimeMultiwayIDSService sharedInstance];
  long long v18 = [v17 accountWithCallerID:v16];

  long long v19 = v8;
  id v20 = +[CSDFaceTimeMultiwayIDSService sharedInstance];
  long long v21 = sub_100008DCC();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v37 = a4;
    __int16 v38 = 2048;
    id v39 = [v19 count];
    __int16 v40 = 2112;
    id v41 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "declineConversation: reason: %ld, destinations count: %lu, destinations: %@", buf, 0x20u);
  }

  long long v31 = v13;
  uint64_t v22 = [(CSDMessagingConversationMessage *)v13 data];
  uint64_t v34 = IDSSendMessageOptionFromIDKey;
  unsigned __int8 v23 = TUCopyIDSCanonicalAddressForDestinationID();
  unsigned int v35 = v23;
  long long v24 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v32 = 0;
  id v33 = 0;
  unsigned __int8 v25 = v19;
  unsigned int v26 = [v20 sendData:v22 fromAccount:v18 toDestinations:v19 priority:300 options:v24 identifier:&v33 error:&v32];
  id v27 = v33;
  id v28 = v32;

  long long v29 = sub_100008DCC();
  long long v30 = v29;
  if (v26)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      int64_t v37 = (int64_t)v27;
      __int16 v38 = 2112;
      id v39 = v16;
      __int16 v40 = 2112;
      id v41 = v18;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Successfully sent message with identifier: %@ handle:%@ account: %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    sub_1003AEB74();
  }
}

- (void)conversationManager:(id)a3 joinConversationWithRequest:(id)a4
{
  objc_msgSend(a4, "joinCallAction", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CSDFaceTimeConversationProviderDelegate *)self performJoinCallAction:v5];
}

- (void)conversationManager:(id)a3 avModeChanged:(unint64_t)a4 toAVMode:(unint64_t)a5 forConversation:(id)a6
{
  id v9 = a6;
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 UUID];
    *(_DWORD *)buf = 134218498;
    unint64_t v50 = a4;
    __int16 v51 = 2048;
    unint64_t v52 = a5;
    __int16 v53 = 2112;
    CFStringRef v54 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Mode changing fromMode %lu, toMode: %lu, conversationUUID: %@", buf, 0x20u);
  }
  if (!a4 && a5)
  {
    id v12 = +[NSUUID UUID];
    uint64_t v13 = [v9 UUID];
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self associateCallUUID:v12 withConversationUUID:v13 waitingToJoin:1];

    uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsAwaitingActiveAudioSession];
    dispatch_time_t v15 = [v9 UUID];
    [v14 addObject:v15];

    if ([v9 state] == (id)3)
    {
      long long v16 = [v9 remoteMembers];
      if ([v16 count] != (id)1)
      {
LABEL_18:

        goto LABEL_19;
      }
      long long v17 = [v9 activeRemoteParticipants];
      if (![v17 count])
      {

LABEL_17:
        long long v16 = [(CSDFaceTimeConversationProviderDelegate *)self conversationUUIDsUpgradedFromAVLess];
        long long v30 = [v9 UUID];
        [v16 addObject:v30];

        goto LABEL_18;
      }
      long long v18 = [v9 activeRemoteParticipants];
      long long v19 = [v18 anyObject];
      id v20 = [v19 audioVideoMode];

      if (!v20) {
        goto LABEL_17;
      }
    }
LABEL_19:
    long long v31 = sub_100008DCC();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [v9 UUID];
      *(_DWORD *)buf = 138412546;
      unint64_t v50 = (unint64_t)v12;
      __int16 v51 = 2112;
      unint64_t v52 = (unint64_t)v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Mode changing from None, Started tracking callUUID: %@ conversationUUID: %@", buf, 0x16u);
    }
    id v28 = [objc_alloc((Class)CXCallUpdate) initWithTUConversation:v9];
    if (([v28 hasVideo] & 1) == 0) {
      [v28 updatePropertiesForVideo:a5 == 2];
    }
    id v33 = [v9 remoteMembers];
    id v34 = [v33 count];

    if (v34 == (id)1)
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      unsigned int v35 = objc_msgSend(v9, "activeRemoteParticipants", 0);
      id v36 = [v35 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v45;
        while (2)
        {
          id v39 = 0;
          do
          {
            if (*(void *)v45 != v38) {
              objc_enumerationMutation(v35);
            }
            if ([*(id *)(*((void *)&v44 + 1) + 8 * (void)v39) audioVideoMode])
            {

              goto LABEL_34;
            }
            id v39 = (char *)v39 + 1;
          }
          while (v37 != v39);
          id v37 = [v35 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v37) {
            continue;
          }
          break;
        }
      }

      __int16 v40 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
      [v40 reportNewOutgoingCallWithUUID:v12 update:v28];

      id v41 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
      [v41 reportOutgoingCallWithUUID:v12 sentInvitationAtDate:0];

      [(CSDFaceTimeConversationProviderDelegate *)self startOutgoingOneToOneTimeoutIfNecessary:v12];
      goto LABEL_36;
    }
LABEL_34:
    v42 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    [v42 reportNewOutgoingCallWithUUID:v12 update:v28];

    long long v29 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    v43 = +[NSDate date];
    [v29 reportOutgoingCallWithUUID:v12 connectedAtDate:v43];

LABEL_35:
LABEL_36:

    goto LABEL_37;
  }
  if (a4 && !a5)
  {
    long long v21 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
    uint64_t v22 = [v9 UUID];
    id v12 = [v21 objectForKeyedSubscript:v22];

    if (!v12)
    {
LABEL_37:

      goto LABEL_38;
    }
    unsigned __int8 v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      long long v24 = [v9 UUID];
      *(_DWORD *)buf = 138412546;
      unint64_t v50 = (unint64_t)v12;
      __int16 v51 = 2112;
      unint64_t v52 = (unint64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Mode changing to None, Stopping tracking callUUID: %@ conversationUUID: %@", buf, 0x16u);
    }
    unsigned __int8 v25 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    unsigned int v26 = +[NSDate date];
    [v25 reportCallWithUUID:v12 endedAtDate:v26 reason:0];

    id v27 = [v9 UUID];
    [(CSDFaceTimeConversationProviderDelegate *)self setCallUUID:0 forConversationUUID:v27];

    [(CSDAbstractFaceTimeConversationProviderDelegate *)self setConversationUUID:0 forCallUUID:v12];
    id v28 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsAwaitingActiveAudioSession];
    long long v29 = [v9 UUID];
    [v28 removeObject:v29];
    goto LABEL_35;
  }
LABEL_38:
}

- (void)conversationManager:(id)a3 remoteMembersChanged:(id)a4 forConversation:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 state] == (id)3)
  {
    id v10 = [(CSDFaceTimeConversationProviderDelegate *)self blockUtilities];
    unsigned int v11 = [v10 blockListContainsMembers:v8 providerIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

    if (v11)
    {
      id v12 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
      uint64_t v13 = [v9 UUID];
      uint64_t v14 = [v12 objectForKeyedSubscript:v13];

      if (v14)
      {
        dispatch_time_t v15 = [v9 UUID];
        [v18 leaveConversationWithUUID:v15];

        long long v16 = [(CSDFaceTimeConversationProviderDelegate *)self blockUtilities];
        long long v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
        [v16 reportFailureForReason:16 provider:v17 callUUID:v14 actionToFail:0];
      }
    }
  }
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  id v10 = [v7 UUID];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  id v12 = [v7 remoteMembers];
  if ([v12 count] != (id)1 && objc_msgSend(v7, "avMode") == (id)1)
  {
    id v13 = [v7 resolvedAudioVideoMode];

    if (v13 != (id)2) {
      goto LABEL_8;
    }
    uint64_t v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found that a remote user had upgraded to video, upgrading our local conversation to video", buf, 2u);
    }

    id v12 = [v7 UUID];
    [v6 setVideo:1 forConversationWithUUID:v12];
  }

LABEL_8:
  id v78 = [objc_alloc((Class)CXCallUpdate) initWithTUConversation:v7];
  dispatch_time_t v15 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
  v77 = (__CFString *)v11;
  if (![v15 avLessSharePlayEnabled])
  {
    long long v17 = v78;
LABEL_19:

    goto LABEL_20;
  }
  long long v16 = [v7 mergedRemoteMembers];
  long long v17 = v78;
  if ([v16 count] != (id)1)
  {
LABEL_18:

    goto LABEL_19;
  }
  id v18 = [v7 mergedActiveRemoteParticipants];
  if ([v18 count] != (id)1)
  {

    goto LABEL_18;
  }
  id v19 = [v7 avMode];

  if (!v19)
  {
    id v20 = [v7 activeRemoteParticipants];
    dispatch_time_t v15 = [v20 anyObject];

    if ([v15 audioVideoMode] == (id)2)
    {
      long long v21 = sub_100008DCC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "conversationChanged for U+1 call with avMode=video remote participant, upgrading CXCallUpdate to video=1", buf, 2u);
      }

      [v78 updatePropertiesForVideo:1];
    }
    goto LABEL_19;
  }
LABEL_20:
  if ([v7 isVideoEnabled] && (objc_msgSend(v7, "isVideoPaused") & 1) == 0) {
    [v17 setSendingVideo:1];
  }
  uint64_t v22 = self;
  v76 = v6;
  if ((uint64_t)[v7 state] >= 1
    && [v7 avMode]
    && ([v7 isVideoEnabled] & 1) == 0)
  {
    [v17 setSendingVideo:0];
  }
  unsigned __int8 v23 = [v7 remoteMembers];
  long long v24 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v23 count]);

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  unsigned __int8 v25 = [v7 remoteMembers];
  id v26 = [v25 countByEnumeratingWithState:&v87 objects:v95 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v88;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v88 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = [*(id *)(*((void *)&v87 + 1) + 8 * i) handle];
        long long v31 = +[CXHandle handleWithTUHandle:v30];
        [v24 addObject:v31];
      }
      id v27 = [v25 countByEnumeratingWithState:&v87 objects:v95 count:16];
    }
    while (v27);
  }

  id v32 = v78;
  [v78 setRemoteParticipantHandles:v24];
  id v33 = [v7 activeRemoteParticipantCXHandles];
  [v78 setActiveRemoteParticipantHandles:v33];

  objc_msgSend(v78, "setOneToOneModeEnabled:", objc_msgSend(v7, "isOneToOneModeEnabled"));
  objc_msgSend(v78, "setScreenSharingType:", objc_msgSend(v7, "screenSharingType"));
  id v34 = [v7 mergedRemoteMembers];
  if ([v34 count] != (id)1)
  {
    id v39 = v77;
LABEL_41:

    goto LABEL_42;
  }
  unsigned int v35 = [v7 mergedActiveRemoteParticipants];
  if ([v35 count] != (id)1)
  {
    id v39 = v77;
    goto LABEL_40;
  }
  id v36 = [v7 mergedActiveRemoteParticipants];
  id v37 = [v36 anyObject];
  id v38 = [v37 streamToken];

  id v39 = v77;
  if (v38)
  {
    id v34 = [v7 mergedActiveRemoteParticipants];
    unsigned int v35 = [v34 anyObject];
    objc_msgSend(v78, "setVideoStreamToken:", objc_msgSend(v35, "streamToken"));
LABEL_40:

    goto LABEL_41;
  }
LABEL_42:
  switch((unint64_t)[v7 state])
  {
    case 0uLL:
      __int16 v40 = [v7 UUID];
      unsigned __int8 v41 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 _isWaitingToJoinForConversationUUID:v40];

      if ((v41 & 1) == 0)
      {
        if ([v7 isScreening] && objc_msgSend(v7, "isOneToOneModeEnabled"))
        {
          v42 = sub_100008DCC();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Screening enabled, already ends the session, no need to cleanup conversation", buf, 2u);
          }
        }
        else
        {
          v42 = [v7 failureContext];
          if (!v42)
          {
            v42 = objc_alloc_init((Class)CXCallFailureContext);
            [v42 setFailureReason:0];
            [v42 setProviderEndedReason:504];
          }
          id v57 = [v7 UUID];
          [(CSDFaceTimeConversationProviderDelegate *)v22 cleanUpConversationIfNecessaryForConversationUUID:v57 failureContext:v42];
        }
      }
      if (v39)
      {
        if (![v78 hasVideo]) {
          goto LABEL_71;
        }
        v58 = [v78 remoteParticipantHandles];
        id v59 = [v58 count];

        if ((unint64_t)v59 < 2 || [v7 resolvedAudioVideoMode] == (id)2) {
          goto LABEL_71;
        }
        [v78 setSendingVideo:0];
        unsigned int v49 = sub_100008DCC();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v60 = [v78 isSendingVideo];
          CFStringRef v61 = @"NO";
          if (v60) {
            CFStringRef v61 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v92 = v61;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Setting sendingVideo=%@ for conversationChanged", buf, 0xCu);
        }
        goto LABEL_56;
      }
      goto LABEL_75;
    case 1uLL:
      [(CSDFaceTimeConversationProviderDelegate *)v22 startOutgoingOneToOneTimeoutIfNecessary:v39];
      [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 fullfillPendingJoinActionsForCallUUIDIfNecessary:v39];
      if (v39) {
        goto LABEL_71;
      }
      goto LABEL_75;
    case 2uLL:
      if (!v39)
      {
        v56 = sub_100008DCC();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          sub_1003AEC44();
        }
        goto LABEL_74;
      }
      if ([v7 isLocallyCreated])
      {
        if (([v7 isOneToOneModeEnabled] & 1) == 0)
        {
          [v78 setRequiresInCallSounds:0];
          v43 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 provider];
          long long v44 = +[NSDate date];
          [v43 reportOutgoingCallWithUUID:v39 startedConnectingAtDate:v44];
        }
        long long v45 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 provider];
        long long v46 = +[NSDate date];
        [v45 reportOutgoingCallWithUUID:v39 sentInvitationAtDate:v46];
      }
      long long v47 = +[TUCallCenter sharedInstance];
      v48 = [(__CFString *)v39 UUIDString];
      unsigned int v49 = [v47 callWithCallUUID:v48];

      -[NSObject setStartAsOneToOneMode:](v49, "setStartAsOneToOneMode:", [v7 isOneToOneModeEnabled]);
      [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 fullfillPendingJoinActionsForCallUUIDIfNecessary:v39];
LABEL_56:

      goto LABEL_71;
    case 3uLL:
      if (!v39)
      {
        if (![v7 isEligibleForCall]) {
          goto LABEL_75;
        }
        __int16 v62 = sub_100008DCC();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_1003AEBDC();
        }

        v56 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 conversationManager];
        id v63 = [v7 UUID];
        [v56 leaveConversationWithUUID:v63];

LABEL_74:
        goto LABEL_75;
      }
      if ([v7 avMode])
      {
        if ([v7 isOneToOneModeEnabled])
        {
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          unint64_t v50 = [v7 activeRemoteParticipants];
          id v51 = [v50 countByEnumeratingWithState:&v83 objects:v94 count:16];
          if (v51)
          {
            id v52 = v51;
            uint64_t v53 = *(void *)v84;
            while (2)
            {
              for (j = 0; j != v52; j = (char *)j + 1)
              {
                if (*(void *)v84 != v53) {
                  objc_enumerationMutation(v50);
                }
                if ([*(id *)(*((void *)&v83 + 1) + 8 * (void)j) audioVideoMode])
                {

                  unint64_t v50 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 faceTimeDemuxerDelegate];
                  v64 = +[NSDate date];
                  [v50 providerDelegate:v22 callWithUUID:v39 connectedAtDate:v64];
                  id v32 = v78;
                  goto LABEL_96;
                }
              }
              id v52 = [v50 countByEnumeratingWithState:&v83 objects:v94 count:16];
              if (v52) {
                continue;
              }
              break;
            }
            id v32 = v78;
          }
        }
        else
        {
          unint64_t v50 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 provider];
          v64 = +[NSDate date];
          [v50 reportOutgoingCallWithUUID:v39 connectedAtDate:v64];
LABEL_96:
        }
      }
      if ([v7 isOneToOneModeEnabled]) {
        [v32 setConversation:1];
      }
      v65 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 provider];
      v66 = [v65 pendingCallActionsOfClass:objc_opt_class() withCallUUID:v39];

      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v67 = v66;
      id v68 = [v67 countByEnumeratingWithState:&v79 objects:v93 count:16];
      if (v68)
      {
        id v69 = v68;
        uint64_t v70 = *(void *)v80;
        do
        {
          for (k = 0; k != v69; k = (char *)k + 1)
          {
            if (*(void *)v80 != v70) {
              objc_enumerationMutation(v67);
            }
            [*(id *)(*((void *)&v79 + 1) + 8 * (void)k) fulfill];
          }
          id v69 = [v67 countByEnumeratingWithState:&v79 objects:v93 count:16];
        }
        while (v69);
      }

      id v32 = v78;
      objc_msgSend(v78, "setSharingScreen:", objc_msgSend(v7, "isScreenEnabled"));
      if ([v78 mixesVoiceWithMedia])
      {
        v72 = +[TUCallCenter sharedInstance];
        v73 = [(__CFString *)v39 UUIDString];
        v74 = [v72 callWithCallUUID:v73];

        v75 = [v74 sourceIdentifier];
        [v78 setIgnoresBluetoothDeviceUID:v75 != 0];

        id v39 = v77;
      }
      if ([v7 avMode]) {
        [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 fullfillPendingJoinActionsForCallUUIDIfNecessary:v39];
      }

      if (v39)
      {
LABEL_71:
        __int16 v55 = sub_100008DCC();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v92 = v39;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "converstaionChanged: report call with uuid: %@", buf, 0xCu);
        }

        v56 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v22 provider];
        [v56 reportCallWithUUID:v39 updated:v32];
        goto LABEL_74;
      }
LABEL_75:

      return;
    case 4uLL:
      [v78 setMixesVoiceWithMedia:0];
      goto LABEL_70;
    default:
LABEL_70:
      if (v39) {
        goto LABEL_71;
      }
      goto LABEL_75;
  }
}

- (void)conversationManager:(id)a3 conversationScreenSharingChanged:(id)a4 forParticipant:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags];
  unsigned __int8 v10 = [v9 screenSharingDeskViewEnabled];

  if ((v10 & 1) == 0 && [v8 isScreenEnabled])
  {
    [(CSDFaceTimeConversationProviderDelegate *)self launchScreenSharingAppIfNecessary];
    uint64_t v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Conversation screen sharing changed: %@ \n participant: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  id v9 = [v8 conversationsByUUID];
  unsigned __int8 v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    uint64_t v11 = [v10 provider];
    unsigned int v12 = [v11 isDefaultProvider];
  }
  else
  {
    unsigned int v12 = 1;
  }
  v15.receiver = self;
  v15.super_class = (Class)CSDFaceTimeConversationProviderDelegate;
  unsigned int v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)&v15 isManagingCallWithUUID:v4] & v12;

  return v13;
}

- (void)conversationManager:(id)a3 conversation:(id)a4 receivedMessage:(id)a5 fromHandle:(id)a6 withUpdate:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v15 = a4;
  __int16 v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v14);

  [(CSDFaceTimeConversationProviderDelegate *)self handleMessage:v13 forConversation:v15 fromHandle:v12 withUpdate:v11];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 failedWithContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v9);

  unsigned __int8 v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v7 UUID];
    int v13 = 138412546;
    __int16 v14 = v11;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Conversation with UUID %@ failed with context: %@", (uint8_t *)&v13, 0x16u);
  }
  id v12 = [v7 UUID];
  [(CSDFaceTimeConversationProviderDelegate *)self cleanUpConversationIfNecessaryForConversationUUID:v12 failureContext:v8];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 addedActiveParticipant:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v9);

  unsigned __int8 v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  id v11 = [v10 conversationsByUUID];
  id v12 = [v7 UUID];
  int v13 = [v11 objectForKeyedSubscript:v12];

  if (!v13)
  {
    __int16 v15 = sub_100008DCC();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:

      goto LABEL_17;
    }
    id v19 = [v7 UUID];
    id v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    long long v21 = [v20 conversationsByUUID];
    uint64_t v22 = [v21 allValues];
    int v32 = 138412546;
    id v33 = v19;
    __int16 v34 = 2112;
    id v35 = v22;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Exiting addedActiveParticipant callback early since conversation with UUID %@ has been removed - current conversations are %@", (uint8_t *)&v32, 0x16u);

LABEL_15:
    goto LABEL_16;
  }
  if ([v13 state] == (id)1)
  {
    id v14 = [v13 letMeInRequestState];
    if ([v13 isOneToOneModeEnabled])
    {
      if (v14 == (id)3)
      {
        __int16 v15 = sub_100008DCC();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [v13 state];
          id v17 = [v13 letMeInRequestState];
          id v18 = [v13 UUID];
          int v32 = 134218754;
          id v33 = v16;
          __int16 v34 = 2048;
          id v35 = v17;
          __int16 v36 = 2112;
          id v37 = v18;
          __int16 v38 = 2112;
          id v39 = v8;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not reporting a U+1 call as connecting when active participant is added since it is going through LMI flow (state %ld and LMI state %ld) and should not connect until user presses join in the staging area; conversatio"
            "n UUID %@: addedActiveParticipant %@.",
            (uint8_t *)&v32,
            0x2Au);
        }
        goto LABEL_16;
      }
      goto LABEL_10;
    }
  }
  else if ([v13 isOneToOneModeEnabled])
  {
LABEL_10:
    unsigned __int8 v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v13 state];
      id v25 = [v13 letMeInRequestState];
      id v26 = [v13 UUID];
      int v32 = 134218754;
      id v33 = v24;
      __int16 v34 = 2048;
      id v35 = v25;
      __int16 v36 = 2112;
      id v37 = v26;
      __int16 v38 = 2112;
      id v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Reporting call as connecting and isConversation=true since conversation (state: %ld LMI state: %ld) with UUID %@: addedActiveParticipant %@.", (uint8_t *)&v32, 0x2Au);
    }
    id v27 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
    uint64_t v28 = [v13 UUID];
    __int16 v15 = [v27 objectForKeyedSubscript:v28];

    id v19 = [objc_alloc((Class)CXCallUpdate) initWithTUConversation:v13];
    if (v15)
    {
      long long v29 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
      [v29 reportCallWithUUID:v15 updated:v19];

      if ([v13 isLocallyCreated])
      {
        long long v30 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self faceTimeDemuxerDelegate];
        long long v31 = +[NSDate date];
        [v30 providerDelegate:self callWithUUID:v15 startedConnectingAtDate:v31];
      }
    }
    goto LABEL_15;
  }
LABEL_17:
}

- (void)conversationManager:(id)a3 removedConversationWithUUID:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  id v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ending callUUID:%@ with conversation with UUID %@:", (uint8_t *)&v12, 0x16u);
    }

    [(CSDFaceTimeConversationProviderDelegate *)self setCallUUID:0 forConversationUUID:v5];
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self setConversationUUID:0 forCallUUID:v8];
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self setWaitingToJoin:0 forConversationUUID:v5];
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self removeActiveAudioSessionObjectForConversationWithUUID:v5];
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self updateNetworkCriticalStateIfNecessary];
    unsigned __int8 v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    id v11 = +[NSDate date];
    [v10 reportCallWithUUID:v8 endedAtDate:v11 reason:2];
  }
}

- (void)conversationManager:(id)a3 conversation:(id)a4 changedBytesOfDataUsed:(int64_t)a5
{
  id v7 = a4;
  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  unsigned __int8 v10 = [v7 UUID];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11) {
    goto LABEL_5;
  }
  int v12 = [(CSDFaceTimeConversationProviderDelegate *)self recentlyDeletedCallUUIDsByConversationUUID];
  int v13 = [v7 UUID];
  id v11 = [v12 objectForKeyedSubscript:v13];

  __int16 v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CallUUID: %@ is fetched from recentlyDeletedCallUUIDsByConversationUUID since the call was ended and we could not find it in callUUIDsByConversationUUID", (uint8_t *)&v19, 0xCu);
  }

  if (v11)
  {
LABEL_5:
    id v15 = [(CSDFaceTimeConversationProviderDelegate *)self recentlyDeletedCallUUIDsByConversationUUID];
    id v16 = [v7 UUID];
    [v15 setObject:0 forKeyedSubscript:v16];

    id v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    id v18 = [v11 UUIDString];
    [v17 reportCallWithUUID:v11 crossDeviceIdentifier:v18 changedBytesOfDataUsed:a5];
  }
}

- (void)conversationManager:(id)a3 reportedLetMeInRejectedForPendingConversation:(id)a4
{
  id v6 = a4;
  id v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDFaceTimeConversationProviderDelegate *)self _failConversation:v6 failureReason:8 providerEndedReason:521];
}

- (void)conversationManager:(id)a3 reportedInvalidLinkForPendingConversation:(id)a4
{
  id v6 = a4;
  id v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDFaceTimeConversationProviderDelegate *)self _failConversation:v6 failureReason:9 providerEndedReason:526];
}

- (void)_failConversation:(id)a3 failureReason:(int64_t)a4 providerEndedReason:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v9);

  unsigned __int8 v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  id v11 = [v8 UUID];
  int v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    [(CSDFaceTimeConversationProviderDelegate *)self leaveConversation:v8 withCallUUID:v12 reason:1];
    id v13 = objc_alloc_init((Class)CXCallFailureContext);
    [v13 setFailureReason:a4];
    [v13 setProviderEndedReason:a5];
    __int16 v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    [v14 reportCallWithUUID:v12 failedAtDate:0 withContext:v13];

    id v15 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self faceTimeDemuxerDelegate];
    id v16 = +[NSDate now];
    [v15 providerDelegate:self callWithUUID:v12 endedAtDate:v16 withReason:2 failureContext:0];
  }
  else
  {
    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v8 UUID];
      int v19 = 134218242;
      int64_t v20 = a4;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Could not fail conversation with reason %ld callUUID not found for conversation UUID %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)conversationManager:(id)a3 reportedHandedOffConversation:(id)a4 replacedByIdentifier:(unint64_t)a5 localizedHandoffRecipientDeviceCategory:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v11);

  int v12 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  id v13 = [v9 UUID];
  __int16 v14 = [v12 objectForKeyedSubscript:v13];

  if (v14)
  {
    id v15 = +[TUCallCenter sharedInstance];
    id v16 = [v14 UUIDString];
    id v17 = [v15 callWithCallUUID:v16];

    [v17 setEndDueToHandoff:1];
    id v18 = [objc_alloc((Class)CXCallUpdate) initWithTUConversation:v9];
    [v18 setLocalizedHandoffRecipientDeviceCategory:v10];
    int v19 = +[NSNumber numberWithUnsignedLongLong:a5];
    [v18 setHandoffRecipientParticipant:v19];

    [(CSDFaceTimeConversationProviderDelegate *)self leaveConversation:v9 withCallUUID:v14 reason:102];
    int64_t v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    [v20 reportCallWithUUID:v14 updated:v18];

    __int16 v21 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    uint64_t v22 = +[NSDate now];
    [v21 reportCallWithUUID:v14 endedAtDate:v22 privateReason:102];

    unsigned __int8 v23 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self faceTimeDemuxerDelegate];
    id v24 = +[NSDate now];
    [v23 providerDelegate:self callWithUUID:v14 endedAtDate:v24 withReason:102 failureContext:0];
  }
  else
  {
    id v25 = sub_100008DCC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v9 UUID];
      int v27 = 138412290;
      uint64_t v28 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[WARN] Could not report conversation as continued as could not find call for conversation UUID %@", (uint8_t *)&v27, 0xCu);
    }
  }
}

- (void)conversationManager:(id)a3 reportedRemoteDoesHandedOffForConversation:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  id v8 = [v5 UUID];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = +[TUCallCenter sharedInstance];
    id v11 = [v9 UUIDString];
    int v12 = [v10 callWithCallUUID:v11];

    [v12 setRemoteDoesHandoff:1];
    id v13 = sub_100008DCC();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }
    int v16 = 138412290;
    id v17 = v12;
    __int16 v14 = "reportedRemoteDoesHandedOffForConversation: for call: %@";
    id v15 = v13;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
    goto LABEL_7;
  }
  int v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v5 UUID];
    int v16 = 138412290;
    id v17 = v13;
    __int16 v14 = "[WARN] Could not report conversation: not find call for conversation UUID %@";
    id v15 = v12;
    goto LABEL_6;
  }
LABEL_8:
}

- (void)conversationManager:(id)a3 connectionDidStartForConversation:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
  id v7 = [v5 UUID];

  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    [(CSDFaceTimeConversationProviderDelegate *)self startOutgoingOneToOneTimeoutIfNecessary:v8];
  }
  else
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003AECAC();
    }
  }
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 138412290;
    id v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Joining conversation for answer call action: %@", (uint8_t *)&v36, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  id v10 = [v8 objectForKeyedSubscript:v9];

  id v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  int v12 = [v11 conversationsByUUID];
  id v13 = [v12 objectForKeyedSubscript:v10];

  __int16 v14 = [(CSDFaceTimeConversationProviderDelegate *)self blockUtilities];
  id v15 = [v13 remoteMembers];
  unsigned int v16 = [v14 blockListContainsMembers:v15 providerIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

  if (v16)
  {
    id v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
    id v18 = [v13 UUID];
    int v19 = [v17 objectForKeyedSubscript:v18];

    if (!v19)
    {
LABEL_33:

      goto LABEL_34;
    }
    int64_t v20 = [(CSDFaceTimeConversationProviderDelegate *)self blockUtilities];
    __int16 v21 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
    [(CSDConversationJoinContext *)v20 reportFailureForReason:16 provider:v21 callUUID:v19 actionToFail:v5];

LABEL_32:
    goto LABEL_33;
  }
  uint64_t v22 = [v13 link];
  if (!v22 || (unsigned __int8 v23 = (void *)v22, v24 = TULockdownModeEnabled(), v23, !v24))
  {
    id v26 = +[TUCallCenter sharedInstance];
    int v27 = [v5 callUUID];
    uint64_t v28 = [v27 UUIDString];
    int v19 = [v26 callWithCallUUID:v28];

    if (!v13)
    {
      long long v30 = sub_100008DCC();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1003AECE0();
      }

      [v5 fail];
      goto LABEL_33;
    }
    if ([v13 endpointOnCurrentDevice]) {
      uint64_t v29 = [v5 downgradeToAudio] ^ 1;
    }
    else {
      uint64_t v29 = 0;
    }
    int64_t v20 = objc_alloc_init(CSDConversationJoinContext);
    if (([v13 isVideo] & 1) != 0 || objc_msgSend(v19, "isVideo")) {
      uint64_t v31 = v29;
    }
    else {
      uint64_t v31 = 0;
    }
    [(CSDConversationJoinContext *)v20 setVideo:v31];
    if (-[CSDConversationJoinContext isVideo](v20, "isVideo") && [v19 isSendingVideo]) {
      uint64_t v32 = v29 & ~[v5 pauseVideoToStart];
    }
    else {
      uint64_t v32 = 0;
    }
    [(CSDConversationJoinContext *)v20 setVideoEnabled:v32];
    if ([(CSDConversationJoinContext *)v20 isVideo]) {
      uint64_t v33 = 2;
    }
    else {
      uint64_t v33 = 1;
    }
    [(CSDConversationJoinContext *)v20 setAvMode:v33];
    __int16 v34 = [v13 provider];
    [(CSDConversationJoinContext *)v20 setProvider:v34];

    -[CSDConversationJoinContext setScreening:](v20, "setScreening:", [v5 screening]);
    -[CSDConversationJoinContext setSpatialPersonaEnabled:](v20, "setSpatialPersonaEnabled:", [v13 isSpatialPersonaEnabled]);
    if (+[AVAudioClient hasActiveAudioSession]) {
      [(CSDAbstractFaceTimeConversationProviderDelegate *)self setAudioSessionActive:1];
    }
    id v35 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    [v35 joinExistingConversationWithUUID:v10 context:v20];

    [(CSDAbstractFaceTimeConversationProviderDelegate *)self enqueueOrStartAudioForConversationUUID:v10];
    [(CSDFaceTimeConversationProviderDelegate *)self declineRemoteDevicesForConversation:v13 reason:4];
    goto LABEL_32;
  }
  id v25 = sub_100008DCC();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_1003AED48();
  }

  [v5 fail];
LABEL_34:
}

- (id)linkForJoinCallAction:(id)a3 inLinks:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v5;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finding a matching link in join call action %@ %@", buf, 0x16u);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        __int16 v14 = objc_msgSend(v5, "pseudonym", (void)v21);
        id v15 = [v5 publicKey];
        unsigned int v16 = [v13 isEquivalentToPseudonym:v14 andPublicKey:v15];

        if (v16)
        {
          int v19 = sub_100008DCC();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v27 = v5;
            __int16 v28 = 2112;
            id v29 = v13;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found matching link for join call action %@ %@", buf, 0x16u);
          }

          id v18 = [v13 copy];
          id v17 = v8;
          goto LABEL_17;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v17 = sub_100008DCC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Couldn't find a matching link in join call action %@", buf, 0xCu);
  }
  id v18 = 0;
LABEL_17:

  return v18;
}

- (id)activatedLinkForJoinCallAction:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finding a matching activated link in join call action %@", (uint8_t *)&v19, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  id v9 = [v8 activatedConversationLinksWithError:a4];

  if (*a4)
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1003AED7C((uint64_t)a4, v10, v11, v12, v13, v14, v15, v16);
    }

    id v17 = 0;
  }
  else
  {
    id v17 = [(CSDFaceTimeConversationProviderDelegate *)self linkForJoinCallAction:v6 inLinks:v9];
  }

  return v17;
}

- (id)deletedLinkForJoinCallAction:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finding a matching deleted link in join call action %@", (uint8_t *)&v21, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  id v9 = [v8 deletedConversationLinksWithError:a4];

  id v10 = *a4;
  uint64_t v11 = sub_100008DCC();
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AEDEC((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
    }

    int v19 = 0;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deleted links: %@", (uint8_t *)&v21, 0xCu);
    }

    int v19 = [(CSDFaceTimeConversationProviderDelegate *)self linkForJoinCallAction:v6 inLinks:v9];
  }

  return v19;
}

- (id)linkForJoinCallAction:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finding activated link in join call action %@", (uint8_t *)&v20, 0xCu);
  }

  id v8 = [(CSDFaceTimeConversationProviderDelegate *)self activatedLinkForJoinCallAction:v6 withError:a4];
  if (*a4)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003AEE5C((uint64_t)a4, v9, v10, v11, v12, v13, v14, v15);
    }

LABEL_7:
    id v16 = 0;
    goto LABEL_12;
  }
  uint64_t v17 = sub_100008DCC();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v18)
    {
      int v20 = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      long long v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Could not find activated link for join call action %@, link: %@", (uint8_t *)&v20, 0x16u);
    }

    goto LABEL_7;
  }
  if (v18)
  {
    int v20 = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    long long v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found activated link for join call action %@, link: %@", (uint8_t *)&v20, 0x16u);
  }

  id v16 = v8;
LABEL_12:

  return v16;
}

- (id)validateLinkForJoinCallActionIfNecessary:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Validating link for join call action %@", buf, 0xCu);
  }

  id v8 = [v6 pseudonym];
  if (![v8 length])
  {

    goto LABEL_12;
  }
  id v9 = [v6 publicKey];
  id v10 = [v9 length];

  if (!v10)
  {
LABEL_12:
    id v13 = 0;
    goto LABEL_13;
  }
  if (TULockdownModeEnabled())
  {
    uint64_t v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1003AED48();
    }

    if (a4)
    {
      uint64_t v12 = 3;
LABEL_10:
      +[NSError errorWithDomain:@"com.apple.calls.callservicesd.links" code:v12 userInfo:0];
      id v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v15 = [(CSDFaceTimeConversationProviderDelegate *)self linkForJoinCallAction:v6 withError:a4];
  id v13 = (id)v15;
  if (*a4)
  {
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1003AEECC();
    }

LABEL_20:
    id v13 = 0;
    goto LABEL_21;
  }
  if (!v15)
  {
    BOOL v18 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    int v19 = [v6 pseudonym];
    unsigned int v20 = [v18 isHandleStringLocalPseudonym:v19];

    if (v20)
    {
      id v21 = sub_100008DCC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = [v6 pseudonym];
        *(_DWORD *)buf = 138412290;
        id v37 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "LMI: This pseudonym is mine, but couldn't find the link - triggering link recovery and failing the action {pseudonym: %@}", buf, 0xCu);
      }
      long long v23 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      long long v24 = [v6 pseudonym];
      __int16 v40 = v24;
      id v25 = +[NSArray arrayWithObjects:&v40 count:1];
      [v23 recoverLinksForPseudonyms:v25];

      uint64_t v12 = 1;
      goto LABEL_10;
    }
    id v35 = 0;
    id v26 = [(CSDFaceTimeConversationProviderDelegate *)self deletedLinkForJoinCallAction:v6 withError:&v35];
    id v27 = v35;
    __int16 v28 = sub_100008DCC();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v26;
      __int16 v38 = 2112;
      id v39 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No link was found, find deleted link: %@, error: %@", buf, 0x16u);
    }

    id v29 = objc_alloc((Class)TUConversationLink);
    long long v30 = [v6 pseudonym];
    uint64_t v31 = [v6 publicKey];
    id v13 = [v29 initWithPseudonym:v30 publicKey:v31 groupUUID:0 originatorHandle:0];

    if (!v13)
    {
      uint64_t v32 = sub_100008DCC();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = [v6 pseudonym];
        __int16 v34 = [v6 publicKey];
        *(_DWORD *)buf = 138412546;
        id v37 = v33;
        __int16 v38 = 2112;
        id v39 = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "LMI: Could not assemble link for pseudonym %@ and publicKey %@", buf, 0x16u);
      }
      uint64_t v12 = 2;
      goto LABEL_10;
    }
  }
LABEL_13:
  uint64_t v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v37 = v6;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Validated link for join call action %@ link: %@", buf, 0x16u);
  }

LABEL_21:

  return v13;
}

- (void)performJoinCallAction:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 UUID];
    *(_DWORD *)buf = 138412290;
    uint64_t v235 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "performJoinCallAction UUID: %@", buf, 0xCu);
  }
  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self deviceSupport];
  if ([v8 isGreenTea])
  {
    if (([v4 isVideo] & 1) == 0)
    {

      goto LABEL_19;
    }
    id v9 = [v4 remoteMembers];
    id v10 = [v9 count];

    if ((unint64_t)v10 >= 2)
    {
LABEL_19:
      id v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v14 = "[WARN] GFT/FTA calls are not allowed on GreenTea devices";
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  else
  {
  }
  if (([v4 isValidScreenSharingRequest] & 1) != 0
    || ([(CSDAbstractFaceTimeConversationProviderDelegate *)self featureFlags],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 usesModernScreenSharingFromMessages],
        v11,
        !v12))
  {
    id v226 = 0;
    id v15 = [(CSDFaceTimeConversationProviderDelegate *)self validateLinkForJoinCallActionIfNecessary:v4 withError:&v226];
    id v16 = v226;
    if (v16)
    {
      uint64_t v17 = sub_100008DCC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1003AF024();
      }

      id v225 = 0;
      BOOL v18 = [(CSDFaceTimeConversationProviderDelegate *)self deletedLinkForJoinCallAction:v4 withError:&v225];
      id v19 = v225;
      unsigned int v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v235 = (uint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Retrieve deleted link: %@", buf, 0xCu);
      }

      [v4 fail];
      goto LABEL_126;
    }
    if (v15)
    {
      if ([v4 isScreening])
      {
        id v21 = sub_100008DCC();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot join a call with screening that is link based", buf, 2u);
        }

        [v4 fail];
        goto LABEL_126;
      }
      __int16 v28 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      id v29 = [v15 pseudonym];
      long long v30 = [v4 callUUID];
      [v28 addPseudonym:v29 forCallUUID:v30];

      if (([v4 isJoiningConversationWithLink] & 1) == 0)
      {
        uint64_t v31 = sub_100008DCC();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v235 = (uint64_t)v4;
          __int16 v236 = 2112;
          id v237 = v15;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "letMeIn: %@, link: %@", buf, 0x16u);
        }

        uint64_t v32 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        uint64_t v33 = [v15 pseudonym];
        __int16 v34 = [v32 conversationLinkForPseudonym:v33];

        if (v34 && [v34 isEquivalentToConversationLink:v15])
        {
          id v35 = sub_100008DCC();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v235 = (uint64_t)v34;
            __int16 v236 = 2112;
            id v237 = v15;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "get resolved link: %@ for link: %@", buf, 0x16u);
          }

          id v36 = v34;
          id v15 = v36;
        }
        id v37 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        __int16 v38 = [v15 pseudonym];
        uint64_t v39 = [v37 pendingConversationUUIDWithPseudonym:v38];

        v173 = (void *)v39;
        if (v39)
        {
          if (TUDisableLinks())
          {
            __int16 v40 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
            unsigned __int8 v41 = [v40 conversationsByUUID];
            v42 = [v41 objectForKeyedSubscript:v39];

            v43 = sub_100008DCC();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v235 = (uint64_t)v42;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Joining from links is disabled by server bag value, failing pending conversation %@", buf, 0xCu);
            }

            [(CSDFaceTimeConversationProviderDelegate *)self _failConversation:v42 failureReason:10 providerEndedReason:527];
            long long v44 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
            [v44 removeAllPendingConversations];
LABEL_48:

            [v4 fail];
LABEL_123:

LABEL_124:
            goto LABEL_125;
          }
          if ([v4 isLetMeIn])
          {
            v106 = sub_100008DCC();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
            {
              v107 = [v15 pseudonym];
              *(_DWORD *)buf = 138412290;
              uint64_t v235 = (uint64_t)v107;
              _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "LMI: Asking CSDConversationManager to request let me in approval for pseudonym: %@", buf, 0xCu);
            }
            v108 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
            v109 = [v15 pseudonym];
            [v108 requestLetMeInApprovalForPseudonym:v109];
          }
          v110 = sub_100008DCC();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v235 = v39;
            _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Use existing pendingConversationUUID: %@", buf, 0xCu);
          }

          v111 = [v4 callUUID];
          v112 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
          [v112 setObject:v111 forKeyedSubscript:v39];

          [v4 fulfill];
        }
        else if ([v15 canCreateConversations])
        {
          long long v85 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
          [v85 removeAllPendingConversations];

          long long v86 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
          long long v87 = [v86 conversationsByGroupUUID];
          long long v88 = [v15 groupUUID];
          v42 = [v87 objectForKeyedSubscript:v88];

          v180 = self;
          if (v42)
          {
            long long v89 = [v42 link];
            unsigned int v90 = [v89 isEquivalentToConversationLink:v15];

            if (v90)
            {
              if (([v42 isLocallyCreated] & 1) != 0
                || ([v42 initiator],
                    v91 = objc_claimAutoreleasedReturnValue(),
                    [v15 originatorHandle],
                    CFStringRef v92 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v93 = [v91 isEquivalentToHandle:v92],
                    v92,
                    v91,
                    (v93 & 1) != 0))
              {
LABEL_183:
                v160 = sub_100008DCC();
                if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v235 = (uint64_t)v42;
                  _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "canUseExistingConversation, proceedToJoinForConversation: %@", buf, 0xCu);
                }

                [(CSDAbstractFaceTimeConversationProviderDelegate *)v180 proceedToJoinForConversation:v42 action:v4];
                [v4 fulfill];
              }
              else
              {
                long long v223 = 0u;
                long long v224 = 0u;
                long long v221 = 0u;
                long long v222 = 0u;
                v177 = v15;
                v94 = [v15 invitedMemberHandles];
                id v95 = [v94 countByEnumeratingWithState:&v221 objects:v242 count:16];
                if (v95)
                {
                  id v96 = v95;
                  uint64_t v97 = *(void *)v222;
                  while (2)
                  {
                    for (i = 0; i != v96; i = (char *)i + 1)
                    {
                      if (*(void *)v222 != v97) {
                        objc_enumerationMutation(v94);
                      }
                      uint64_t v99 = *(void *)(*((void *)&v221 + 1) + 8 * i);
                      v100 = [v42 initiator];
                      LOBYTE(v99) = [v100 isEquivalentToHandle:v99];

                      if (v99)
                      {

                        id v15 = v177;
                        goto LABEL_183;
                      }
                    }
                    id v96 = [v94 countByEnumeratingWithState:&v221 objects:v242 count:16];
                    if (v96) {
                      continue;
                    }
                    break;
                  }
                }

                v101 = sub_100008DCC();
                id v15 = v177;
                if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                {
                  v102 = [v42 initiator];
                  v103 = [v102 value];
                  v104 = [v177 originatorHandle];
                  v105 = [v177 invitedMemberHandles];
                  *(_DWORD *)buf = 138413058;
                  uint64_t v235 = (uint64_t)v42;
                  __int16 v236 = 2112;
                  id v237 = v103;
                  __int16 v238 = 2112;
                  v239 = v104;
                  __int16 v240 = 2112;
                  v241 = v105;
                  _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Can't use existing conversation %@ because its initiator %@ is not us, not the link creator %@, and not an invited handle to the link %@. Falling back to LMI request/response flow.", buf, 0x2Au);
                }
                [(CSDFaceTimeConversationProviderDelegate *)v180 proceedToNewPendingConversationForLink:v177 action:v4];
              }
              goto LABEL_123;
            }
            long long v44 = sub_100008DCC();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              sub_1003AEF68(v42, (uint64_t)v15, v44);
            }
            goto LABEL_48;
          }
          v114 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
          v115 = [v15 originatorHandle];
          unsigned int v116 = [v114 isValidLocalHandle:v115];

          if (v116)
          {
            v117 = [v15 originatorHandle];
            id v118 = [v117 copy];
          }
          else
          {
            id v118 = 0;
          }
          v172 = v34;
          v175 = v4;
          v119 = +[NSMutableSet set];
          long long v217 = 0u;
          long long v218 = 0u;
          long long v219 = 0u;
          long long v220 = 0u;
          id v178 = v15;
          v120 = [v15 invitedMemberHandles];
          id v121 = [v120 countByEnumeratingWithState:&v217 objects:v233 count:16];
          if (v121)
          {
            id v122 = v121;
            uint64_t v123 = *(void *)v218;
            do
            {
              for (j = 0; j != v122; j = (char *)j + 1)
              {
                if (*(void *)v218 != v123) {
                  objc_enumerationMutation(v120);
                }
                v125 = *(void **)(*((void *)&v217 + 1) + 8 * (void)j);
                if (!v118)
                {
                  v126 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v180 conversationManager];
                  unsigned int v127 = [v126 isValidLocalHandle:v125];

                  if (v127) {
                    id v118 = [v125 copy];
                  }
                  else {
                    id v118 = 0;
                  }
                }
                id v128 = [objc_alloc((Class)TUConversationMember) initWithHandle:v125 nickname:0];
                [v119 addObject:v128];
              }
              id v122 = [v120 countByEnumeratingWithState:&v217 objects:v233 count:16];
            }
            while (v122);
          }

          if (([v15 isLocallyCreated] & 1) == 0)
          {
            id v129 = objc_alloc((Class)TUConversationMember);
            v130 = [v15 originatorHandle];
            id v131 = [v129 initWithHandle:v130 nickname:0];
            [v119 addObject:v131];
          }
          id v4 = v175;
          __int16 v34 = v172;
          if (v118)
          {
            id v170 = v118;
            v132 = [v175 otherInvitedHandles];
            +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v132 count]);
            id objb = (id)objc_claimAutoreleasedReturnValue();

            long long v215 = 0u;
            long long v216 = 0u;
            long long v213 = 0u;
            long long v214 = 0u;
            v133 = [v175 otherInvitedHandles];
            id v134 = [v133 countByEnumeratingWithState:&v213 objects:v232 count:16];
            if (v134)
            {
              id v135 = v134;
              uint64_t v136 = *(void *)v214;
              do
              {
                for (k = 0; k != v135; k = (char *)k + 1)
                {
                  if (*(void *)v214 != v136) {
                    objc_enumerationMutation(v133);
                  }
                  v138 = [*(id *)(*((void *)&v213 + 1) + 8 * (void)k) tuHandle];
                  if (v138) {
                    [objb addObject:v138];
                  }
                }
                id v135 = [v133 countByEnumeratingWithState:&v213 objects:v232 count:16];
              }
              while (v135);
            }

            long long v211 = 0u;
            long long v212 = 0u;
            long long v209 = 0u;
            long long v210 = 0u;
            v181 = [v175 remoteMembers];
            id v186 = [v181 countByEnumeratingWithState:&v209 objects:v231 count:16];
            if (v186)
            {
              uint64_t v183 = *(void *)v210;
              do
              {
                for (m = 0; m != v186; m = (char *)m + 1)
                {
                  if (*(void *)v210 != v183) {
                    objc_enumerationMutation(v181);
                  }
                  v140 = *(void **)(*((void *)&v209 + 1) + 8 * (void)m);
                  long long v205 = 0u;
                  long long v206 = 0u;
                  long long v207 = 0u;
                  long long v208 = 0u;
                  id v141 = objb;
                  id v142 = [v141 countByEnumeratingWithState:&v205 objects:v230 count:16];
                  if (v142)
                  {
                    id v143 = v142;
                    uint64_t v144 = *(void *)v206;
                    do
                    {
                      for (n = 0; n != v143; n = (char *)n + 1)
                      {
                        if (*(void *)v206 != v144) {
                          objc_enumerationMutation(v141);
                        }
                        uint64_t v146 = *(void *)(*((void *)&v205 + 1) + 8 * (void)n);
                        v147 = [v140 tuHandle];
                        LODWORD(v146) = [v147 isEquivalentToHandle:v146];

                        if (v146)
                        {
                          id v148 = objc_alloc((Class)TUConversationMember);
                          v149 = [v140 tuHandle];
                          id v150 = [v148 initWithHandle:v149 nickname:0];

                          [v150 setIsOtherInvitedHandle:1];
                          [v119 addObject:v150];
                        }
                      }
                      id v143 = [v141 countByEnumeratingWithState:&v205 objects:v230 count:16];
                    }
                    while (v143);
                  }
                }
                id v186 = [v181 countByEnumeratingWithState:&v209 objects:v231 count:16];
              }
              while (v186);
            }

            id v151 = [objc_alloc((Class)TUConversationMember) initWithHandle:v170];
            v152 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v180 featureFlags];
            if ([v152 avLessSharePlayEnabled])
            {
              id v4 = v175;
              uint64_t v153 = (uint64_t)[v175 avMode];

              v154 = v178;
              if (v153) {
                id v155 = 0;
              }
              else {
                id v155 = [v175 presentationMode];
              }
            }
            else
            {
              id v4 = v175;
              if ([v175 isVideo]) {
                uint64_t v153 = 2;
              }
              else {
                uint64_t v153 = 1;
              }

              id v155 = 0;
              v154 = v178;
            }
            v161 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v180 conversationManager];
            v162 = [v154 groupUUID];
            v163 = +[TUConversationProvider faceTimeProvider];
            v164 = [v161 findOrCreateConversationWithGroupUUID:v162 messagesGroupUUID:0 remoteMembers:v119 otherInvitedHandles:objb localMember:v151 remotePushTokens:0 link:v154 activity:0 avMode:v153 presentationMode:v155 conversationProvider:v163 screenSharingRequest:0];

            if (v164)
            {
              [(CSDAbstractFaceTimeConversationProviderDelegate *)v180 proceedToJoinForConversation:v164 action:v4];
              v165 = [v164 link];
              unsigned __int8 v166 = [v154 isEqual:v165];

              id v15 = v154;
              id v118 = v170;
              if (v166)
              {
                int v159 = 0;
              }
              else
              {
                v167 = sub_100008DCC();
                if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
                {
                  v168 = [v164 link];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v235 = (uint64_t)v168;
                  __int16 v236 = 2112;
                  id v237 = v154;
                  _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_DEFAULT, "Use %@ instead of link: %@ for renewal", buf, 0x16u);
                }
                uint64_t v169 = [v164 link];

                int v159 = 0;
                id v15 = (id)v169;
              }
            }
            else
            {
              [v4 fail];
              int v159 = 1;
              id v15 = v154;
              id v118 = v170;
            }

            __int16 v34 = v172;
          }
          else
          {
            v156 = sub_100008DCC();
            if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
            {
              v157 = [v15 originatorHandle];
              v158 = [v15 invitedMemberHandles];
              *(_DWORD *)buf = 138412546;
              uint64_t v235 = (uint64_t)v157;
              __int16 v236 = 2112;
              id v237 = v158;
              _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "Even though we have the information needed to create a conversation with this link, none of our currently active handles are the link creator %@ or one of the invited handles %@. Falling back to LMI request/response flow.", buf, 0x16u);
            }
            [(CSDFaceTimeConversationProviderDelegate *)v180 proceedToNewPendingConversationForLink:v15 action:v175];
            int v159 = 1;
          }

          self = v180;
          if (v159) {
            goto LABEL_124;
          }
        }
        else
        {
          [(CSDFaceTimeConversationProviderDelegate *)self proceedToNewPendingConversationForLink:v15 action:v4];
        }
        v113 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        v203[0] = _NSConcreteStackBlock;
        v203[1] = 3221225472;
        v203[2] = sub_10018A078;
        v203[3] = &unk_1005090B0;
        id v15 = v15;
        id v204 = v15;
        [v113 renewLinkIfNeeded:v15 completionHandler:v203];

        v42 = v204;
        goto LABEL_123;
      }
    }
    else
    {
      __int16 v22 = [v4 pseudonym];
      if ([v22 length])
      {
        long long v23 = [v4 publicKey];
        id v24 = [v23 length];

        if (v24)
        {
          id v25 = sub_100008DCC();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_1003AEF34();
          }

          id v202 = 0;
          id v26 = [(CSDFaceTimeConversationProviderDelegate *)self deletedLinkForJoinCallAction:v4 withError:&v202];
          id v15 = v202;
          id v27 = sub_100008DCC();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v235 = (uint64_t)v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Deleted link: %@", buf, 0xCu);
          }

          [v4 fail];
          goto LABEL_126;
        }
      }
      else
      {
      }
    }
    v179 = self;
    id v176 = v15;
    long long v45 = [v4 remoteMembers];
    v182 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v45 count]);

    long long v46 = [v4 otherInvitedHandles];
    long long v47 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v46 count]);

    v48 = +[NSMutableSet set];
    long long v198 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    v174 = v4;
    id obj = [v4 remoteMembers];
    id v49 = [obj countByEnumeratingWithState:&v198 objects:v229 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v199;
      do
      {
        id v52 = 0;
        id v184 = v50;
        do
        {
          if (*(void *)v199 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v53 = [*(id *)(*((void *)&v198 + 1) + 8 * (void)v52) tuHandle];
          if ([v48 containsObject:v53])
          {
            CFStringRef v54 = sub_100008DCC();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v235 = (uint64_t)v53;
              __int16 v236 = 2112;
              id v237 = v48;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "[WARN] Skipping member with handle %@ because it already exists in seen handles: %@", buf, 0x16u);
            }
          }
          else
          {
            __int16 v55 = v48;
            CFStringRef v54 = [objc_alloc((Class)TUConversationMember) initWithHandle:v53 nickname:0];
            long long v194 = 0u;
            long long v195 = 0u;
            long long v196 = 0u;
            long long v197 = 0u;
            v56 = v47;
            id v57 = v47;
            id v58 = [v57 countByEnumeratingWithState:&v194 objects:v228 count:16];
            if (v58)
            {
              id v59 = v58;
              uint64_t v60 = *(void *)v195;
              do
              {
                for (ii = 0; ii != v59; ii = (char *)ii + 1)
                {
                  if (*(void *)v195 != v60) {
                    objc_enumerationMutation(v57);
                  }
                  if ([*(id *)(*((void *)&v194 + 1) + 8 * (void)ii) isEquivalentToHandle:v53])-[NSObject setIsOtherInvitedHandle:](v54, "setIsOtherInvitedHandle:", 1); {
                }
                  }
                id v59 = [v57 countByEnumeratingWithState:&v194 objects:v228 count:16];
              }
              while (v59);
            }

            [v182 addObject:v54];
            v48 = v55;
            [v55 addObject:v53];
            long long v47 = v56;
            id v50 = v184;
          }

          id v52 = (char *)v52 + 1;
        }
        while (v52 != v50);
        id v50 = [obj countByEnumeratingWithState:&v198 objects:v229 count:16];
      }
      while (v50);
    }

    long long v192 = 0u;
    long long v193 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    id v4 = v174;
    __int16 v62 = [v174 otherInvitedHandles];
    id v63 = [v62 countByEnumeratingWithState:&v190 objects:v227 count:16];
    if (v63)
    {
      id v64 = v63;
      uint64_t v65 = *(void *)v191;
      do
      {
        for (jj = 0; jj != v64; jj = (char *)jj + 1)
        {
          if (*(void *)v191 != v65) {
            objc_enumerationMutation(v62);
          }
          id v67 = [*(id *)(*((void *)&v190 + 1) + 8 * (void)jj) tuHandle];
          [v47 addObject:v67];
        }
        id v64 = [v62 countByEnumeratingWithState:&v190 objects:v227 count:16];
      }
      while (v64);
    }

    id v68 = [v174 joinCallActivity];
    id v69 = [v68 tuActivity];

    if (!v182)
    {
      [v174 fail];
      id v15 = v176;
LABEL_97:

LABEL_125:
      id v16 = 0;
LABEL_126:

      goto LABEL_127;
    }
    uint64_t v70 = [v174 callerID];
    if (v70)
    {
      id v71 = objc_alloc((Class)TUConversationMember);
      v72 = [v174 callerID];
      v73 = [v72 tuHandle];
      id obja = [v71 initWithHandle:v73 nickname:0];
    }
    else
    {
      id obja = 0;
    }

    v74 = sub_100008DCC();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = [v174 callerID];
      *(_DWORD *)buf = 138412546;
      uint64_t v235 = (uint64_t)obja;
      __int16 v236 = 2112;
      id v237 = v75;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "localMember: %@, action.callerID: %@", buf, 0x16u);
    }
    v76 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v179 featureFlags];
    v171 = v48;
    if ([v76 avLessSharePlayEnabled])
    {
      uint64_t v77 = (uint64_t)[v174 avMode];

      if (!v77)
      {
        id v185 = [v174 presentationMode];
LABEL_92:
        id v78 = [(CSDAbstractFaceTimeConversationProviderDelegate *)v179 conversationManager];
        long long v79 = [v174 groupUUID];
        long long v80 = [v174 messagesGroupUUID];
        long long v81 = [v174 remotePushTokens];
        long long v82 = [v174 conversationProviderIdentifier];
        long long v83 = +[TUConversationProvider providerForIdentifier:v82];
        long long v84 = [v78 findOrCreateConversationWithGroupUUID:v79 messagesGroupUUID:v80 remoteMembers:v182 otherInvitedHandles:v47 localMember:obja remotePushTokens:v81 link:v176 activity:v69 avMode:v77 presentationMode:v185 conversationProvider:v83 screenSharingRequest:0];

        if (v84)
        {
          [(CSDAbstractFaceTimeConversationProviderDelegate *)v179 proceedToJoinForConversation:v84 action:v174];
          id v4 = v174;
          v48 = v171;
          if (![v174 avMode]) {
            [(CSDFaceTimeConversationProviderDelegate *)v179 declineRemoteDevicesForConversation:v84 reason:4];
          }
        }
        else
        {
          [v174 fail];
          id v4 = v174;
          v48 = v171;
        }

        id v15 = v176;
        goto LABEL_97;
      }
    }
    else
    {
      if ([v174 isVideo]) {
        uint64_t v77 = 2;
      }
      else {
        uint64_t v77 = 1;
      }
    }
    id v185 = 0;
    goto LABEL_92;
  }
  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v14 = "[WARN] Failing join call action because it is not a valid request to screen share";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
  }
LABEL_22:

  [v4 fail];
LABEL_127:
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
}

- (void)proceedToNewPendingConversationForLink:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  [v8 removeAllPendingConversations];

  id v9 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  id v10 = [v9 activeApprovedConversationWithLink:v6];

  if (v10)
  {
    [(CSDAbstractFaceTimeConversationProviderDelegate *)self proceedToJoinForConversation:v10 action:v7];
    [v7 fulfill];
  }
  else
  {
    uint64_t v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v12 = objc_alloc((Class)TUConversationMember);
    id v13 = [v7 callerID];
    uint64_t v14 = [v13 tuHandle];
    id v15 = [v12 initWithHandle:v14 nickname:0];
    id v16 = objc_msgSend(v11, "initiatePendingConversationForLink:localMember:isVideoEnabled:", v6, v15, objc_msgSend(v7, "isVideoEnabled"));

    if (v16)
    {
      [v7 fulfill];
      id v17 = [objc_alloc((Class)CXCallUpdate) initWithTUConversation:v16];
      BOOL v18 = [v17 localSenderIdentityUUID];

      if (!v18)
      {
        id v19 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        unsigned int v20 = [v16 initiator];
        id v21 = [v19 senderIdentityUUIDForCallerIDHandle:v20];
        [v17 setLocalSenderIdentityUUID:v21];
      }
      __int16 v22 = sub_100008DCC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = [v7 callUUID];
        int v29 = 138412546;
        long long v30 = v23;
        __int16 v31 = 2112;
        id v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "LMI: Reporting LMI call with UUID: %@ update: %@", (uint8_t *)&v29, 0x16u);
      }
      id v24 = [v7 callUUID];
      id v25 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self callUUIDsByConversationUUID];
      id v26 = [v16 UUID];
      [v25 setObject:v24 forKeyedSubscript:v26];

      id v27 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self provider];
      __int16 v28 = [v7 callUUID];
      [v27 reportCallWithUUID:v28 updated:v17];
    }
    else
    {
      [v7 fail];
    }
  }
}

- (id)_findPendingConversationWithCallUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v7 = [v6 pseudonymsByCallUUID];
    id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v9 = [v8 conversationsByUUID];
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = v7;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "pseudonymsByCallUUID: %@, conversationsByUUID: %@", buf, 0x16u);
  }
  id v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  uint64_t v11 = [v10 pseudonymsByCallUUID];
  id v12 = [v11 objectForKeyedSubscript:v4];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  uint64_t v14 = [v13 conversationsByUUID];
  id v15 = [v14 allValues];

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
        id v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v19 isPendingConversation])
        {
          uint64_t v20 = [v19 link];
          if (v20)
          {
            id v21 = (void *)v20;
            __int16 v22 = [v19 link];
            long long v23 = [v22 pseudonym];
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

- (void)leaveConversationForCallUUID:(id)a3 endedReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v7);

  v10.receiver = self;
  v10.super_class = (Class)CSDFaceTimeConversationProviderDelegate;
  [(CSDAbstractFaceTimeConversationProviderDelegate *)&v10 leaveConversationForCallUUID:v6 endedReason:a4];
  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v8 objectForKeyedSubscript:v6];

  [(CSDFaceTimeConversationProviderDelegate *)self setWaitingForRemoteJoin:0 forConversationUUID:v9];
}

- (void)leaveConversation:(id)a3 withCallUUID:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CSDFaceTimeConversationProviderDelegate;
  [(CSDAbstractFaceTimeConversationProviderDelegate *)&v29 leaveConversation:v8 withCallUUID:v9 reason:a5];
  uint64_t v10 = [v8 link];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    unsigned int v12 = [v8 isPendingConversation];

    if (v12)
    {
      id v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v8 link];
        id v15 = [v14 pseudonym];
        *(_DWORD *)buf = 138412546;
        __int16 v31 = v15;
        __int16 v32 = 2112;
        id v33 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing pending conversation with pseudonym %@ and callUUID %@", buf, 0x16u);
      }
      id v16 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      uint64_t v17 = [v8 link];
      BOOL v18 = [v17 pseudonym];
      id v19 = [v16 removePendingConversationWithPseudonym:v18];

      uint64_t v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      id v21 = [v8 link];
      __int16 v22 = [v21 pseudonym];
      [v20 removePseudonym:v22 forCallUUID:v9];

      long long v23 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      unsigned int v24 = [v8 UUID];
      [v23 notifyDelegatesOfRemovedConversationWithUUID:v24];
    }
  }
  id v25 = [v8 UUID];
  [(CSDFaceTimeConversationProviderDelegate *)self setCallUUID:0 forConversationUUID:v25];

  id v26 = [v8 UUID];
  [(CSDAbstractFaceTimeConversationProviderDelegate *)self setWaitingToJoin:0 forConversationUUID:v26];

  if ([v8 state])
  {
    if ([v8 state] == (id)2)
    {
      long long v27 = [v8 remoteMembers];
      id v28 = [v27 count];

      if (a5 == 4 && v28 == (id)1) {
        [(CSDFaceTimeConversationProviderDelegate *)self declineRemoteMembersForConversation:v8 reason:4];
      }
    }
  }
  else
  {
    [(CSDFaceTimeConversationProviderDelegate *)self declineRemoteDevicesForConversation:v8 reason:a5];
  }
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v18, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if (([v13 isVideo] & 1) == 0
    && [v13 state] == (id)3
    && ([v13 remoteMembers],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        id v15 = [v14 count],
        v14,
        v15 == (id)1))
  {
    id v16 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    objc_msgSend(v16, "setAudioPaused:forConversationWithUUID:", objc_msgSend(v5, "isOnHold"), v10);

    if (([v5 isComplete] & 1) == 0) {
      [v5 fulfill];
    }
  }
  else
  {
    uint64_t v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1003AF0F4();
    }

    [v5 fail];
  }
}

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 138412290;
    id v40 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v39, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if ([v5 isSendingVideo]
    && (+[TUConversationManager allowsVideo] & 1) == 0)
  {
    uint64_t v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot enable video because conversations do not allow video on this device", (uint8_t *)&v39, 2u);
    }
    goto LABEL_21;
  }
  if (![v5 isSendingVideo]
    || ![v13 isOneToOneModeEnabled]
    || ([v13 isVideo] & 1) != 0
    || ![v13 avMode])
  {
    if ([v5 isSendingVideo])
    {
      id v15 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      unsigned int v16 = [v15 isConversationWithUUIDRedirectingAudio:v10];

      if (v16)
      {
        uint64_t v14 = sub_100008DCC();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1003AF15C();
        }
        goto LABEL_21;
      }
    }
    if (v13)
    {
      unsigned __int8 v17 = [v13 isOneToOneModeEnabled];
      unsigned int v18 = [v5 isSendingVideo];
      unsigned int v19 = v18;
      if (v17)
      {
        uint64_t v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        id v21 = [v5 isSendingVideo];
        if (v19)
        {
          [v20 setVideoEnabled:v21 forConversationWithUUID:v10];

          uint64_t v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
          uint64_t v22 = [v5 isSendingVideo] ^ 1;
        }
        else
        {
          uint64_t v22 = v21 ^ 1;
        }
        id v33 = v20;
      }
      else
      {
        if (v18 && ([v13 isVideo] & 1) == 0)
        {
          id v28 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
          objc_msgSend(v28, "setVideo:forConversationWithUUID:", objc_msgSend(v5, "isSendingVideo"), v10);
        }
        objc_super v29 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        objc_msgSend(v29, "setVideoEnabled:forConversationWithUUID:", objc_msgSend(v5, "isSendingVideo"), v10);

        long long v30 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        unsigned int v31 = [v30 presentationStateForConversationWithUUID:v10];

        if (v31 == 2 || ![v5 isSendingVideo]) {
          goto LABEL_40;
        }
        __int16 v32 = sub_100008DCC();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          int v39 = 67109120;
          LODWORD(v40) = v31;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Group conversation has presentation state %d so requesting to unpause video", (uint8_t *)&v39, 8u);
        }

        id v33 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        uint64_t v20 = v33;
        uint64_t v22 = 0;
      }
      [v33 setVideoPaused:v22 forConversationWithUUID:v10];
    }
    else
    {
      long long v23 = [v5 callUUID];
      unsigned int v24 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self isManagingPendingConversationForCallWithUUID:v23];

      if (!v24)
      {
        __int16 v34 = sub_100008DCC();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = [v5 callUUID];
          id v36 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
          id v37 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
          __int16 v38 = [v37 conversationsByUUID];
          int v39 = 138412802;
          id v40 = v35;
          __int16 v41 = 2112;
          v42 = v36;
          __int16 v43 = 2112;
          long long v44 = v38;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for sendingVideo call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v39, 0x20u);
        }
        goto LABEL_22;
      }
      uint64_t v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      id v25 = [v5 isSendingVideo];
      id v26 = [v5 callUUID];
      long long v27 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self pendingConversationUUIDForCallWithUUID:v26];
      [v20 setVideoEnabled:v25 forPendingConversationWithUUID:v27];
    }
LABEL_40:
    [v5 fulfill];
    goto LABEL_41;
  }
  uint64_t v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1003AF190();
  }
LABEL_21:

LABEL_22:
  [v5 fail];
LABEL_41:
}

- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 138412290;
    id v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v34, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if (!v13)
  {
    long long v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [v5 callUUID];
      objc_super v29 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
      long long v30 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      unsigned int v31 = [v30 conversationsByUUID];
      int v34 = 138412802;
      id v35 = v28;
      __int16 v36 = 2112;
      id v37 = v29;
      __int16 v38 = 2112;
      int v39 = v31;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for screen share call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v34, 0x20u);
    }
    goto LABEL_24;
  }
  if ([v5 isSharingScreen])
  {
    uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    unsigned __int8 v15 = [v14 allActiveConversationParticipantsSupportSharePlay];

    if (v15)
    {
      unsigned int v16 = [(CSDFaceTimeConversationProviderDelegate *)self allowsScreenSharingBlock];
      char v17 = v16[2]();

      if (v17)
      {
        unsigned int v18 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        unsigned int v19 = [v18 isConversationWithUUIDRedirectingAudio:v10];

        if (v19)
        {
          uint64_t v20 = sub_100008DCC();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_1003AF1F8();
          }

          [v5 fail];
        }
        id v21 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
        unsigned __int8 v22 = [v21 isScreenSharingAvailable];

        if (v22) {
          goto LABEL_12;
        }
        id v33 = sub_100008DCC();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_1003AF1C4();
        }
      }
      else
      {
        id v33 = sub_100008DCC();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_1003AF260();
        }
      }
    }
    else
    {
      __int16 v32 = sub_100008DCC();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1003AF294();
      }

      id v33 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      [v33 displaySharePlayUnableToStartAlert];
    }

LABEL_24:
    [v5 fail];
    goto LABEL_25;
  }
LABEL_12:
  long long v23 = objc_opt_class();
  unsigned int v24 = [v5 attributes];
  id v25 = [v23 callScreenShareAttributesForAction:v24];

  id v26 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  objc_msgSend(v26, "setScreenEnabled:screenShareAttributes:forConversationWithUUID:", objc_msgSend(v5, "isSharingScreen"), v25, v10);

  [v5 fulfill];
LABEL_25:
}

- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v21, 0xCu);
  }

  id v7 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v8 = [v5 callUUID];
  id v9 = [v7 objectForKeyedSubscript:v8];

  uint64_t v10 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  uint64_t v11 = [v10 conversationsByUUID];
  unsigned int v12 = [v11 objectForKeyedSubscript:v9];

  if (!v12)
  {
    unsigned __int8 v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [v5 callUUID];
      char v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
      unsigned int v18 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      unsigned int v19 = [v18 conversationsByUUID];
      int v21 = 138412802;
      id v22 = v16;
      __int16 v23 = 2112;
      unsigned int v24 = v17;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for enableVideo call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v21, 0x20u);
    }
    goto LABEL_13;
  }
  if ([v5 isVideoEnabled] && objc_msgSend(v12, "state") != (id)3)
  {
    uint64_t v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1003AF2C8();
    }

LABEL_13:
    [v5 fail];
    goto LABEL_14;
  }
  id v13 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  objc_msgSend(v13, "setVideo:forConversationWithUUID:", objc_msgSend(v5, "isVideoEnabled"), v9);

  uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  [v14 sendVideoUpgradeMessageforConversationWithUUID:v9];

  [v5 fulfill];
LABEL_14:
}

- (void)provider:(id)a3 performSetScreenShareAttributesCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v15, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = objc_opt_class();
  unsigned int v12 = [v5 attributes];
  id v13 = [v11 callScreenShareAttributesForAction:v12];

  uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  [v14 setScreenShareAttributes:v13 forConversationWithUUID:v10];

  [v5 fulfill];
}

- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v25, 2u);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  id v13 = [v12 objectForKeyedSubscript:v10];

  uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  int v15 = [v14 conversationsByUUID];
  id v16 = [v15 objectForKeyedSubscript:v10];

  if (v16)
  {
    id v17 = [v5 videoPresentationState];
    if (([v13 isOneToOneModeEnabled] & 1) == 0)
    {
      unsigned int v18 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      [v18 setVideoPaused:v17 == (id)2 forConversationWithUUID:v10];
    }
    unsigned int v19 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    objc_msgSend(v19, "setPresentationState:forConversationWithUUID:", -[CSDFaceTimeConversationProviderDelegate TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:](self, "TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:", objc_msgSend(v5, "videoPresentationState")), v10);

    [v5 fulfill];
  }
  else
  {
    uint64_t v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v5 callUUID];
      id v22 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
      __int16 v23 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      unsigned int v24 = [v23 conversationsByUUID];
      int v25 = 138412802;
      id v26 = v21;
      __int16 v27 = 2112;
      id v28 = v22;
      __int16 v29 = 2112;
      long long v30 = v24;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for set video presentation state action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v25, 0x20u);
    }
    [v5 fail];
  }
}

- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)&v23, 2u);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if (v13)
  {
    uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    [v5 videoPresentationSize];
    double v16 = v15;
    [v5 videoPresentationSize];
    objc_msgSend(v14, "setPresentationRect:forConversationWithUUID:", v10, 0.0, 0.0, v16, v17);

    [v5 fulfill];
  }
  else
  {
    unsigned int v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = [v5 callUUID];
      uint64_t v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
      int v21 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      id v22 = [v21 conversationsByUUID];
      int v23 = 138412802;
      unsigned int v24 = v19;
      __int16 v25 = 2112;
      id v26 = v20;
      __int16 v27 = 2112;
      id v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for set video presentation state action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v23, 0x20u);
    }
    [v5 fail];
  }
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v20, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if (v13)
  {
    uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    objc_msgSend(v14, "setRelaying:forConversationWithUUID:", objc_msgSend(v5, "isRelaying"), v10);

    [v5 fulfill];
  }
  else
  {
    double v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      double v16 = [v5 callUUID];
      double v17 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
      unsigned int v18 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      unsigned int v19 = [v18 conversationsByUUID];
      int v20 = 138412802;
      id v21 = v16;
      __int16 v22 = 2112;
      int v23 = v17;
      __int16 v24 = 2112;
      __int16 v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for relaying call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v20, 0x20u);
    }
    [v5 fail];
  }
}

- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v22, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if (v13)
  {
    uint64_t v14 = [v13 link];

    if (!v14)
    {
      id v21 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      objc_msgSend(v21, "setScreening:forConversationWithUUID:", objc_msgSend(v5, "isScreening"), v10);

      [v5 fulfill];
      goto LABEL_13;
    }
    double v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Not starting screening on a link based conversation", (uint8_t *)&v22, 2u);
    }
  }
  else
  {
    double v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = [v5 callUUID];
      unsigned int v18 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
      unsigned int v19 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      int v20 = [v19 conversationsByUUID];
      int v22 = 138412802;
      id v23 = v17;
      __int16 v24 = 2112;
      __int16 v25 = v18;
      __int16 v26 = 2112;
      __int16 v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation for screening call action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v22, 0x20u);
    }
  }
  [v5 fail];
LABEL_13:
}

- (void)provider:(id)a3 performSetAllowUplinkAudioInjectionAction:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v22, 0xCu);
  }

  id v8 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
  id v9 = [v5 callUUID];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v11 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
  unsigned int v12 = [v11 conversationsByUUID];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if (v13 && [v13 state] == (id)3 && objc_msgSend(v13, "avMode"))
  {
    uint64_t v14 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
    id v15 = [v5 willInject];
    double v16 = [v13 UUID];
    [v14 setAudioInjectionAllowed:v15 forConversationWithUUID:v16];

    [v5 fulfill];
  }
  else
  {
    double v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = [v5 callUUID];
      unsigned int v19 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationUUIDsByCallUUID];
      int v20 = [(CSDAbstractFaceTimeConversationProviderDelegate *)self conversationManager];
      id v21 = [v20 conversationsByUUID];
      int v22 = 138412802;
      id v23 = v18;
      __int16 v24 = 2112;
      __int16 v25 = v19;
      __int16 v26 = 2112;
      __int16 v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Did not allow audio injection action call UUID %@. self.conversationUUIDsByCallUUID: %@ self.conversationManager.conversationsByUUID: %@", (uint8_t *)&v22, 0x20u);
    }
    [v5 fail];
  }
}

- (NSMutableSet)conversationUUIDsUpgradedFromAVLess
{
  conversationUUIDsUpgradedFromAVLess = self->_conversationUUIDsUpgradedFromAVLess;
  if (!conversationUUIDsUpgradedFromAVLess)
  {
    id v4 = +[NSMutableSet set];
    id v5 = self->_conversationUUIDsUpgradedFromAVLess;
    self->_conversationUUIDsUpgradedFromAVLess = v4;

    conversationUUIDsUpgradedFromAVLess = self->_conversationUUIDsUpgradedFromAVLess;
  }

  return conversationUUIDsUpgradedFromAVLess;
}

- (BOOL)shouldHandleProvider:(id)a3
{
  if (a3) {
    return [a3 isDefaultProvider];
  }
  else {
    return 0;
  }
}

- (BOOL)shouldHandleProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[CSDConversationProviderManager sharedInstance];
  id v6 = [v5 tuConversationProviderForIdentifier:v4];

  LOBYTE(self) = [(CSDFaceTimeConversationProviderDelegate *)self shouldHandleProvider:v6];
  return (char)self;
}

- (NSMutableDictionary)recentlyDeletedCallUUIDsByConversationUUID
{
  return self->_recentlyDeletedCallUUIDsByConversationUUID;
}

- (id)allowsScreenSharingBlock
{
  return self->_allowsScreenSharingBlock;
}

- (void)setAllowsScreenSharingBlock:(id)a3
{
}

- (CSDBlockUtilitiesProtocol)blockUtilities
{
  return self->_blockUtilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockUtilities, 0);
  objc_storeStrong(&self->_allowsScreenSharingBlock, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedCallUUIDsByConversationUUID, 0);
  objc_storeStrong((id *)&self->_conversationUUIDsUpgradedFromAVLess, 0);

  objc_storeStrong((id *)&self->_conversationUUIDsWaitingForRemoteJoin, 0);
}

@end