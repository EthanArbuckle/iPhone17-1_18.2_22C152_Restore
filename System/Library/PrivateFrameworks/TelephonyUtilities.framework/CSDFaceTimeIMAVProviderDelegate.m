@interface CSDFaceTimeIMAVProviderDelegate
- (BOOL)hasCallStartedConnectingWithUUID:(id)a3;
- (BOOL)isManagingCallWithUUID:(id)a3;
- (CSDFaceTimeIMAVProviderDelegate)initWithQueue:(id)a3;
- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate;
- (CXProvider)provider;
- (NSMutableOrderedSet)cachedChats;
- (OS_dispatch_queue)queue;
- (id)chatWithUUID:(id)a3;
- (id)failureContextForChat:(id)a3;
- (id)imAccountForActionBlock;
- (id)providerDidBegin;
- (id)upgradeSessionUUIDForCallWithUUID:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (unsigned)IMAVChatRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3;
- (void)_endChatWithUUID:(id)a3 withEndedReason:(unsigned int)a4;
- (void)_requestPendingInvites;
- (void)_setUpListeners;
- (void)_updateProviderForConnectedChat:(id)a3;
- (void)_updateProviderForConnectingChat:(id)a3;
- (void)_updateProviderForEndedChat:(id)a3;
- (void)daemonConnected:(id)a3;
- (void)dealloc;
- (void)endCallWithUUID:(id)a3;
- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3;
- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3;
- (void)endCallWithUUIDAsLocalHangup:(id)a3;
- (void)handleChatCallInfoChangedNotification:(id)a3;
- (void)handleChatConferenceIDChangedNotification:(id)a3;
- (void)handleChatConferenceMetadataUpdated:(id)a3;
- (void)handleChatFirstRemoteFrameArrived:(id)a3;
- (void)handleChatInFrequencyChangedNotification:(id)a3;
- (void)handleChatInvitationSent:(id)a3;
- (void)handleChatMayRequireBreakBeforeMakeChanged:(id)a3;
- (void)handleChatOutFrequencyChangedNotification:(id)a3;
- (void)handleChatStateChanged:(id)a3;
- (void)inviteIMAVPeersWithAction:(id)a3 tokensToExclude:(id)a4 joinCallActionToFulfill:(id)a5;
- (void)invitedToIMAVChat:(id)a3;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
- (void)registerChat:(id)a3;
- (void)setCachedChats:(id)a3;
- (void)setFaceTimeDemuxerDelegate:(id)a3;
- (void)setImAccountForActionBlock:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderDidBegin:(id)a3;
@end

@implementation CSDFaceTimeIMAVProviderDelegate

- (CSDFaceTimeIMAVProviderDelegate)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDFaceTimeIMAVProviderDelegate;
  v6 = [(CSDFaceTimeIMAVProviderDelegate *)&v11 init];
  if (v6)
  {
    uint64_t v7 = +[NSMutableOrderedSet orderedSet];
    cachedChats = v6->_cachedChats;
    v6->_cachedChats = (NSMutableOrderedSet *)v7;

    objc_storeStrong((id *)&v6->_queue, a3);
    v6->_accessorLock._os_unfair_lock_opaque = 0;
    id imAccountForActionBlock = v6->_imAccountForActionBlock;
    v6->_id imAccountForActionBlock = &stru_100505360;
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDFaceTimeIMAVProviderDelegate;
  [(CSDFaceTimeIMAVProviderDelegate *)&v4 dealloc];
}

- (void)_setUpListeners
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if ((+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls](TUCallCapabilities, "supportsDisplayingFaceTimeAudioCalls") & 1) != 0|| +[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls])
  {
    if (qword_10058C210
      || ((v3 = (void **)CUTWeakLinkSymbol()) == 0 ? (objc_super v4 = 0) : (objc_super v4 = *v3),
          objc_storeStrong((id *)&qword_10058C210, v4),
          qword_10058C210))
    {
      id v5 = +[NSNotificationCenter defaultCenter];
      [v5 addObserver:self selector:"daemonConnected:" name:qword_10058C210 object:0];
    }
    else
    {
      id v5 = sub_100008DCC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMDaemonDidConnectNotification";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    if (qword_10058C218
      || ((v6 = (void **)CUTWeakLinkSymbol()) == 0 ? (uint64_t v7 = 0) : (uint64_t v7 = *v6),
          objc_storeStrong((id *)&qword_10058C218, v7),
          qword_10058C218))
    {
      v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:self selector:"handleChatStateChanged:" name:qword_10058C218 object:0];
    }
    else
    {
      v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMAVChatStateChangedNotification";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    if (qword_10058C220
      || ((v9 = (void **)CUTWeakLinkSymbol()) == 0 ? (v10 = 0) : (v10 = *v9),
          objc_storeStrong((id *)&qword_10058C220, v10),
          qword_10058C220))
    {
      objc_super v11 = +[NSNotificationCenter defaultCenter];
      [v11 addObserver:self selector:"handleChatFirstRemoteFrameArrived:" name:qword_10058C220 object:0];
    }
    else
    {
      objc_super v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMAVChatParticipantReceivedFirstFrameNotification";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    if (qword_10058C228
      || ((v12 = (void **)CUTWeakLinkSymbol()) == 0 ? (v13 = 0) : (v13 = *v12),
          objc_storeStrong((id *)&qword_10058C228, v13),
          qword_10058C228))
    {
      v14 = +[NSNotificationCenter defaultCenter];
      [v14 addObserver:self selector:"handleChatInvitationSent:" name:qword_10058C228 object:0];
    }
    else
    {
      v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMAVChatParticipantInvitationDeliveredNotification";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    if (qword_10058C230
      || ((v15 = (void **)CUTWeakLinkSymbol()) == 0 ? (v16 = 0) : (v16 = *v15),
          objc_storeStrong((id *)&qword_10058C230, v16),
          qword_10058C230))
    {
      v17 = +[NSNotificationCenter defaultCenter];
      [v17 addObserver:self selector:"handleChatCallInfoChangedNotification:" name:qword_10058C230 object:0];
    }
    else
    {
      v17 = sub_100008DCC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMAVChatParticipantCallInfoChangedNotification";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    if (qword_10058C238
      || ((v18 = (void **)CUTWeakLinkSymbol()) == 0 ? (v19 = 0) : (v19 = *v18),
          objc_storeStrong((id *)&qword_10058C238, v19),
          qword_10058C238))
    {
      v20 = +[NSNotificationCenter defaultCenter];
      [v20 addObserver:self selector:"handleChatConferenceIDChangedNotification:" name:qword_10058C238 object:0];
    }
    else
    {
      v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMAVChatConferenceIDChangedNotification";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    if (qword_10058C240
      || ((v21 = (void **)CUTWeakLinkSymbol()) == 0 ? (v22 = 0) : (v22 = *v21),
          objc_storeStrong((id *)&qword_10058C240, v22),
          qword_10058C240))
    {
      v23 = +[NSNotificationCenter defaultCenter];
      [v23 addObserver:self selector:"handleChatConferenceMetadataUpdated:" name:qword_10058C240 object:0];
    }
    else
    {
      v23 = sub_100008DCC();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMAVChatConferenceMetadataUpdatedNotification";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    if (qword_10058C248
      || ((v24 = (void **)CUTWeakLinkSymbol()) == 0 ? (v25 = 0) : (v25 = *v24),
          objc_storeStrong((id *)&qword_10058C248, v25),
          qword_10058C248))
    {
      v26 = +[NSNotificationCenter defaultCenter];
      [v26 addObserver:self selector:"handleChatMayRequireBreakBeforeMakeChanged:" name:qword_10058C248 object:0];
    }
    else
    {
      v26 = sub_100008DCC();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMAVChatMayRequireBreakBeforeMakeChangedNotification";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    if (qword_10058C250
      || ((v27 = (void **)CUTWeakLinkSymbol()) == 0 ? (v28 = 0) : (v28 = *v27),
          objc_storeStrong((id *)&qword_10058C250, v28),
          qword_10058C250))
    {
      v29 = +[NSNotificationCenter defaultCenter];
      [v29 addObserver:self selector:"handleChatInFrequencyChangedNotification:" name:qword_10058C250 object:0];
    }
    else
    {
      v29 = sub_100008DCC();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMAVChatParticipantInFrequencyChangedNotification";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    if (qword_10058C258
      || ((v30 = (void **)CUTWeakLinkSymbol()) == 0 ? (v31 = 0) : (v31 = *v30),
          objc_storeStrong((id *)&qword_10058C258, v31),
          qword_10058C258))
    {
      v32 = +[NSNotificationCenter defaultCenter];
      [v32 addObserver:self selector:"handleChatOutFrequencyChangedNotification:" name:qword_10058C258 object:0];
    }
    else
    {
      v32 = sub_100008DCC();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        CFStringRef v40 = @"IMAVChatParticipantOutFrequencyChangedNotification";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] Could not weak link notification string '%@'. Not observing notifications for it.", (uint8_t *)&v39, 0xCu);
      }
    }

    v33 = (void *)CUTWeakLinkClass();
    v34 = [v33 sharedInstance];
    [v34 addDelegate:self queue:&_dispatch_main_q];

    v35 = [v33 sharedInstance];
    [v35 setIMAVCapabilities:25 toCaps:25];

    v36 = [v33 sharedInstance];
    [v36 setupIMAVController];

    v37 = [v33 sharedInstance];
    [v37 setBlockIncomingInvitationsDuringCall:0];

    v38 = [v33 sharedInstance];
    [v38 setBlockMultipleIncomingInvitations:1];

    [(CSDFaceTimeIMAVProviderDelegate *)self _requestPendingInvites];
  }
}

- (void)_requestPendingInvites
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v2 = (void *)CUTWeakLinkClass();
  if (+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls])
  {
    v3 = [v2 sharedInstance];
    [v3 requestPendingACInvitations];
  }
  if (+[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls])
  {
    id v4 = [v2 sharedInstance];
    [v4 requestPendingVCInvitations];
  }
}

- (id)chatWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(CSDFaceTimeIMAVProviderDelegate *)self cachedChats];
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v19;
LABEL_3:
    v12 = 0;
    v13 = v10;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v7);
      }
      id v10 = *(id *)(*((void *)&v18 + 1) + 8 * (void)v12);

      v14 = [v10 GUID];
      v15 = [v4 UUIDString];
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if (v16) {
        break;
      }
      v12 = (char *)v12 + 1;
      v13 = v10;
      if (v9 == v12)
      {
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v10 = 0;
  }

  os_unfair_lock_unlock(p_accessorLock);

  return v10;
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v4];

  return v6 != 0;
}

- (id)upgradeSessionUUIDForCallWithUUID:(id)a3
{
  return 0;
}

- (void)registerChat:(id)a3
{
  id v6 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if ([v6 state] && objc_msgSend(v6, "state") != 5)
  {
    id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self cachedChats];
    [v5 addObject:v6];
  }
  else
  {
    id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self cachedChats];
    [v5 removeObject:v6];
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3
{
  id v5 = a3;
  id v4 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDFaceTimeIMAVProviderDelegate *)self _endChatWithUUID:v5 withEndedReason:27];
}

- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3
{
  id v5 = a3;
  id v4 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDFaceTimeIMAVProviderDelegate *)self _endChatWithUUID:v5 withEndedReason:29];
}

- (void)endCallWithUUIDAsLocalHangup:(id)a3
{
  id v5 = a3;
  id v4 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDFaceTimeIMAVProviderDelegate *)self _endChatWithUUID:v5 withEndedReason:1];
}

- (void)endCallWithUUID:(id)a3
{
  id v5 = a3;
  id v4 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDFaceTimeIMAVProviderDelegate *)self _endChatWithUUID:v5 withEndedReason:8];
}

- (void)_endChatWithUUID:(id)a3 withEndedReason:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v7 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v6];
  id v9 = v8;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100026C24;
    v11[3] = &unk_100505080;
    v12 = v8;
    unsigned int v13 = a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    id v10 = v12;
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2048;
      uint64_t v17 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asked to end chat with UUID: %@, reason: (%ld) but could not find it", buf, 0x16u);
    }
  }
}

- (BOOL)hasCallStartedConnectingWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v4];

  LOBYTE(v4) = [v6 state] > 2;
  return (char)v4;
}

- (void)inviteIMAVPeersWithAction:(id)a3 tokensToExclude:(id)a4 joinCallActionToFulfill:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026E44;
  v11[3] = &unk_1005053D0;
  id v12 = a3;
  unsigned int v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (unsigned)IMAVChatRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (void)_updateProviderForConnectingChat:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isCaller])
  {
    id v6 = [(CSDFaceTimeIMAVProviderDelegate *)self faceTimeDemuxerDelegate];
    id v7 = v4;
    id v8 = objc_alloc((Class)NSUUID);
    id v9 = [v7 GUID];

    id v10 = [v8 initWithUUIDString:v9];
    uint64_t v11 = +[NSDate date];
    [v6 providerDelegate:self callWithUUID:v10 startedConnectingAtDate:v11];
  }
  id v12 = [objc_alloc((Class)CXCallUpdate) initWithIMAVChat:v4];
  [v12 setFaceTimeTransportType:1];
  unsigned int v13 = [(CSDFaceTimeIMAVProviderDelegate *)self provider];
  id v17 = v4;
  id v14 = objc_alloc((Class)NSUUID);
  id v15 = [v17 GUID];

  id v16 = [v14 initWithUUIDString:v15];
  [v13 reportCallWithUUID:v16 updated:v12];
}

- (void)_updateProviderForConnectedChat:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 isCaller])
  {
    id v6 = [(CSDFaceTimeIMAVProviderDelegate *)self provider];
    id v7 = v4;
    id v8 = objc_alloc((Class)NSUUID);
    id v9 = [v7 GUID];

    id v10 = [v8 initWithUUIDString:v9];
    uint64_t v11 = [v7 dateConnected];
    [v6 reportOutgoingCallWithUUID:v10 connectedAtDate:v11];
  }
  else
  {
    id v12 = v4;
    id v13 = objc_alloc((Class)NSUUID);
    id v14 = [v12 GUID];

    id v15 = [v13 initWithUUIDString:v14];
    id v16 = [(CSDFaceTimeIMAVProviderDelegate *)self provider];
    id v17 = [v16 pendingCallActionsOfClass:objc_opt_class() withCallUUID:v15];

    if ([v17 count])
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v18 = v17;
      id v19 = [v18 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v19)
      {
        id v20 = v19;
        v27 = v17;
        id v28 = v4;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v24 = sub_100008DCC();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v34 = v23;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Legacy chat with matching UUID connected; attempting to fulfill pending answer call action %@",
                buf,
                0xCu);
            }

            if (([v23 isComplete] & 1) == 0)
            {
              v25 = [v12 dateConnected];
              if (v25)
              {
                v26 = [v12 dateConnected];
                [v23 fulfillWithDateConnected:v26];
              }
              else
              {
                v26 = sub_100008DCC();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v34 = v23;
                  _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Legacy chat did not provide a connection date; Could not fulfill answer call action %@",
                    buf,
                    0xCu);
                }
              }
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v20);
        id v4 = v28;
        id v17 = v27;
      }
    }
    else
    {
      long long v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] No pending answer call actions found with UUID: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_updateProviderForEndedChat:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = v4;
  id v7 = objc_alloc((Class)NSUUID);
  id v8 = [v6 GUID];

  id v9 = [v7 initWithUUIDString:v8];
  id v10 = [(CSDFaceTimeIMAVProviderDelegate *)self provider];
  uint64_t v11 = [v10 pendingCallActionsOfClass:objc_opt_class() withCallUUID:v9];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v18 = sub_100008DCC();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v6;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failing answer call action for chat because it ended before connecting: %@", buf, 0xCu);
        }

        if (([v17 isComplete] & 1) == 0) {
          [v17 fail];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)daemonConnected:(id)a3
{
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027C3C;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleChatStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  +[CSDSignposts trace:2];
  id v6 = [v4 object];
  [(CSDFaceTimeIMAVProviderDelegate *)self registerChat:v6];
  id v7 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100027DA4;
  v9[3] = &unk_100504F10;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (id)failureContextForChat:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 endedReason] == 12)
  {
    id v6 = objc_alloc_init((Class)CXCallFailureContext);
    [v6 setFailureReason:2];
    id v7 = +[FTDeviceSupport sharedInstance];
    id v8 = +[FTNetworkSupport sharedInstance];
    unsigned int v9 = [v7 supportsWLAN];
    if (([v8 allowAnyNetwork] & 1) != 0
      || ([v4 isVideo] & 1) == 0
      && ([v7 supportsNonWiFiCalling] & 1) != 0
      || [v4 isVideo] && objc_msgSend(v7, "supportsNonWiFiFaceTime"))
    {
      id v10 = TUBundle();
      uint64_t v11 = [v10 localizedStringForKey:@"CALL_FAILED_NO_NETWORK_CONNECTION_TITLE" value:&stru_100517F40 table:@"TelephonyUtilities"];
      [v6 setTitle:v11];

      unsigned int v12 = [v4 isVideo];
      id v13 = TUBundle();
      id v14 = v13;
      CFStringRef v15 = @"CALL_FAILED_NO_LOCAL_NETWORK_WLAN_MESSAGE";
      if (v12) {
        CFStringRef v15 = @"ALERT_VIDEO_FAILED_NO_LOCAL_NETWORK_WLAN_MESSAGE";
      }
      CFStringRef v16 = @"ALERT_VIDEO_FAILED_NO_LOCAL_NETWORK_WIFI_MESSAGE";
      if (!v12) {
        CFStringRef v16 = @"CALL_FAILED_NO_LOCAL_NETWORK_WIFI_MESSAGE";
      }
      if (v9) {
        CFStringRef v17 = v15;
      }
      else {
        CFStringRef v17 = v16;
      }
      long long v18 = [v13 localizedStringForKey:v17 value:&stru_100517F40 table:@"TelephonyUtilities"];
      [v6 setMessage:v18];

      if ([v7 supportsCellularData])
      {
        long long v19 = +[IMMobileNetworkManager sharedInstance];
        if (([v19 isAirplaneModeEnabled] & 1) == 0)
        {
          unsigned __int8 v69 = [v19 isSIMRemoved];

          [v6 setHasWiFiSettingsRemediation:1];
          if ((v69 & 1) == 0) {
            [v6 setHasCellularSettingsRemediation:1];
          }
          goto LABEL_35;
        }
      }
    }
    else
    {
      unsigned int v30 = [v4 isVideo];
      long long v31 = TUBundle();
      long long v32 = v31;
      CFStringRef v33 = @"CALL_FAILED_NO_LOCAL_WLAN_MESSAGE";
      if (v30) {
        CFStringRef v33 = @"ALERT_VIDEO_FAILED_NO_LOCAL_WLAN_MESSAGE";
      }
      CFStringRef v34 = @"ALERT_VIDEO_FAILED_NO_LOCAL_WIFI_MESSAGE";
      if (!v30) {
        CFStringRef v34 = @"CALL_FAILED_NO_LOCAL_WIFI_MESSAGE";
      }
      if (v9) {
        CFStringRef v35 = v33;
      }
      else {
        CFStringRef v35 = v34;
      }
      v36 = [v31 localizedStringForKey:v35 value:&stru_100517F40 table:@"TelephonyUtilities"];
      [v6 setMessage:v36];
    }
    [v6 setHasWiFiSettingsRemediation:1];
LABEL_35:

    goto LABEL_80;
  }
  if ([v4 endedReason] == 28)
  {
    id v6 = objc_alloc_init((Class)CXCallFailureContext);
    [v6 setFailureReason:1];
    if ([v4 endedError] == 5087)
    {
      unsigned int v20 = [v4 isVideo];
      long long v21 = TUBundle();
      long long v22 = v21;
      if (v20) {
        CFStringRef v23 = @"ALERT_VIDEO_FAILED_TITLE";
      }
      else {
        CFStringRef v23 = @"CALL_FAILED_TITLE";
      }
      id v24 = [v21 localizedStringForKey:v23 value:&stru_100517F40 table:@"TelephonyUtilities"];
      [v6 setTitle:v24];

      unsigned int v25 = [v4 isVideo];
      v26 = TUBundle();
      v27 = v26;
      if (v25) {
        CFStringRef v28 = @"ALERT_VIDEO_FAILED_BAD_NONCE_TIMESTAMP";
      }
      else {
        CFStringRef v28 = @"CALL_FAILED_BAD_NONCE_TIMESTAMP";
      }
      long long v29 = [v26 localizedStringForKey:v28 value:&stru_100517F40 table:@"TelephonyUtilities"];
      [v6 setMessage:v29];

      [v6 setHasDateAndTimeSettingsRemediation:1];
      goto LABEL_80;
    }
    unsigned int v46 = [v4 endedError];
    unsigned int v47 = [v4 isVideo];
    v48 = TUBundle();
    v49 = v48;
    if (v47) {
      CFStringRef v50 = @"ALERT_VIDEO_FAILED_TITLE";
    }
    else {
      CFStringRef v50 = @"CALL_FAILED_TITLE";
    }
    v51 = [v48 localizedStringForKey:v50 value:&stru_100517F40 table:@"TelephonyUtilities"];
    [v6 setTitle:v51];

    unsigned int v52 = [v4 isVideo];
    v53 = TUBundle();
    id v7 = v53;
    if (v46 == 7001)
    {
      if (v52) {
        CFStringRef v54 = @"ALERT_VIDEO_FAILED_UPDATE_LOCATION_MESSAGE";
      }
      else {
        CFStringRef v54 = @"CALL_FAILED_UPDATE_LOCATION_MESSAGE";
      }
      v55 = [v53 localizedStringForKey:v54 value:&stru_100517F40 table:@"TelephonyUtilities"];
      [v6 setMessage:v55];

      [v6 setHasLocationSettingsRemediation:1];
      goto LABEL_80;
    }
    if (v52) {
      CFStringRef v70 = @"ALERT_VIDEO_FAILED_REGION_INFO_INSUFFICIENT";
    }
    else {
      CFStringRef v70 = @"CALL_FAILED_REGION_INFO_INSUFFICIENT";
    }
    id v8 = [v53 localizedStringForKey:v70 value:&stru_100517F40 table:@"TelephonyUtilities"];
    [v6 setMessage:v8];
    goto LABEL_35;
  }
  if ([v4 endedReason] == 26)
  {
    id v6 = objc_alloc_init((Class)CXCallFailureContext);
    v37 = TUBundle();
    v38 = [v37 localizedStringForKey:@"ALERT_VIDEO_FAILED_TITLE" value:&stru_100517F40 table:@"TelephonyUtilities"];
    [v6 setTitle:v38];

    [v6 setFailureReason:2];
    int v39 = [v4 otherIMHandle];
    CFStringRef v40 = [v39 ID];

    LODWORD(v39) = [v40 destinationIdIsPhoneNumber];
    v41 = TUBundle();
    v42 = v41;
    if (v39) {
      CFStringRef v43 = @"ALERT_VIDEO_FAILED_REMOTE_INCOMPATIBLE_MESSAGE_%@_NUMBER";
    }
    else {
      CFStringRef v43 = @"ALERT_VIDEO_FAILED_REMOTE_INCOMPATIBLE_MESSAGE_%@_NAME";
    }
    v44 = [v41 localizedStringForKey:v43 value:&stru_100517F40 table:@"TelephonyUtilities"];
    v45 = +[NSString stringWithFormat:v44, @"<display_name>"];
    [v6 setMessage:v45];

    goto LABEL_79;
  }
  if ([v4 endedReason] == 13
    || [v4 endedReason] == 16 && objc_msgSend(v4, "endedError") == -1)
  {
    id v6 = objc_alloc_init((Class)CXCallFailureContext);
    unsigned int v56 = [v4 isVideo];
    v57 = TUBundle();
    v58 = v57;
    if (v56) {
      CFStringRef v59 = @"ALERT_VIDEO_NOT_AVAILABLE_TITLE";
    }
    else {
      CFStringRef v59 = @"CALL_NOT_AVAILABLE_TITLE";
    }
    v60 = [v57 localizedStringForKey:v59 value:&stru_100517F40 table:@"TelephonyUtilities"];
    [v6 setTitle:v60];

    [v6 setFailureReason:2];
    v61 = [v4 otherIMHandle];
    CFStringRef v40 = [v61 ID];

    unsigned int v62 = [v40 destinationIdIsPhoneNumber];
    unsigned int v63 = [v4 isVideo];
    v64 = TUBundle();
    v65 = v64;
    CFStringRef v66 = @"CALL_FAILED_%@_NOT_AVAILABLE_MESSAGE_NAME";
    if (v63) {
      CFStringRef v66 = @"ALERT_VIDEO_FAILED_NOT_AVAILABLE_MESSAGE_%@_NAME";
    }
    CFStringRef v67 = @"ALERT_VIDEO_FAILED_NOT_AVAILABLE_MESSAGE_%@_NUMBER";
    if (!v63) {
      CFStringRef v67 = @"CALL_FAILED_%@_NOT_AVAILABLE_MESSAGE_NUMBER";
    }
    if (v62) {
      CFStringRef v68 = v67;
    }
    else {
      CFStringRef v68 = v66;
    }
    goto LABEL_78;
  }
  if ([v4 endedReason] == 24
    || [v4 endedReason] == 23
    || [v4 endedReason] == 16 && objc_msgSend(v4, "endedError") == 6400)
  {
    id v6 = objc_alloc_init((Class)CXCallFailureContext);
    unsigned int v71 = [v4 isVideo];
    v72 = TUBundle();
    v73 = v72;
    if (v71) {
      CFStringRef v74 = @"ALERT_VIDEO_FAILED_TITLE";
    }
    else {
      CFStringRef v74 = @"CALL_FAILED_TITLE";
    }
    v75 = [v72 localizedStringForKey:v74 value:&stru_100517F40 table:@"TelephonyUtilities"];
    [v6 setTitle:v75];

    [v6 setFailureReason:1];
    v76 = [v4 otherIMHandle];
    CFStringRef v40 = [v76 ID];

    unsigned int v77 = [v40 destinationIdIsPhoneNumber];
    unsigned int v78 = [v4 isVideo];
    v64 = TUBundle();
    v65 = v64;
    CFStringRef v79 = @"CALL_FAILED_%@_NOT_AVAILABLE_MESSAGE_NUMBER";
    if (v78) {
      CFStringRef v79 = @"ALERT_VIDEO_FAILED_NOT_AVAILABLE_MESSAGE_%@_NUMBER";
    }
    CFStringRef v80 = @"ALERT_VIDEO_FAILED_NOT_AVAILABLE_MESSAGE_%@_NAME";
    if (!v78) {
      CFStringRef v80 = @"CALL_FAILED_%@_NOT_AVAILABLE_MESSAGE_NAME";
    }
    if (v77) {
      CFStringRef v68 = v79;
    }
    else {
      CFStringRef v68 = v80;
    }
LABEL_78:
    v81 = [v64 localizedStringForKey:v68 value:&stru_100517F40 table:@"TelephonyUtilities"];
    v82 = +[NSString stringWithFormat:v81, @"<display_name>"];
    [v6 setMessage:v82];

LABEL_79:
    goto LABEL_80;
  }
  if ([v4 endedReason] == 6 && objc_msgSend(v4, "endedError") == 32005)
  {
    id v84 = objc_alloc_init((Class)CXCallFailureContext);
    id v6 = v84;
    uint64_t v85 = 4;
LABEL_92:
    [v84 setFailureReason:v85];
    goto LABEL_80;
  }
  if ([v4 endedReason] == 30)
  {
    id v84 = objc_alloc_init((Class)CXCallFailureContext);
    id v6 = v84;
    uint64_t v85 = 5;
    goto LABEL_92;
  }
  id v6 = 0;
LABEL_80:
  objc_msgSend(v6, "setProviderErrorCode:", objc_msgSend(v4, "endedReason"));

  return v6;
}

- (void)handleChatFirstRemoteFrameArrived:(id)a3
{
  id v4 = [a3 object];
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v6 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028D68;
  v8[3] = &unk_100504F10;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)handleChatInvitationSent:(id)a3
{
  id v4 = [a3 object];
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v6 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028F14;
  v8[3] = &unk_100504F10;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)handleChatCallInfoChangedNotification:(id)a3
{
  id v4 = [a3 object];
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v6 = [v4 avChat];
  id v7 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029124;
  block[3] = &unk_100504FE0;
  id v11 = v6;
  id v12 = v4;
  id v13 = self;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(v7, block);
}

- (void)handleChatConferenceIDChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if ([v5 state] >= 2)
  {
    id v7 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100029368;
    v8[3] = &unk_100504F10;
    id v9 = v5;
    id v10 = self;
    dispatch_async(v7, v8);
  }
}

- (void)handleChatConferenceMetadataUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v7 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002958C;
  v9[3] = &unk_100504F10;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)handleChatMayRequireBreakBeforeMakeChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v6 = [v4 object];
  id v7 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000297A0;
  v9[3] = &unk_100504F10;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)handleChatInFrequencyChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002992C;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleChatOutFrequencyChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029ABC;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)invitedToIMAVChat:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v6 = [(CSDFaceTimeIMAVProviderDelegate *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029CC8;
  v8[3] = &unk_100504F10;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)providerDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  [(CSDFaceTimeIMAVProviderDelegate *)self setProvider:v4];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A100;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)providerDidReset:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(CSDFaceTimeIMAVProviderDelegate *)self cachedChats];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v11);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002A3EC;
        block[3] = &unk_100504EC0;
        void block[4] = v12;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v7];

  if ([v8 state] == 4)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003A6D84((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }

    if (([v5 isComplete] & 1) == 0) {
      [v5 fail];
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002A5A4;
    block[3] = &unk_100504FE0;
    void block[4] = self;
    id v17 = v5;
    id v18 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v7];

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling endChat on chat %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A854;
  block[3] = &unk_100504EC0;
  id v10 = v8;
  id v12 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (([v5 isComplete] & 1) == 0) {
    [v5 fulfill];
  }
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v7];

  if ([v8 state] == 4)
  {
    long long v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_10002AA1C;
    long long v19 = &unk_100505030;
    char v21 = [v5 isOnHold] ^ 1;
    id v20 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v16);
    if ((objc_msgSend(v5, "isComplete", v16, v17, v18, v19) & 1) == 0) {
      [v5 fulfill];
    }
  }
  else
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003A6DF0((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }

    if (([v5 isComplete] & 1) == 0) {
      [v5 fail];
    }
  }
}

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v7];

  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10002AC50;
  uint64_t v14 = &unk_100504F10;
  id v9 = v5;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v11);
  if ((objc_msgSend(v9, "isComplete", v11, v12, v13, v14) & 1) == 0) {
    [v9 fulfill];
  }
}

- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4
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

- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4
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

- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4
{
  id v5 = a4;
  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v7];

  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10002AFF8;
  uint64_t v14 = &unk_100504F10;
  id v9 = v5;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v11);
  if ((objc_msgSend(v9, "isComplete", v11, v12, v13, v14) & 1) == 0) {
    [v9 fulfill];
  }
}

- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4
{
  id v5 = a4;
  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B250;
  block[3] = &unk_100504FE0;
  id v9 = v5;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = self;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (([v9 isComplete] & 1) == 0) {
    [v9 fulfill];
  }
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v5 = a4;
  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v7];

  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10002B4A8;
  uint64_t v14 = &unk_100504F10;
  id v9 = v5;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v11);
  if ((objc_msgSend(v9, "isComplete", v11, v12, v13, v14) & 1) == 0) {
    [v9 fulfill];
  }
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v5 = a4;
  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDFaceTimeIMAVProviderDelegate *)self chatWithUUID:v7];

  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10002B6E8;
  uint64_t v14 = &unk_100504F10;
  id v9 = v5;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v11);
  if ((objc_msgSend(v9, "isComplete", v11, v12, v13, v14) & 1) == 0) {
    [v9 fulfill];
  }
}

- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTimeDemuxerDelegate);

  return (CSDFaceTimeProviderDelegateManagerDelegate *)WeakRetained;
}

- (void)setFaceTimeDemuxerDelegate:(id)a3
{
}

- (id)providerDidBegin
{
  return self->_providerDidBegin;
}

- (void)setProviderDidBegin:(id)a3
{
}

- (id)imAccountForActionBlock
{
  return self->_imAccountForActionBlock;
}

- (void)setImAccountForActionBlock:(id)a3
{
}

- (CXProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSMutableOrderedSet)cachedChats
{
  return self->_cachedChats;
}

- (void)setCachedChats:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedChats, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong(&self->_imAccountForActionBlock, 0);
  objc_storeStrong(&self->_providerDidBegin, 0);

  objc_destroyWeak((id *)&self->_faceTimeDemuxerDelegate);
}

@end