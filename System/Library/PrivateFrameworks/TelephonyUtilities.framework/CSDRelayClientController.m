@interface CSDRelayClientController
- (CSDAssistantServicesObserver)assistantServicesObserver;
- (CSDRelayClientController)initWithQueue:(id)a3 assistantServicesObserver:(id)a4;
- (OS_dispatch_queue)queue;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (void)handleCallAnsweredElsewhereMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handleCallConnectedMessageFromHost:(id)a3;
- (void)handleCallDialedMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handleCallDisconnectedMessageFromHost:(id)a3;
- (void)handleCallStartedConnectingMessageFromHost:(id)a3;
- (void)handleConversationProminenceMessageFromHost:(id)a3;
- (void)handleDeviceUnavailableMessageFromHost:(id)a3;
- (void)handleHardPauseDigitsAvailabilityMessageFromHost:(id)a3;
- (void)handleIncomingCallMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handleInvitationSentMessageFromHost:(id)a3;
- (void)handleNeedsManualInCallSoundsChangeMessageFromHost:(id)a3;
- (void)handleOngoingConversationMessageFromHost:(id)a3;
- (void)handlePullRelayingCallsMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handlePushHostedCallsMessageFromHost:(id)a3 completion:(id)a4;
- (void)handleReceivedDTMFUpdateMessageFromHost:(id)a3;
- (void)handleResetStateMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)handleResetWantsHoldMusicFromHost:(id)a3;
- (void)handleUpdateCallContextAvailableMessageFromHost:(id)a3;
- (void)handleUpdateCallDisplayContextMessageFromHost:(id)a3;
- (void)handleUpdateCallModelMessageFromHost:(id)a3;
- (void)handleUpdateConversationsMessageFromHost:(id)a3;
- (void)handleUpdateFailureExpectedMessageFromHost:(id)a3;
- (void)handleUpdateRemoteCallStateMessageFromHost:(id)a3;
- (void)handleUpdateRemoteUplinkMutedMessageFromHost:(id)a3;
- (void)handleUpdateRoutesMessageFromHost:(id)a3;
- (void)handleUpdateSupportsDTMFUpdatesMessageFromHost:(id)a3;
- (void)handleUpdateSupportsEmergencyFallbackMessageFromHost:(id)a3;
- (void)handleUpdateSupportsTTYWithVoiceMessageFromHost:(id)a3;
- (void)pullRemotelyHostedCallsForMessage:(id)a3 completion:(id)a4;
@end

@implementation CSDRelayClientController

- (CSDRelayClientController)initWithQueue:(id)a3 assistantServicesObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSDRelayClientController;
  v9 = [(CSDRelayClientController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_assistantServicesObserver, a4);
  }

  return v10;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRelayClientController *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CSDRelayController *)self callController];
  id v7 = [v6 callContainer];
  id v8 = [v7 callWithUniqueProxyIdentifier:v4];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[CSDCrashReporter simulateCrashReportWithFormat:@"Call is not of type CSDRelayCall, this should not be happening.  Please file a bug to [FaceTime | (New Bugs)]"];
    id v9 = 0;
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (void)handleIncomingCallMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 uniqueProxyIdentifier];
  id v8 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v7];

  if (!v8)
  {
    v11 = [[CSDRelayCall alloc] initWithRelayMessage:v6 outgoing:0];
    objc_super v12 = [(CSDRelayController *)self callStateController];
    [v12 setCallDelegatesIfNeeded:v11];

    v13 = [(CSDRelayClientController *)self assistantServicesObserver];
    v14 = [v13 announceCallsProviderIdentifier];
    [(CSDRelayCall *)v11 setAnnounceProviderIdentifier:v14];

    [v6 hostCallCreationTime];
    -[CSDRelayCall setHostCreationTime:](v11, "setHostCreationTime:");
    [v6 messageSendTime];
    -[CSDRelayCall setHostMessageSendTime:](v11, "setHostMessageSendTime:");
    v15 = +[NSDate date];
    [v15 timeIntervalSince1970];
    -[CSDRelayCall setClientMessageReceiveTime:](v11, "setClientMessageReceiveTime:");

    if (v4)
    {
      -[CSDCall setEndpointOnCurrentDevice:](v11, "setEndpointOnCurrentDevice:", [v6 cannotBeAnswered] ^ 1);
      -[CSDRelayCall setCannotRelayAudioOrVideo:](v11, "setCannotRelayAudioOrVideo:", [v6 cannotRelayAudioOrVideoOnPairedDevice]);
    }
    v16 = [(CSDRelayController *)self callStateController];
    [v16 propertiesChangedForCall:v11];

    v17 = [(CSDRelayCall *)v11 displayContext];
    v18 = [v6 displayContext];
    v19 = [v17 displayContextByMergingWithDisplayContext:v18];
    [(CSDRelayCall *)v11 setDisplayContext:v19];

    v20 = [(CSDRelayCall *)v11 imageURL];

    if (!v20) {
      goto LABEL_16;
    }
    v21 = [v6 image];
    if (v21)
    {
      v22 = [(CSDRelayCall *)v11 imageURL];
      unsigned __int8 v23 = [v21 writeToURL:v22 atomically:1];

      if (v23)
      {
LABEL_15:

LABEL_16:
        dispatch_time_t v26 = dispatch_time(0, 90000000000);
        v27 = [(CSDRelayClientController *)self queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10005020C;
        block[3] = &unk_1005050D0;
        block[4] = self;
        v29 = v11;
        BOOL v30 = v4;
        id v9 = v11;
        dispatch_after(v26, v27, block);

        goto LABEL_17;
      }
      v24 = sub_100008DCC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Failed to persist business image";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
      }
    }
    else
    {
      v24 = sub_100008DCC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "Got an imageURL but no imageData to persist";
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v6 typeString];
    *(_DWORD *)buf = 138412546;
    v32 = v10;
    __int16 v33 = 2112;
    v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring %@ message because we already have a call with this uniqueProxyIdentifier: %@", buf, 0x16u);
  }
LABEL_17:
}

- (void)handleConversationProminenceMessageFromHost:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "handleConversationProminenceMessageFromHost: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)handleUpdateConversationsMessageFromHost:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "handleUpdateConversationsMessageFromHost: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)handleOngoingConversationMessageFromHost:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "handleOngoingConversationMessageFromHost: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)handleCallDialedMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 uniqueProxyIdentifier];
  id v8 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v7];

  id v9 = sub_100008DCC();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v4)
    {
      if (v10)
      {
        objc_super v12 = [v6 typeString];
        int v16 = 138412290;
        v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating new call for %@ message", (uint8_t *)&v16, 0xCu);
      }
      id v9 = [[CSDRelayCall alloc] initWithRelayMessage:v6 outgoing:1];
      v13 = [(CSDRelayController *)self callStateController];
      [v13 setCallDelegatesIfNeeded:v9];

      [v9 setEndpointOnCurrentDevice:0];
      v14 = [(CSDRelayController *)self callStateController];
      [v14 propertiesChangedForCall:v9];
    }
    else
    {
      if (!v10)
      {
LABEL_12:

        goto LABEL_13;
      }
      v14 = [v6 typeString];
      v15 = [v6 uniqueProxyIdentifier];
      int v16 = 138412546;
      v17 = v14;
      __int16 v18 = 2112;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring %@ message because no call exists for %@ and the message is not from the paired device", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_12;
  }
  if (v10)
  {
    v11 = [v6 typeString];
    int v16 = 138412546;
    v17 = v11;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "We already have a call for this %@ message: %@. Updating it with new values", (uint8_t *)&v16, 0x16u);
  }
  [v8 updateWithRelayMessage:v6];
LABEL_13:
}

- (void)handleCallAnsweredElsewhereMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 uniqueProxyIdentifier];

  if (v7)
  {
    id v8 = [v6 uniqueProxyIdentifier];
    id v9 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v8];

    if (v9)
    {
      v31 = v9;
      BOOL v10 = +[NSArray arrayWithObjects:&v31 count:1];
    }
    else
    {
      v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v6 uniqueProxyIdentifier];
        v15 = [(CSDRelayController *)self allCalls];
        *(_DWORD *)buf = 138412546;
        v28 = v14;
        __int16 v29 = 2112;
        BOOL v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", buf, 0x16u);
      }
      BOOL v10 = 0;
    }
  }
  else
  {
    v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Call answered elsewhere message had no uniqueProxyIdentifier set. Using current calls", buf, 2u);
    }

    id v9 = [(CSDRelayController *)self callController];
    objc_super v12 = [v9 callContainer];
    BOOL v10 = [v12 callsHostedElsewhere];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v20);
        if (a4) {
          [v21 setEndpointOnCurrentDevice:0];
        }
        else {
          objc_msgSend(v21, "setLocallyDisconnectedWithReasonIfNone:", 1, (void)v22);
        }
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }
}

- (void)handleCallDisconnectedMessageFromHost:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 uniqueProxyIdentifier];
  int v5 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v4];

  if (v5)
  {
    objc_msgSend(v5, "setLocallyDisconnectedWithReasonIfNone:stopConference:", objc_msgSend(v8, "disconnectedReason"), 1);
  }
  else
  {
    id v6 = +[CSDRelayConferenceInterface sharedInstance];
    id v7 = [v8 uniqueProxyIdentifier];
    [v6 stopConferenceForIdentifier:v7];
  }
}

- (void)handleCallConnectedMessageFromHost:(id)a3
{
  id v4 = a3;
  int v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    [v6 setLocallyConnected];
    id v7 = [v4 callModel];
    [v6 setModel:v7];
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handlePullRelayingCallsMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 otherUniqueProxyIdentifiers];
  id v7 = +[NSSet setWithArray:v6];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [(CSDRelayController *)self callController];
  id v9 = [v8 callContainer];
  int v10 = [v9 callsHostedElsewhere];

  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v15 isHostedOnCurrentDevice] & 1) == 0)
        {
          if (!v4
            || ([v15 uniqueProxyIdentifier],
                id v16 = objc_claimAutoreleasedReturnValue(),
                unsigned int v17 = [v7 containsObject:v16],
                v16,
                v17))
          {
            [v15 setLocallyDisconnectedWithReasonIfNone:7];
          }
          [v15 setEndpointOnCurrentDevice:0];
          id v18 = +[CSDRelayConferenceInterface sharedInstance];
          uint64_t v19 = [v15 uniqueProxyIdentifier];
          [v18 stopConferenceForIdentifier:v19];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)handleResetWantsHoldMusicFromHost:(id)a3
{
  id v4 = a3;
  int v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    [v6 setWantsHoldMusic:0];
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleUpdateCallModelMessageFromHost:(id)a3
{
  id v4 = a3;
  int v5 = [v4 uniqueProxyIdentifier];

  if (v5)
  {
    id v6 = [v4 uniqueProxyIdentifier];
    id v7 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v6];

    if (v7)
    {
      id v8 = [v4 callModel];
      [v7 setModel:v8];
    }
    else
    {
      unsigned int v17 = sub_100008DCC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v4 uniqueProxyIdentifier];
        uint64_t v19 = [(CSDRelayController *)self allCalls];
        *(_DWORD *)buf = 138412546;
        dispatch_time_t v26 = v18;
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = [(CSDRelayController *)self callController];
    int v10 = [v9 callContainer];
    id v7 = [v10 callsHostedElsewhere];

    id v11 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v7);
          }
          v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v16 = [v4 callModel];
          [v15 setModel:v16];
        }
        id v12 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
}

- (void)handleDeviceUnavailableMessageFromHost:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = [(CSDRelayController *)self callController];
  id v6 = [v5 callContainer];
  id v7 = [v6 callsHostedElsewhere];

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 isEndpointOnCurrentDevice]) {
          objc_msgSend(v12, "setLocallyDisconnectedWithReasonIfNone:", objc_msgSend(v4, "disconnectedReason"));
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)handleResetStateMessageFromHost:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v33 = a4;
  id v5 = a3;
  id v6 = +[TUCallCenter sharedInstance];
  id v7 = [v6 callsHostedElsewhere];
  id v8 = +[NSMutableSet setWithArray:v7];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v32 = v5;
  id v9 = [v5 protoCalls];
  id v10 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(CSDRelayCall **)(*((void *)&v38 + 1) + 8 * i);
        long long v15 = [(CSDRelayCall *)v14 uniqueProxyIdentifier];
        long long v16 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v15];

        if (v16)
        {
          [v8 removeObject:v16];
          unsigned __int8 v17 = [(CSDRelayCall *)v14 isEqualToCall:v16];
          id v18 = sub_100008DCC();
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v19)
            {
              *(_DWORD *)buf = 138412546;
              v44 = v16;
              __int16 v45 = 2112;
              v46 = v14;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not resetting call %@ with protoCall %@ because they are equal", buf, 0x16u);
            }
          }
          else
          {
            if (v19)
            {
              *(_DWORD *)buf = 138412546;
              v44 = v16;
              __int16 v45 = 2112;
              v46 = v14;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Resetting call %@ with protoCall %@", buf, 0x16u);
            }

            [(CSDRelayCall *)v14 updateRelayCall:v16];
          }
        }
        else
        {
          if (!v33) {
            continue;
          }
          long long v20 = sub_100008DCC();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v14;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Creating new call with protoCall %@", buf, 0xCu);
          }

          long long v21 = [CSDRelayCall alloc];
          long long v22 = [(CSDRelayCall *)v14 uniqueProxyIdentifier];
          long long v16 = [(CSDRelayCall *)v21 initWithUniqueProxyIdentifier:v22 endpointOnCurrentDevice:0];

          long long v23 = [(CSDRelayController *)self callStateController];
          [v23 setCallDelegatesIfNeeded:v16];

          [(CSDRelayCall *)v14 updateRelayCall:v16];
          long long v24 = [(CSDRelayController *)self callStateController];
          [v24 propertiesChangedForCall:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v11);
  }

  if (v33)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v8;
    id v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v25);
          }
          BOOL v30 = *(CSDRelayCall **)(*((void *)&v34 + 1) + 8 * (void)j);
          if ([(CSDRelayCall *)v30 status] != 3)
          {
            v31 = sub_100008DCC();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v30;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Existing call no longer exists and is not sending: %@", buf, 0xCu);
            }

            [(CSDRelayCall *)v30 setLocallyDisconnectedWithReasonIfNone:0];
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v27);
    }
  }
}

- (void)handleHardPauseDigitsAvailabilityMessageFromHost:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(CSDRelayController *)self callController];
  id v6 = [v5 callContainer];
  id v7 = [v6 callsHostedElsewhere];

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
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v11);
        long long v13 = [v4 hardPauseDigits];
        [v12 setHardPauseDigits:v13];

        objc_msgSend(v12, "setHardPauseDigitsState:", objc_msgSend(v4, "hardPauseDigitsState"));
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)handleUpdateSupportsDTMFUpdatesMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    objc_msgSend(v6, "setSupportsDTMFUpdates:", objc_msgSend(v4, "supportsDTMFUpdates"));
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      long long v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleReceivedDTMFUpdateMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (!v6)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v4 uniqueProxyIdentifier];
      __int16 v12 = [(CSDRelayController *)self allCalls];
      int v14 = 138412546;
      long long v15 = v11;
      __int16 v16 = 2112;
      long long v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_6;
  }
  if ([v4 hasDtmfUpdateDigits])
  {
    id v7 = objc_alloc((Class)TUCallDTMFUpdate);
    id v8 = [v4 dtmfUpdateDigits];
    id v9 = [v7 initWithDigits:v8];

    int v10 = [(CSDRelayController *)self callStateController];
    [v10 handleReceivedCallDTMFUpdate:v9 forCall:v6];

LABEL_6:
    goto LABEL_10;
  }
  long long v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1003A7964((uint64_t)v4, v13);
  }

LABEL_10:
}

- (void)handleUpdateRemoteCallStateMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handleUpdateRemoteCallStateMessageFromHost %@", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v19 = v4;
  id v6 = [v4 protoCalls];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        __int16 v12 = [v11 uniqueProxyIdentifier];
        long long v13 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v12];

        if (!v13)
        {
          long long v15 = sub_100008DCC();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            long long v17 = [v11 uniqueProxyIdentifier];
            id v18 = [(CSDRelayController *)self allCalls];
            *(_DWORD *)buf = 138412546;
            id v25 = v17;
            __int16 v26 = 2112;
            id v27 = v18;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", buf, 0x16u);
          }
          goto LABEL_14;
        }
        unsigned __int8 v14 = [v11 isEqualToCall:v13];
        long long v15 = sub_100008DCC();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            *(_DWORD *)buf = 138412546;
            id v25 = v13;
            __int16 v26 = 2112;
            id v27 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not updating call %@ with protoCall %@ because they are equal", buf, 0x16u);
          }
LABEL_14:

          goto LABEL_18;
        }
        if (v16)
        {
          *(_DWORD *)buf = 138412546;
          id v25 = v13;
          __int16 v26 = 2112;
          id v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating call %@ with protoCall %@", buf, 0x16u);
        }

        [v11 updateRelayCall:v13];
LABEL_18:
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)handleCallStartedConnectingMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    [v6 setLocallyConnecting];
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      uint64_t v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      long long v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handlePushHostedCallsMessageFromHost:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(CSDRelayController *)self callController];
  uint64_t v9 = [v8 callContainer];
  unsigned __int8 v10 = [v9 hasCurrentCalls];

  if (v10)
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [v6 typeString];
      int v13 = 138412290;
      unsigned __int8 v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Received %@ message, but we already have some calls", (uint8_t *)&v13, 0xCu);
    }
    v7[2](v7, 0);
  }
  else
  {
    [(CSDRelayClientController *)self pullRemotelyHostedCallsForMessage:v6 completion:v7];
  }
}

- (void)handleUpdateCallContextAvailableMessageFromHost:(id)a3
{
  id v11 = a3;
  id v4 = [v11 callCapabilitiesState];

  if (v4)
  {
    id v5 = +[CSDCallCapabilities sharedInstance];
    id v6 = [v11 callCapabilitiesState];
    [v5 updatePairedHostDeviceCallCapabilitiesState:v6];
  }
  id v7 = [v11 providers];

  if (v7)
  {
    id v8 = [(CSDRelayController *)self callStateController];
    uint64_t v9 = [v8 callProviderManager];
    unsigned __int8 v10 = [v11 tuProviders];
    [v9 registerPairedHostDeviceProviders:v10];
  }
}

- (void)handleNeedsManualInCallSoundsChangeMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    objc_msgSend(v6, "setNeedsManualInCallSounds:", objc_msgSend(v4, "needsManualInCallSounds"));
    objc_msgSend(v6, "setSoundRegion:", objc_msgSend(v4, "soundRegion"));
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      uint64_t v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleInvitationSentMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    [v6 setLocallyHasSentInvitation];
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      uint64_t v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleUpdateCallDisplayContextMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    id v7 = [v4 tuHandle];
    [v6 setHandle:v7];

    id v8 = [v6 displayContext];
    uint64_t v9 = [v4 displayContext];
    int v10 = [v8 displayContextByMergingWithDisplayContext:v9];
    [v6 setDisplayContext:v10];
  }
  else
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v4 uniqueProxyIdentifier];
      __int16 v12 = [(CSDRelayController *)self allCalls];
      int v13 = 138412546;
      unsigned __int8 v14 = v11;
      __int16 v15 = 2112;
      BOOL v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)handleUpdateRemoteUplinkMutedMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (!v6)
  {
    __int16 v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v4 uniqueProxyIdentifier];
      unsigned __int8 v14 = [(CSDRelayController *)self allCalls];
      int v18 = 138412546;
      id v19 = v13;
      __int16 v20 = 2112;
      long long v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_10;
  }
  id v7 = [v6 provider];
  unsigned int v8 = [v7 isTinCanProvider];

  if (!v8)
  {
    objc_msgSend(v6, "setRemoteUplinkMuted:", objc_msgSend(v4, "isRemoteUplinkMuted"));
    goto LABEL_11;
  }
  [v4 messageSendTime];
  double v10 = v9;
  [v6 remoteUplinkMutedSetTime];
  if (v10 <= v11)
  {
    __int16 v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [v4 messageSendTime];
      BOOL v16 = v15;
      [v6 remoteUplinkMutedSetTime];
      int v18 = 138412802;
      id v19 = v4;
      __int16 v20 = 2048;
      long long v21 = v16;
      __int16 v22 = 2048;
      uint64_t v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring %@ because messageSendTime (%f) <= call.remoteUplinkMutedSetTime (%f)", (uint8_t *)&v18, 0x20u);
    }
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v6, "setRemoteUplinkMuted:", objc_msgSend(v4, "isRemoteUplinkMuted"));
  [v4 messageSendTime];
  objc_msgSend(v6, "setRemoteUplinkMutedSetTime:");
LABEL_11:
}

- (void)handleUpdateRoutesMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 routes];
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_msgSend(v4, "routes", 0);
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v11) tuRoute];
        [v6 addObject:v12];

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  int v13 = [(CSDRelayController *)self callStateController];
  unsigned __int8 v14 = [v13 pairedHostDeviceRouteController];
  id v15 = [v6 copy];
  [v14 handleUpdatedPairedHostDeviceRoutes:v15];
}

- (void)handleUpdateFailureExpectedMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    objc_msgSend(v6, "setFailureExpected:", objc_msgSend(v4, "isFailureExpected"));
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      double v11 = v8;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleUpdateSupportsEmergencyFallbackMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    objc_msgSend(v6, "setSupportsEmergencyFallback:", objc_msgSend(v4, "supportsEmergencyFallback"));
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      double v11 = v8;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleUpdateSupportsTTYWithVoiceMessageFromHost:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayClientController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    objc_msgSend(v6, "setSupportsTTYWithVoice:", objc_msgSend(v4, "supportsTTYWithVoice"));
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      double v11 = v8;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)pullRemotelyHostedCallsForMessage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_100052F78;
  v27[4] = sub_100052FA4;
  id v17 = a4;
  id v28 = objc_retainBlock(v17);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = [v5 protoCalls];
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    id obj = v6;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        double v11 = [CSDRelayConferenceConnection alloc];
        __int16 v12 = [v10 uniqueProxyIdentifier];
        int v13 = [(CSDRelayConferenceConnection *)v11 initWithIdentifier:v12];

        unsigned __int8 v14 = +[CSDRelayConferenceInterface sharedInstance];
        id v15 = [v5 inviteData];
        long long v16 = [v15 relayInviteDictionary];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100052FAC;
        v20[3] = &unk_1005057E0;
        __int16 v22 = v27;
        v20[4] = self;
        v20[5] = v10;
        id v21 = v5;
        [v14 prepareConferenceConnection:v13 remoteInviteDictionary:v16 completion:v20];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v6 = obj;
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(v27, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDAssistantServicesObserver)assistantServicesObserver
{
  return self->_assistantServicesObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantServicesObserver, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end