@interface CSDRelayHostController
- (CSDRelayHostController)initWithQueue:(id)a3 conversationManager:(id)a4 featureFlags:(id)a5;
- (OS_dispatch_queue)queue;
- (TUConversationManager)conversationManager;
- (TUFeatureFlags)featureFlags;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (void)_answerHostedCall:(id)a3 completionHandler:(id)a4;
- (void)_conferenceTransport:(id)a3 didStopForCall:(id)a4 cleanly:(BOOL)a5 error:(id)a6;
- (void)_launchInCallApplicationForOutgoingCallOnHostIfNecessary;
- (void)handleAddMemberMessageFromClient:(id)a3;
- (void)handleAnswerCallMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5;
- (void)handleBuzzMemberMessageFromClient:(id)a3;
- (void)handleDialCallMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5 completion:(id)a6;
- (void)handleDisconnectAllCallsMessageFromClient:(id)a3;
- (void)handleDisconnectCallMessageFromClient:(id)a3;
- (void)handleDisconnectCurrentCallAndActivateHeldMessageFromClient:(id)a3;
- (void)handleEndActiveAndAnswerMessageFromClient:(id)a3;
- (void)handleEndHeldAndAnswerMessageFromClient:(id)a3;
- (void)handleGroupCallMessageFromClient:(id)a3;
- (void)handleHoldActiveAndAnswerMessageFromClient:(id)a3;
- (void)handleHoldCallMessageFromClient:(id)a3;
- (void)handleJoinConversationMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5 completion:(id)a6;
- (void)handlePickRouteMessageFromClient:(id)a3;
- (void)handlePullHostedCallsMessageFromClient:(id)a3 destination:(id)a4 fromPairedDevice:(BOOL)a5 completion:(id)a6;
- (void)handlePushRelayingCallsMessageFromClient:(id)a3;
- (void)handleRequestCallContextMessageFromClient:(id)a3 fromDevice:(id)a4;
- (void)handleSendHardPauseDigitsMessageFromClient:(id)a3;
- (void)handleSwapCallsMessageFromClient:(id)a3;
- (void)handleUngroupCallMessageFromClient:(id)a3;
- (void)handleUnholdCallMessageFromClient:(id)a3;
- (void)pushHostedCallsForRemoteInviteDictionary:(id)a3 destination:(id)a4 toPairedDevice:(BOOL)a5 completion:(id)a6;
- (void)setFeatureFlags:(id)a3;
@end

@implementation CSDRelayHostController

- (CSDRelayHostController)initWithQueue:(id)a3 conversationManager:(id)a4 featureFlags:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSDRelayHostController;
  v12 = [(CSDRelayHostController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_featureFlags, a5);
    objc_storeStrong((id *)&v13->_conversationManager, a4);
  }

  return v13;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRelayHostController *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = +[TUCallCenter sharedInstance];
  v7 = [v6 callWithUniqueProxyIdentifier:v4];

  return v7;
}

- (void)_answerHostedCall:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CSDRelayHostController *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([v6 isHostedOnCurrentDevice])
  {
    id v9 = [(CSDRelayController *)self relayMessagingController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10018EEA0;
    v11[3] = &unk_100509220;
    id v12 = v6;
    v13 = self;
    id v14 = v7;
    id v10 = [v12 uniqueProxyIdentifier];
    [v9 performBlockOnTransportAvailability:v11 forIdentifier:v10];
  }
}

- (void)_conferenceTransport:(id)a3 didStopForCall:(id)a4 cleanly:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(CSDRelayHostController *)self queue];
  dispatch_assert_queue_V2(v13);

  if ([v11 status] == 5 || objc_msgSend(v11, "status") == 6)
  {
    id v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received did stop for call that is already disconnecting/disconnected", (uint8_t *)&v19, 2u);
    }
  }
  else
  {
    objc_super v15 = [v11 relayClientTransport];
    unsigned int v16 = [v15 isEqualToTransport:v10];

    v17 = sub_100008DCC();
    id v14 = v17;
    if (v16)
    {
      if (v7)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          id v20 = v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Conference connection ended for call %@. Disconnecting call normally", (uint8_t *)&v19, 0xCu);
        }

        id v14 = +[TUCallCenter sharedInstance];
        [v14 disconnectCall:v11];
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1003AF4F8((uint64_t)v11);
        }

        id v14 = +[TUCallCenter sharedInstance];
        [v14 disconnectCall:v11 withReason:8];
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v11 relayClientTransport];
      int v19 = 138412546;
      id v20 = v10;
      __int16 v21 = 2112;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not disconnecting call because this conference transport is %@ but the call's current relay client transport is %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)_launchInCallApplicationForOutgoingCallOnHostIfNecessary
{
  v2 = [(CSDRelayHostController *)self queue];
  dispatch_assert_queue_V2(v2);

  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_launchInCallApplicationForOutgoingCallOnHostIfNecessary", v5, 2u);
  }

  id v4 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v4, &stru_100509240);
}

- (void)handleDialCallMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 dialRequest];
  unsigned int v15 = [v14 isSOS];

  if (v15)
  {
    unsigned int v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "For received dial call message, the dial request is SOS, so disconnecting all existing calls immediately.", buf, 2u);
    }

    v17 = +[TUCallCenter sharedInstance];
    [v17 disconnectAllCalls];
  }
  if (v12)
  {
    v18 = +[CSDRelayIDSService sharedInstance];
    int v19 = [v18 pairedDevice];
    unsigned int v20 = [v19 isEqual:v12];

    int v21 = v20 ^ 1;
  }
  else
  {
    int v21 = 1;
  }
  v22 = +[CSDRouteManager sharedInstance];
  unsigned int v23 = [v22 isEligibleRouteAvailable];

  v24 = [v10 tuProvider];
  unsigned int v25 = [v24 isTinCanProvider];

  if ((v25 & 1) == 0
    && (([v10 hasSourceIdentifier] | v21) & 1) == 0
    && ([v10 cannotRelayAudioOrVideoOnPairedDevice] | v23) == 1)
  {
    v26 = sub_100008DCC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v27 = [v10 cannotRelayAudioOrVideoOnPairedDevice];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v56 = v27;
      *(_WORD *)&v56[4] = 1024;
      *(_DWORD *)&v56[6] = v23;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Dialing without relay because cannotRelayAudioOrVideoOnPairedDevice is set (%d) or an eligible route is available (%d)", buf, 0xEu);
    }

    v28 = [v10 dialRequest];
    [(CSDRelayConferenceConnection *)v28 setEndpointOnCurrentDevice:1];
    v29 = +[TUCallCenter sharedInstance];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10018FAD4;
    v51[3] = &unk_100509288;
    id v52 = v10;
    id v53 = v11;
    v54 = self;
    [v29 dialWithRequest:v28 completion:v51];

    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
    goto LABEL_26;
  }
  v30 = sub_100008DCC();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v31 = [v10 hasSourceIdentifier];
    unsigned int v32 = [v10 cannotRelayAudioOrVideoOnPairedDevice];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v56 = v25;
    *(_WORD *)&v56[4] = 1024;
    *(_DWORD *)&v56[6] = v31;
    __int16 v57 = 1024;
    unsigned int v58 = v32;
    __int16 v59 = 1024;
    unsigned int v60 = v23;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Dialing with relay. isTinCanProvider: %d, message.hasSourceIdentifier: %d, message.cannotRelayAudioOrVideoOnPairedDevice: %d, eligibleRouteAvailable: %d", buf, 0x1Au);
  }

  v33 = +[TUCallCenter sharedInstance];
  if (([v33 anyCallIsEndpointOnCurrentDevice] & 1) == 0)
  {

    goto LABEL_22;
  }
  v34 = [v10 dialRequest];
  unsigned int v35 = [v34 isSOS];

  if (v35)
  {
LABEL_22:
    v40 = [v10 uniqueProxyIdentifier];
    v28 = [[CSDRelayConferenceConnection alloc] initWithIdentifier:v40];
    [(CSDRelayConferenceConnection *)v28 setHost:1];
    [(CSDRelayConferenceConnection *)v28 setAudioDisabled:1];
    v41 = [v10 tuProvider];
    if ([v41 isTelephonyProvider]) {
      uint64_t v42 = +[TUCallCapabilities isWiFiCallingCurrentlyAvailable] ^ 1;
    }
    else {
      uint64_t v42 = 0;
    }
    [(CSDRelayConferenceConnection *)v28 setUsingBaseband:v42];

    v43 = +[CSDRelayConferenceInterface sharedInstance];
    v44 = [v10 inviteData];
    v45 = [v44 relayInviteDictionary];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10018FBC8;
    v47[3] = &unk_100509328;
    v47[4] = self;
    id v48 = v10;
    id v49 = v40;
    id v50 = v13;
    id v46 = v40;
    [v43 prepareConferenceConnection:v28 remoteInviteDictionary:v45 completion:v47];

LABEL_26:
    goto LABEL_27;
  }
  v36 = sub_100008DCC();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = [v10 typeString];
    *(_DWORD *)buf = 138412290;
    *(void *)v56 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[WARN] Received %@ message, but we already have some non-relaying calls. Sending device busy message.", buf, 0xCu);
  }
  v38 = [(CSDRelayController *)self relayMessagingController];
  v39 = [v10 uniqueProxyIdentifier];
  [v38 sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier:v39];

  (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
LABEL_27:
}

- (void)handleJoinConversationMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v9 joinConversationRequest];
  [v12 setEndpointOnCurrentDevice:0];
  [v12 setHostedOnCurrentDevice:1];
  id v13 = objc_alloc((Class)NSUUID);
  id v14 = [v9 uniqueProxyIdentifier];
  id v15 = [v13 initWithUUIDString:v14];
  [v12 setUUID:v15];

  unsigned int v16 = +[TUCallCenter sharedInstance];
  LODWORD(v14) = [v16 anyCallIsEndpointOnCurrentDevice];

  if (v14)
  {
    v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v9 typeString];
      *(_DWORD *)buf = 138412290;
      v39 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Received %@ message, but we already have some non-relaying calls. Sending device busy message.", buf, 0xCu);
    }
    int v19 = [(CSDRelayController *)self relayMessagingController];
    unsigned int v20 = [v9 uniqueProxyIdentifier];
    [v19 sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier:v20];

    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
  int v21 = [v12 UUID];
  v22 = [v21 UUIDString];

  unsigned int v23 = [[CSDRelayConferenceConnection alloc] initWithIdentifier:v22];
  [(CSDRelayConferenceConnection *)v23 setHost:1];
  [(CSDRelayConferenceConnection *)v23 setAudioDisabled:1];
  v24 = +[CSDRelayConferenceInterface sharedInstance];
  unsigned int v25 = [v9 inviteData];
  v26 = [v25 relayInviteDictionary];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100190560;
  v32[3] = &unk_100509378;
  v32[4] = self;
  id v33 = v12;
  id v34 = v10;
  id v35 = v22;
  id v36 = v9;
  id v37 = v11;
  id v27 = v11;
  id v28 = v9;
  id v29 = v22;
  id v30 = v10;
  id v31 = v12;
  [v24 prepareConferenceConnection:v23 remoteInviteDictionary:v26 completion:v32];
}

- (void)handleAnswerCallMessageFromClient:(id)a3 destination:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 uniqueProxyIdentifier];
  id v12 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v11];

  if (v12)
  {
    if (v10
      && (+[CSDRelayIDSService sharedInstance],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v13 pairedDevice],
          id v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = [v14 isEqual:v10],
          v14,
          v13,
          v15)
      && (([v8 cannotRelayAudioOrVideoOnPairedDevice] & 1) != 0
       || [v8 wantsHoldMusic]))
    {
      unsigned int v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)id v31 = [v8 wantsHoldMusic];
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = [v8 cannotRelayAudioOrVideoOnPairedDevice];
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Answering without relay because wantsHoldMusic is set (%d) or cannotRelayAudioOrVideoOnPairedDevice is set (%d)", buf, 0xEu);
      }

      v17 = +[CSDRouteManager sharedInstance];
      v18 = [v17 preferredRouteForCall:v12];

      id v19 = [objc_alloc((Class)TUAnswerRequest) initWithCall:v12];
      if (v18) {
        [v18 uniqueIdentifier];
      }
      else {
      v22 = [v8 sourceIdentifier];
      }
      [v19 setSourceIdentifier:v22];

      objc_msgSend(v19, "setWantsHoldMusic:", objc_msgSend(v8, "wantsHoldMusic"));
      objc_msgSend(v19, "setPauseVideoToStart:", objc_msgSend(v8, "wantsHoldMusic"));
      if ([v12 isVideo])
      {
        if ([v8 hasProtoVideo])
        {
          unsigned int v23 = +[FTDeviceSupport sharedInstance];
          unsigned __int8 v24 = [v23 isGreenTea];

          if ((v24 & 1) == 0)
          {
            unsigned int v25 = sub_100008DCC();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Requesting downgrade to audio because paired device requested to answer call and we are not green tea", buf, 2u);
            }

            [v19 setBehavior:4];
          }
        }
      }
      v26 = +[TUCallCenter sharedInstance];
      [v26 answerWithRequest:v19];

      if ([v8 isExpectedEndpointOnMessagingDevice]) {
        [v12 setExpectedRelayClientDestination:v9];
      }
    }
    else
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100190FE0;
      v27[3] = &unk_100504F10;
      id v28 = v12;
      id v29 = v8;
      [(CSDRelayHostController *)self _answerHostedCall:v28 completionHandler:v27];

      v18 = v28;
    }
  }
  else
  {
    v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [v8 uniqueProxyIdentifier];
      int v21 = [(CSDRelayController *)self allCalls];
      *(_DWORD *)buf = 138412546;
      *(void *)id v31 = v20;
      *(_WORD *)&v31[8] = 2112;
      unsigned int v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", buf, 0x16u);
    }
  }
}

- (void)handleDisconnectCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    BOOL v7 = +[TUCallCenter sharedInstance];
    objc_msgSend(v7, "disconnectCall:withReason:", v6, objc_msgSend(v4, "disconnectedReason"));

    id v8 = +[CSDRelayConferenceInterface sharedInstance];
    id v9 = [v6 uniqueProxyIdentifier];
    [v8 stopConferenceForIdentifier:v9];
  }
  else
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 uniqueProxyIdentifier];
      id v11 = [(CSDRelayController *)self allCalls];
      int v12 = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      unsigned int v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)handleHoldCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    BOOL v7 = +[TUCallCenter sharedInstance];
    [v7 holdCall:v6];
  }
  else
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleUnholdCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    BOOL v7 = +[TUCallCenter sharedInstance];
    [v7 unholdCall:v6];
  }
  else
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleGroupCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v5];

  if (!v6)
  {
    id v9 = sub_100008DCC();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    id v11 = [v4 uniqueProxyIdentifier];
    __int16 v12 = [(CSDRelayController *)self allCalls];
    *(_DWORD *)buf = 138412546;
    unsigned int v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", buf, 0x16u);

    goto LABEL_13;
  }
  if ([v4 otherUniqueProxyIdentifiersCount])
  {
    BOOL v7 = [v4 otherUniqueProxyIdentifiers];
    id v8 = [v7 firstObject];
    id v9 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v8];

    if (v9)
    {
      int v10 = +[TUCallCenter sharedInstance];
      [v10 groupCall:v6 withOtherCall:v9];

      goto LABEL_17;
    }
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v4 otherUniqueProxyIdentifiers];
      id v19 = [v18 firstObject];
      unsigned int v20 = [(CSDRelayController *)self allCalls];
      *(_DWORD *)buf = 138412546;
      unsigned int v25 = v19;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with other uniqueProxyIdentifier %@. All current calls: %@", buf, 0x16u);
    }
LABEL_13:

    goto LABEL_17;
  }
  id v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No other unique proxy identifiers included. Assuming legacy behavior", buf, 2u);
  }

  __int16 v14 = +[TUCallCenter sharedInstance];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100191850;
  v22[3] = &unk_1005051A8;
  unsigned int v15 = v6;
  unsigned int v23 = v15;
  unsigned int v16 = [v14 callPassingTest:v22];

  if (v16)
  {
    v17 = +[TUCallCenter sharedInstance];
    [v17 groupCall:v15 withOtherCall:v16];
  }
  else
  {
    v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [(CSDRelayController *)self allCalls];
      *(_DWORD *)buf = 138412290;
      unsigned int v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find another call to group with. All calls: %@", buf, 0xCu);
    }
  }

  id v9 = v23;
LABEL_17:
}

- (void)handleUngroupCallMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    BOOL v7 = +[TUCallCenter sharedInstance];
    [v7 ungroupCall:v6];
  }
  else
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleSwapCallsMessageFromClient:(id)a3
{
  id v3 = +[TUCallCenter sharedInstance];
  [v3 swapCalls];
}

- (void)handleEndActiveAndAnswerMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100191BB0;
    v10[3] = &unk_100504EC0;
    id v11 = v6;
    [(CSDRelayHostController *)self _answerHostedCall:v11 completionHandler:v10];
    BOOL v7 = v11;
  }
  else
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      *(_DWORD *)buf = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      unsigned int v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", buf, 0x16u);
    }
  }
}

- (void)handleEndHeldAndAnswerMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100191D98;
    v10[3] = &unk_100504EC0;
    id v11 = v6;
    [(CSDRelayHostController *)self _answerHostedCall:v11 completionHandler:v10];
    BOOL v7 = v11;
  }
  else
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      *(_DWORD *)buf = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      unsigned int v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", buf, 0x16u);
    }
  }
}

- (void)handleHoldActiveAndAnswerMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100191F80;
    v10[3] = &unk_100504EC0;
    id v11 = v6;
    [(CSDRelayHostController *)self _answerHostedCall:v11 completionHandler:v10];
    BOOL v7 = v11;
  }
  else
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 uniqueProxyIdentifier];
      id v9 = [(CSDRelayController *)self allCalls];
      *(_DWORD *)buf = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      unsigned int v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", buf, 0x16u);
    }
  }
}

- (void)handleDisconnectCurrentCallAndActivateHeldMessageFromClient:(id)a3
{
  id v3 = a3;
  id v4 = +[TUCallCenter sharedInstance];
  [v4 disconnectCurrentCallAndActivateHeld];

  id v6 = +[CSDRelayConferenceInterface sharedInstance];
  v5 = [v3 uniqueProxyIdentifier];

  [v6 stopConferenceForIdentifier:v5];
}

- (void)handleDisconnectAllCallsMessageFromClient:(id)a3
{
  id v3 = a3;
  id v4 = +[TUCallCenter sharedInstance];
  [v4 disconnectAllCalls];

  id v6 = +[CSDRelayConferenceInterface sharedInstance];
  v5 = [v3 uniqueProxyIdentifier];

  [v6 stopConferenceForIdentifier:v5];
}

- (void)handleSendHardPauseDigitsMessageFromClient:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueProxyIdentifier];

  if (v5)
  {
    id v6 = [v4 uniqueProxyIdentifier];
    BOOL v7 = [(CSDRelayHostController *)self callWithUniqueProxyIdentifier:v6];
LABEL_3:

    [v7 sendHardPauseDigits];
    goto LABEL_4;
  }
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No call was specified with SendHardPauseDigits message...", (uint8_t *)&v11, 2u);
  }

  id v9 = +[TUCallCenter sharedInstance];
  BOOL v7 = [v9 callPassingTest:&stru_100509398];

  int v10 = sub_100008DCC();
  id v6 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      __int16 v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "...so sending hard pause digits for call %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_3;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1003AF7C4(v6);
  }

LABEL_4:
}

- (void)handleRequestCallContextMessageFromClient:(id)a3 fromDevice:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDRelayController *)self relayMessagingController];
  [v6 sendResetStateMessageToClient];

  BOOL v7 = [(CSDRelayController *)self relayMessagingController];
  id v8 = [(CSDRelayController *)self callStateController];
  id v9 = [v8 callProviderManager];
  [v7 sendUpdateCallContextMessageToClientForCallProviderManager:v9];

  LODWORD(v7) = [v5 canReceiveRelayedGFTCalls];
  if (v7)
  {
    id v14 = [(CSDRelayController *)self relayMessagingController];
    int v10 = +[TUCallCenter sharedInstance];
    int v11 = [v10 conversationManager];
    __int16 v12 = [v11 activeConversations];
    id v13 = [v12 allObjects];
    [v14 sendUpdateConversationsMessageToClient:v13];
  }
}

- (void)handlePullHostedCallsMessageFromClient:(id)a3 destination:(id)a4 fromPairedDevice:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CSDRelayController *)self relayMessagingController];
  [v13 sendUpdateRemoteCallStateMessageToClient:1];

  id v15 = [v12 inviteData];

  id v14 = [v15 relayInviteDictionary];
  [(CSDRelayHostController *)self pushHostedCallsForRemoteInviteDictionary:v14 destination:v11 toPairedDevice:v6 completion:v10];
}

- (void)handlePushRelayingCallsMessageFromClient:(id)a3
{
  id v3 = a3;
  id v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 callsWithAnEndpointElsewhere];
  BOOL v6 = [v5 firstObject];

  if (v6)
  {
    uint64_t v7 = [v3 sourceIdentifier];
    if (!v7) {
      goto LABEL_4;
    }
    id v8 = (void *)v7;
    id v9 = +[CSDRouteManager sharedInstance];
    id v10 = [v3 sourceIdentifier];
    unsigned int v11 = [v9 isAnyRouteAvailableWithUniqueIdentifier:v10 forCall:v6];

    if (!v11)
    {
      unsigned int v23 = sub_100008DCC();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = [v3 sourceIdentifier];
        *(_DWORD *)buf = 138412290;
        id v34 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find any audio route with source identifier %@. Ignoring push relaying calls request", buf, 0xCu);
      }
    }
    else
    {
LABEL_4:
      id v12 = [v3 sourceIdentifier];

      if (v12)
      {
        id v13 = sub_100008DCC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v3 sourceIdentifier];
          *(_DWORD *)buf = 138412290;
          id v34 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting sourceIdentifier to %@ for all calls before pulling", buf, 0xCu);
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v15 = +[TUCallCenter sharedInstance];
        unsigned int v16 = [v15 currentAudioAndVideoCalls];

        id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v29;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v29 != v19) {
                objc_enumerationMutation(v16);
              }
              int v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              v22 = [v3 sourceIdentifier];
              [v21 setSourceIdentifier:v22];
            }
            id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v18);
        }
      }
      else
      {
        unsigned int v16 = +[NSURL faceTimeShowInCallUIURL];
        id v27 = sub_100008DCC();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v16;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Opening URL for handled pushRelayingCalls message from client: %@", buf, 0xCu);
        }

        TUOpenURL();
      }

      unsigned int v23 = +[TUCallCenter sharedInstance];
      [v23 pullRelayingCallsFromClient];
    }
  }
  else
  {
    unsigned int v23 = sub_100008DCC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v24 = +[TUCallCenter sharedInstance];
      unsigned int v25 = [v24 _allCalls];
      *(_DWORD *)buf = 138412290;
      id v34 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[WARN] Asked to pull relaying calls from client when no calls with an endpoint elsewhere exist. All calls: %@", buf, 0xCu);
    }
  }
}

- (void)handlePickRouteMessageFromClient:(id)a3
{
  id v3 = [a3 route];
  id v6 = [v3 tuRoute];

  id v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 routeController];
  [v5 pickRoute:v6];
}

- (void)pushHostedCallsForRemoteInviteDictionary:(id)a3 destination:(id)a4 toPairedDevice:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v23 = a3;
  id v24 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100192CD4;
  v30[4] = sub_100192D00;
  id v22 = a6;
  id v31 = objc_retainBlock(v22);
  id v10 = +[TUCallCenter sharedInstance];
  if ([v10 hasCurrentVideoCalls] & v7)
  {
    unsigned int v11 = +[FTDeviceSupport sharedInstance];
    unsigned int v12 = [v11 isGreenTea];

    if (v12)
    {
      id v13 = sub_100008DCC();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] We cannot send video calls to audio only device in china", buf, 2u);
      }

      (*((void (**)(id, void))v22 + 2))(v22, 0);
      goto LABEL_20;
    }
  }
  else
  {
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = +[TUCallCenter sharedInstance];
  id v15 = [v14 currentAudioAndVideoCalls];

  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v19 hasRelaySupport:2])
        {
          [v19 setEndpointOnCurrentDevice:0];
          [v19 setExpectedRelayClientDestination:v24];
          unsigned int v20 = +[CSDRelayConferenceInterface sharedInstance];
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100192D08;
          v25[3] = &unk_100509410;
          v25[5] = self;
          v25[6] = v30;
          v25[4] = v19;
          [v20 prepareConferenceForCall:v19 remoteInviteDictionary:v23 completion:v25];
        }
        else
        {
          int v21 = sub_100008DCC();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Asked to push relaying calls to client but current call: %@ does not support audio+video relay", buf, 0xCu);
          }
        }
      }
      id v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

LABEL_20:
  _Block_object_dispose(v30, 8);
}

- (void)handleBuzzMemberMessageFromClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayHostController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDRelayHostController *)self featureFlags];
  unsigned int v7 = [v6 gftOnWatch];

  if (v7)
  {
    id v8 = [v4 conversationMembers];
    id v9 = [v8 firstObject];
    id v10 = [v9 tuConversationMember];

    id v11 = objc_alloc((Class)NSUUID);
    unsigned int v12 = [v4 conversationUUIDString];
    id v13 = [v11 initWithUUIDString:v12];

    id v14 = [(CSDRelayHostController *)self conversationManager];
    id v15 = [v14 activeConversationWithUUID:v13];

    if (v15 && v10)
    {
      id v16 = [(CSDRelayHostController *)self conversationManager];
      [v16 buzzMember:v10 conversation:v15];
    }
    else
    {
      id v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412802;
        id v18 = v13;
        __int16 v19 = 2112;
        unsigned int v20 = v10;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No active conversation with UUID: %@ or member: %@ found for buzz member message %@", (uint8_t *)&v17, 0x20u);
      }
    }
  }
}

- (void)handleAddMemberMessageFromClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayHostController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDRelayHostController *)self featureFlags];
  unsigned int v7 = [v6 gftOnWatch];

  if (v7)
  {
    id v8 = +[NSMutableSet set];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = [v4 conversationMembers];
    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)v13) tuConversationMember];
          [v8 addObject:v14];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v11);
    }

    id v15 = +[NSMutableSet set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = objc_msgSend(v4, "handlesToInvites", 0);
    id v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        unsigned int v20 = 0;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          __int16 v21 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)v20) tuHandle];
          [v15 addObject:v21];

          unsigned int v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v18);
    }

    id v22 = objc_alloc((Class)NSUUID);
    id v23 = [v4 conversationUUIDString];
    id v24 = [v22 initWithUUIDString:v23];

    unsigned int v25 = [(CSDRelayHostController *)self conversationManager];
    long long v26 = [v25 activeConversationWithUUID:v24];

    if (v26 && ([v15 count] || objc_msgSend(v8, "count")))
    {
      long long v27 = [(CSDRelayHostController *)self conversationManager];
      [v27 addRemoteMembers:v8 otherInvitedHandles:v15 toConversation:v26];
    }
    else
    {
      long long v27 = sub_100008DCC();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1003AF940((uint64_t)v24);
      }
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end