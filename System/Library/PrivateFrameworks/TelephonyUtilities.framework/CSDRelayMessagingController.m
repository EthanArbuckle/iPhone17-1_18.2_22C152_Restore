@interface CSDRelayMessagingController
- (BOOL)_canReceiveGuestSessionInviteForMessageType:(int)a3;
- (BOOL)_shouldDeclineSessionInviteWithMessage:(id)a3;
- (BOOL)_shouldSendToPairedIDSDevice;
- (BOOL)_shouldSendToPairedIDSDevice:(BOOL)a3;
- (BOOL)shouldDeclineSecondSessionInviteWithMessage:(id)a3;
- (BOOL)shouldDeclineSessionInviteWithMessageWhenRelayIsDisabled:(id)a3;
- (BOOL)shouldProcessRelayMessageOfType:(int)a3;
- (BOOL)shouldScreenTimeRestrictMessage:(id)a3;
- (CSDCallContainer)callCenter;
- (CSDRelayIDSSessionMessenger)sessionMessenger;
- (CSDRelayMessagingController)initWithQueue:(id)a3 callContainer:(id)a4 sessionMessenger:(id)a5 localRouteController:(id)a6;
- (CSDRelayMessagingController)initWithQueue:(id)a3 localRouteController:(id)a4;
- (CSDRelayMessagingControllerClientMessagingDelegate)clientMessagingDelegate;
- (CSDRelayMessagingControllerCommonMessagingDelegate)commonMessagingDelegate;
- (CSDRelayMessagingControllerDelegate)delegate;
- (CSDRelayMessagingControllerHostMessagingDelegate)hostMessagingDelegate;
- (CSDRelayPairedDeviceMessenger)pairedDeviceMessenger;
- (CSDRouteController)localRouteController;
- (IDSDestination)dialingIDSDestination;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)_callsWithUniqueProxyIdentifiers:(id)a3;
- (id)bundleIdentifierForProvider:(id)a3;
- (id)identifiersForSessionInvitationWithMessage:(id)a3;
- (id)remoteDeviceForUPI:(id)a3;
- (int64_t)_relayInvitationTimeoutForTimeout:(int64_t)a3;
- (int64_t)timeoutForInvitationWithMessage:(id)a3;
- (void)_handleCallChanged:(id)a3;
- (void)_handleConferenceConnectionDidClose:(id)a3;
- (void)_handleConferenceConnectionDidReceiveData:(id)a3;
- (void)_handleConferenceConnectionWillClose:(id)a3;
- (void)_handleRetrievedLocalInviteDictionary:(id)a3 forMessage:(id)a4;
- (void)_updateDialingIDSDeviceWithHostIDSIdentifier:(id)a3;
- (void)checkShouldIgnoreSessionInviteWithMessage:(id)a3 fromDestination:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)disconnectMessagingConnectionForCall:(id)a3;
- (void)messenger:(id)a3 handledMessage:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)messengerConnectionCouldNotEstablishLink:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5;
- (void)messengerConnectionEnded:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5;
- (void)messengerConnectionFailed:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5;
- (void)performBlockOnTransportAvailability:(id)a3 forIdentifier:(id)a4;
- (void)prepareToDisconnectMessagingConnectionForCall:(id)a3;
- (void)requestAnswerForRequest:(id)a3 forCall:(id)a4;
- (void)sendAddRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5;
- (void)sendAnswerCallMessageToHostForCall:(id)a3;
- (void)sendBuzzMember:(id)a3 toConversation:(id)a4;
- (void)sendCallAnsweredElsewhereMessageToClientForCall:(id)a3;
- (void)sendCallConnectedMessageToClientForCall:(id)a3;
- (void)sendCallDialedMessageToClientForCall:(id)a3;
- (void)sendCallDisconnectedMessageToClientForCall:(id)a3;
- (void)sendCallStartedConnectingMessageToClientForCall:(id)a3;
- (void)sendConversationAudioPriorityToClientForConversation:(id)a3;
- (void)sendConversationToClientForConversation:(id)a3 withConversationMessageType:(int)a4;
- (void)sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier:(id)a3;
- (void)sendDialCallFailedForScreenTimeForUniqueProxyIdentifier:(id)a3;
- (void)sendDialCallFailedForUniqueProxyIdentifier:(id)a3;
- (void)sendDialCallFailedForUniqueProxyIdentifier:(id)a3 withDisconnectedReason:(int)a4;
- (void)sendDialCallMessageToHostForCall:(id)a3 completionHandler:(id)a4;
- (void)sendDisconnectAllCallsMessageToHostForDisconnectedCall:(id)a3;
- (void)sendDisconnectCallMessageToHostForCall:(id)a3;
- (void)sendDisconnectCurrentCallAndActivateHeldMessageToHostForDisconnectedCall:(id)a3;
- (void)sendEndActiveAndAnswerCallMessageToHostForCall:(id)a3;
- (void)sendEndHeldAndAnswerCallMessageToHostForCall:(id)a3;
- (void)sendGroupCallMessageToHostForCall:(id)a3 otherCall:(id)a4;
- (void)sendHardPauseAvailabilityMessageToClientForState:(int)a3 digits:(id)a4;
- (void)sendHoldActiveAndAnswerCallMessageToHostForCall:(id)a3;
- (void)sendHoldCallMessageToHostForCall:(id)a3;
- (void)sendIncomingCallMessageToClientForCall:(id)a3 cannotBeAnswered:(BOOL)a4 cannotRelayAudioOrVideoOnPairedDevice:(BOOL)a5;
- (void)sendInvitationSentMessageToClientForCall:(id)a3;
- (void)sendJoinConversationMessageToHostForCall:(id)a3 completionHandler:(id)a4;
- (void)sendNeedsManualInCallSoundsChangeMessageToClientForCall:(id)a3;
- (void)sendPickRouteMessageToHostForRoute:(id)a3;
- (void)sendPlayDTMFToneForKeyMessageForCall:(id)a3 DTMFKey:(unsigned __int8)a4;
- (void)sendPullCallsMessageToHost;
- (void)sendPullRelayingCallsMessageToClientAndDisconnectCallsWithUPI:(id)a3;
- (void)sendPushCallsMessageToClientDestination:(id)a3;
- (void)sendPushRelayingCallsMessageToHostForSourceIdentifier:(id)a3;
- (void)sendReceivedDTMFUpdateForCall:(id)a3 dtmfUpdate:(id)a4;
- (void)sendRequestCallStateMessageToHost;
- (void)sendResetStateMessageToClient;
- (void)sendResetWantsHoldMusicMessageToClientForCall:(id)a3;
- (void)sendSendHardPauseDigitsMessageToHostForCall:(id)a3;
- (void)sendSetTTYTypeCallMessageForCall:(id)a3 ttyType:(int)a4;
- (void)sendSetUplinkMutedCallMessageForCall:(id)a3 uplinkMuted:(BOOL)a4;
- (void)sendSuppressRingtoneMessageForCall:(id)a3;
- (void)sendSwapCallsMessageToHost;
- (void)sendUngroupCallMessageToHostForCall:(id)a3;
- (void)sendUnholdCallMessageToHostForCall:(id)a3;
- (void)sendUpdateCallContextMessageToClientForCallProviderManager:(id)a3;
- (void)sendUpdateCallDisplayContextMessageToClientForCall:(id)a3;
- (void)sendUpdateCallModelMessageToClientForCall:(id)a3;
- (void)sendUpdateConversationsMessageToClient:(id)a3;
- (void)sendUpdateFailureExpectedMessageToClientForCall:(id)a3;
- (void)sendUpdateRemoteCallStateMessageToClient;
- (void)sendUpdateRemoteCallStateMessageToClient:(BOOL)a3;
- (void)sendUpdateRemoteUplinkMutedCallMessageToClientForCall:(id)a3;
- (void)sendUpdateRemoteUplinkMutedCallMessageToHostForCall:(id)a3;
- (void)sendUpdateRoutesMessageToClientForRoutes:(id)a3;
- (void)sendUpdateSupportsDTMFUpdatesToClientForCall:(id)a3;
- (void)sendUpdateSupportsEmergencyFallbackToClientForCall:(id)a3;
- (void)sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall:(id)a3;
- (void)sendUpdateSystemVolumeForCall:(id)a3 volume:(float)a4;
- (void)setClientMessagingDelegate:(id)a3;
- (void)setCommonMessagingDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialingIDSDestination:(id)a3;
- (void)setHostMessagingDelegate:(id)a3;
@end

@implementation CSDRelayMessagingController

- (CSDRelayMessagingController)initWithQueue:(id)a3 localRouteController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[CSDRelayIDSSessionMessenger alloc] initWithQueue:v7 localRouteController:v6];
  v9 = +[TUCallCenter sharedInstance];
  v10 = [(CSDRelayMessagingController *)self initWithQueue:v7 callContainer:v9 sessionMessenger:v8 localRouteController:v6];

  return v10;
}

- (CSDRelayMessagingController)initWithQueue:(id)a3 callContainer:(id)a4 sessionMessenger:(id)a5 localRouteController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CSDRelayMessagingController;
  v15 = [(CSDRelayMessagingController *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_callCenter, a4);
    objc_storeStrong((id *)&v16->_localRouteController, a6);
    objc_storeStrong((id *)&v16->_sessionMessenger, a5);
    [(CSDRelayIDSMessenger *)v16->_sessionMessenger setDelegate:v16];
    objc_storeStrong((id *)&v16->_localRouteController, a6);
    v17 = [[CSDRelayPairedDeviceMessenger alloc] initWithQueue:v16->_queue];
    pairedDeviceMessenger = v16->_pairedDeviceMessenger;
    v16->_pairedDeviceMessenger = v17;

    [(CSDRelayIDSMessenger *)v16->_pairedDeviceMessenger setDelegate:v16];
    v19 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v16->_featureFlags;
    v16->_featureFlags = v19;

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v16 selector:"_handleConferenceConnectionWillClose:" name:@"CSDRelayConferenceConnectionWillCloseNotification" object:0];

    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v16 selector:"_handleConferenceConnectionDidClose:" name:@"CSDRelayConferenceConnectionDidCloseNotification" object:0];

    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v16 selector:"_handleConferenceConnectionDidReceiveData:" name:@"CSDRelayConferenceConnectionDidReceiveDataNotification" object:0];

    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v16 selector:"_handleCallChanged:" name:TUCallCenterCallStatusChangedInternalNotification object:0];
  }
  return v16;
}

- (NSString)debugDescription
{
  v3 = +[NSMutableString stringWithFormat:@"%@\n", self];
  v4 = [(CSDRelayMessagingController *)self dialingIDSDestination];
  [v3 appendFormat:@"    dialingIDSDevice: %@\n", v4];

  return (NSString *)v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDRelayMessagingController;
  [(CSDRelayMessagingController *)&v4 dealloc];
}

- (int64_t)_relayInvitationTimeoutForTimeout:(int64_t)a3
{
  return a3 + 10;
}

- (void)_handleCallChanged:(id)a3
{
  objc_super v4 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 isHostedOnCurrentDevice] & 1) == 0)
  {
    if ([v4 isEndpointOnCurrentDevice])
    {
      if ([v4 status] == 4)
      {
        v5 = [(CSDRelayMessagingController *)self sessionMessenger];
        id v6 = [v4 uniqueProxyIdentifier];
        id v7 = [v5 sessionForIdentifier:v6];

        if (!v7)
        {
          v8 = sub_100008DCC();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v9 = 138412290;
            v10 = v4;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Terminating relay call that we don't have a relay session for: %@", (uint8_t *)&v9, 0xCu);
          }

          [v4 setLocallyDisconnectedWithReasonIfNone:0];
        }
      }
    }
  }
}

- (id)remoteDeviceForUPI:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v6 = [v5 sessionForIdentifier:v4];

  id v7 = [v6 remoteDevice];

  return v7;
}

- (void)_handleConferenceConnectionWillClose:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling %@ by preparing connected sessions to end", buf, 0xCu);
  }
  id v7 = [(CSDRelayMessagingController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090730;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)_handleConferenceConnectionDidClose:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling %@ by ending ending sessions", buf, 0xCu);
  }
  id v7 = [(CSDRelayMessagingController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000908A4;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)_handleConferenceConnectionDidReceiveData:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRelayMessagingController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009099C;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateDialingIDSDeviceWithHostIDSIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[CSDRelayIDSService sharedInstance];
  id v6 = [v5 devices];

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v52 = v6;
    __int16 v53 = 2112;
    v54 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating dialingIDSDevice using device list %@, host: %@", buf, 0x16u);
  }

  [(CSDRelayMessagingController *)self setDialingIDSDestination:0];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v45;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v45 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v44 + 1) + 8 * v12);
      if ([v13 isPairedDevice]) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v14 = v13;

    if (!v14) {
      goto LABEL_16;
    }
    v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "A paired device exists, so using that as the dialing device: %@", buf, 0xCu);
    }

    v16 = [v14 destination];
    [(CSDRelayMessagingController *)self setDialingIDSDestination:v16];
  }
  else
  {
LABEL_11:

LABEL_16:
    id v14 = +[TUCallCapabilities outgoingRelayCallerID];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v17 = v8;
    id v35 = [v17 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v35)
    {
      v32 = v4;
      obj = v17;
      v30 = self;
      v31 = v8;
      v16 = 0;
      uint64_t v34 = *(void *)v41;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v41 != v34) {
            objc_enumerationMutation(obj);
          }
          v19 = *(NSObject **)(*((void *)&v40 + 1) + 8 * i);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          v20 = [v19 linkedUserURIs];
          id v21 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v37;
            while (2)
            {
              for (j = 0; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v37 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)j) _stripFZIDPrefix];
                unsigned int v26 = [v14 isEqualToString:v25];

                if (v26)
                {
                  if (!v16)
                  {
                    v16 = v19;
                    goto LABEL_35;
                  }
                  v27 = sub_100008DCC();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v52 = v16;
                    __int16 v53 = 2112;
                    v54 = v19;
                    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARN] We found two devices with matching linkedUserURIs (arbitrarily choosing the first): %@ and %@", buf, 0x16u);
                  }
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
LABEL_35:
        }
        id v35 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v35);

      id v8 = v31;
      id v4 = v32;
      if (v16)
      {
        v28 = sub_100008DCC();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v52 = v14;
          __int16 v53 = 2112;
          v54 = v16;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "A device exists with a linkedUserURI that matches Caller ID %@, so using that as the dialing device: %@", buf, 0x16u);
        }

        v29 = [v16 destination];
        [(CSDRelayMessagingController *)v30 setDialingIDSDestination:v29];

        goto LABEL_44;
      }
    }
    else
    {
    }
    v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find a dialingIDSDevice. No paired devices exist and no devices that support phone calls and have a linkedUserURI for %@ exist.", buf, 0xCu);
    }
  }
LABEL_44:
}

- (BOOL)_shouldSendToPairedIDSDevice
{
  return [(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice:0];
}

- (BOOL)_shouldSendToPairedIDSDevice:(BOOL)a3
{
  v5 = +[CSDRelayIDSService sharedInstance];
  unsigned int v6 = [v5 pairedDeviceExists];
  if (v6 && !a3)
  {
    id v7 = [(CSDRelayMessagingController *)self sessionMessenger];
    id v8 = [v7 deviceWithActiveSession];
    if (v8)
    {
      id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
      id v10 = [v9 deviceWithActiveSession];
      uint64_t v11 = +[CSDRelayIDSService sharedInstance];
      uint64_t v12 = [v11 pairedDevice];
      unsigned int v6 = [v10 isEqual:v12] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)_callsWithUniqueProxyIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [(CSDRelayMessagingController *)self callCenter];
        id v13 = [v12 callWithUniqueProxyIdentifier:v11];

        if (v13) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];

  return v14;
}

- (void)_handleRetrievedLocalInviteDictionary:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDRelayMessagingController *)self identifiersForSessionInvitationWithMessage:v7];
  if (v6)
  {
    uint64_t v9 = [[CSDMessagingRelayMessage alloc] initWithType:0];
    id v10 = [[CSDMessagingAVConferenceInviteData alloc] initWithRelayInviteDictionary:v6];
    [(CSDMessagingRelayMessage *)v9 setInviteData:v10];

    uint64_t v11 = [(CSDRelayMessagingController *)self sessionMessenger];
    uint64_t v12 = [v8 firstObject];
    [v11 sendMessage:v9 andAcceptInvitationIfNecessaryForIdentifier:v12];
  }
  else
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003A90A8((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);
    }

    v20 = [(CSDRelayMessagingController *)self sessionMessenger];
    id v21 = [v8 firstObject];
    [v20 cancelOrDeclineInvitationForIdentifier:v21];
  }
}

- (void)sendIncomingCallMessageToClientForCall:(id)a3 cannotBeAnswered:(BOOL)a4 cannotRelayAudioOrVideoOnPairedDevice:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendIncomingCallMessageToClientForCall: %@", buf, 0xCu);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000916B4;
  v20[3] = &unk_1005062F0;
  id v10 = v8;
  id v21 = v10;
  BOOL v22 = a5;
  uint64_t v11 = objc_retainBlock(v20);
  if (v6)
  {
    uint64_t v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Call cannot be answered. Only notifying the paired device", buf, 2u);
    }

    id v13 = ((void (*)(void *))v11[2])(v11);
    [v13 setCannotBeAnswered:1];
    uint64_t v14 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v14 sendMessage:v13 completionHandler:0];
  }
  else
  {
    uint64_t v15 = +[CSDRelayConferenceInterface sharedInstance];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100091ACC;
    v16[3] = &unk_100506318;
    id v17 = v10;
    uint64_t v18 = self;
    uint64_t v19 = v11;
    [v15 prepareConferenceForCall:v17 remoteInviteDictionary:0 completion:v16];

    id v13 = v17;
  }
}

- (void)sendUpdateConversationsMessageToClient:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateConversationsMessageToClient: %@", buf, 0xCu);
  }

  BOOL v6 = [[CSDMessagingRelayMessage alloc] initWithType:54];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
        id v13 = [CSDMessagingConversationRelayMessage alloc];
        uint64_t v14 = -[CSDMessagingConversationRelayMessage initWithConversation:](v13, "initWithConversation:", v12, (void)v16);
        [(CSDMessagingConversationRelayMessage *)v14 setType:1];
        [(CSDMessagingRelayMessage *)v6 addConversations:v14];

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v15 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v15 sendMessage:v6 completionHandler:0];
}

- (void)sendConversationToClientForConversation:(id)a3 withConversationMessageType:(int)a4
{
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendConversationMessageToClientForConversation: %@", buf, 0xCu);
  }

  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  long long v17 = sub_100091FB0;
  long long v18 = &unk_100506340;
  id v19 = v6;
  int v20 = a4;
  id v8 = v6;
  id v9 = objc_retainBlock(&v15);
  id v13 = ((void (*)(void ***, uint64_t, uint64_t, uint64_t))v9[2])(v9, v10, v11, v12);
  uint64_t v14 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v14 sendMessage:v13 completionHandler:0];
}

- (void)sendConversationAudioPriorityToClientForConversation:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendConversationMessageToClientForConversation: %@", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000921D4;
  v10[3] = &unk_100506368;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_retainBlock(v10);
  id v8 = ((void (*)(void))v7[2])();
  id v9 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v9 sendMessage:v8 completionHandler:0];
}

- (void)sendCallDialedMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendCallDialedMessageToClientForCall: %@", (uint8_t *)&v26, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:3 uniqueProxyIdentifier:v7];

  id v9 = [v4 handle];
  [(CSDMessagingRelayMessage *)v8 setTuHandle:v9];

  uint64_t v10 = [v4 isoCountryCode];
  [(CSDMessagingRelayMessage *)v8 setIsoCountryCode:v10];

  id v11 = [v4 provider];
  -[CSDMessagingRelayMessage setTuProvider:isVideo:](v8, "setTuProvider:isVideo:", v11, [v4 isVideo]);

  uint64_t v12 = [v4 sourceIdentifier];
  [(CSDMessagingRelayMessage *)v8 setSourceIdentifier:v12];

  id v13 = [v4 model];
  [(CSDMessagingRelayMessage *)v8 setCallModel:v13];

  -[CSDMessagingRelayMessage setVoicemail:](v8, "setVoicemail:", [v4 isVoicemail]);
  uint64_t v14 = [v4 callerNameFromNetwork];
  [(CSDMessagingRelayMessage *)v8 setCallerNameFromNetwork:v14];

  -[CSDMessagingRelayMessage setNeedsManualInCallSounds:](v8, "setNeedsManualInCallSounds:", [v4 needsManualInCallSounds]);
  -[CSDMessagingRelayMessage setSoundRegion:](v8, "setSoundRegion:", [v4 soundRegion]);
  -[CSDMessagingRelayMessage setEmergency:](v8, "setEmergency:", [v4 isEmergency]);
  -[CSDMessagingRelayMessage setFailureExpected:](v8, "setFailureExpected:", [v4 isFailureExpected]);
  -[CSDMessagingRelayMessage setSupportsEmergencyFallback:](v8, "setSupportsEmergencyFallback:", [v4 supportsEmergencyFallback]);
  -[CSDMessagingRelayMessage setSOS:](v8, "setSOS:", [v4 isSOS]);
  -[CSDMessagingRelayMessage setSupportsDTMFUpdates:](v8, "setSupportsDTMFUpdates:", [v4 supportsDTMFUpdates]);
  uint64_t v15 = [v4 displayContext];
  [(CSDMessagingRelayMessage *)v8 setDisplayContext:v15];

  uint64_t v16 = [v4 localSenderIdentityUUID];
  [(CSDMessagingRelayMessage *)v8 setLocalSenderIdentityUUID:v16];

  long long v17 = [v4 localSenderIdentityAccountUUID];
  [(CSDMessagingRelayMessage *)v8 setLocalSenderIdentityAccountUUID:v17];

  -[CSDMessagingRelayMessage setRemoteUplinkMuted:](v8, "setRemoteUplinkMuted:", [v4 isRemoteUplinkMuted]);
  long long v18 = [v4 remoteParticipantHandles];
  [(CSDMessagingRelayMessage *)v8 setRemoteParticipantTUHandles:v18];

  -[CSDMessagingRelayMessage setTtyType:](v8, "setTtyType:", [v4 ttyType]);
  -[CSDMessagingRelayMessage setSupportsTTYWithVoice:](v8, "setSupportsTTYWithVoice:", [v4 supportsTTYWithVoice]);
  -[CSDMessagingRelayMessage setOriginatingUIType:](v8, "setOriginatingUIType:", [v4 originatingUIType]);
  if ([v4 isConversation])
  {
    id v19 = [v4 callGroupUUID];
    int v20 = [v19 UUIDString];
    if (v20)
    {
      id v21 = [v4 callGroupUUID];
      id v22 = [v21 UUIDString];
      [(CSDMessagingRelayMessage *)v8 setGroupUUIDString:v22];
    }
    else
    {
      [(CSDMessagingRelayMessage *)v8 setGroupUUIDString:@"No GroupUUID populated, but is conversation"];
    }
  }
  uint64_t v23 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v24 = [v4 uniqueProxyIdentifier];
  [v23 sendMessage:v8 forIdentifier:v24 customizedForRemoteProtocolVersion:&stru_1005063A8 completionHandler:0];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice:1])
  {
    v25 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v25 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendCallAnsweredElsewhereMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendCallAnsweredElsewhereMessageToClientForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:5 uniqueProxyIdentifier:v7];

  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendCallDisconnectedMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendCallDisconnectedMessageToClientForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:6 uniqueProxyIdentifier:v7];

  -[CSDMessagingRelayMessage setDisconnectedReason:](v8, "setDisconnectedReason:", [v4 disconnectedReason]);
  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v10];

  id v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v11 sendMessage:v8 wantsAcknowledgement:1 completionHandler:0];
}

- (void)sendCallConnectedMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendCallConnectedMessageToClientForCall: %@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:8 uniqueProxyIdentifier:v7];

  id v9 = [v4 model];
  [(CSDMessagingRelayMessage *)v8 setCallModel:v9];

  uint64_t v10 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v10 sendMessage:v8 completionHandler:0];

  if (([v4 isEndpointOnCurrentDevice] & 1) == 0
    && [v4 isOutgoing])
  {
    id v11 = [(CSDRelayMessagingController *)self sessionMessenger];
    int v12 = [v4 uniqueProxyIdentifier];
    [v11 sendMessage:v8 forIdentifier:v12];
  }
}

- (void)sendResetWantsHoldMusicMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendResetWantsHoldMusicMessageToClientForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:15 uniqueProxyIdentifier:v7];

  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendUpdateCallDisplayContextMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateCallDisplayContextMessageToClientForCall: %@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:37 uniqueProxyIdentifier:v7];

  id v9 = [v4 displayContext];
  [(CSDMessagingRelayMessage *)v8 setDisplayContext:v9];

  uint64_t v10 = [v4 handle];
  [(CSDMessagingRelayMessage *)v8 setTuHandle:v10];

  id v11 = [(CSDRelayMessagingController *)self sessionMessenger];
  int v12 = [v4 uniqueProxyIdentifier];
  [v11 sendMessage:v8 forIdentifier:v12];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v13 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v13 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendUpdateFailureExpectedMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateFailureExpectedMessageToClientForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:47 uniqueProxyIdentifier:v7];

  -[CSDMessagingRelayMessage setFailureExpected:](v8, "setFailureExpected:", [v4 isFailureExpected]);
  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendUpdateSupportsEmergencyFallbackToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateSupportsEmergencyFallbackToClientForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:48 uniqueProxyIdentifier:v7];

  -[CSDMessagingRelayMessage setSupportsEmergencyFallback:](v8, "setSupportsEmergencyFallback:", [v4 supportsEmergencyFallback]);
  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendUpdateRemoteUplinkMutedCallMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateRemoteUplinkMutedCallMessageToClientForCall: %@", (uint8_t *)&v17, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:39 uniqueProxyIdentifier:v7];

  -[CSDMessagingRelayMessage setRemoteUplinkMuted:](v8, "setRemoteUplinkMuted:", [v4 isRemoteUplinkMuted]);
  id v9 = [v4 provider];
  unsigned int v10 = [v9 isTinCanProvider];

  if (v10)
  {
    id v11 = +[CSDRelayConferenceInterface sharedInstance];
    int v12 = [(CSDMessagingRelayMessage *)v8 data];
    id v13 = [v4 uniqueProxyIdentifier];
    [v11 sendData:v12 throughConferenceForIdentifier:v13];
  }
  int v14 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v15 = [v4 uniqueProxyIdentifier];
  [v14 sendMessage:v8 forIdentifier:v15];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    uint64_t v16 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v16 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateSupportsTTYWithVoiceCallMessageToClientForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:41 uniqueProxyIdentifier:v7];

  -[CSDMessagingRelayMessage setSupportsTTYWithVoice:](v8, "setSupportsTTYWithVoice:", [v4 supportsTTYWithVoice]);
  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  unsigned int v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendUpdateCallModelMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateCallModelMessageToClientForCall: %@", (uint8_t *)&v13, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:17 uniqueProxyIdentifier:v7];

  id v9 = [v4 model];
  [(CSDMessagingRelayMessage *)v8 setCallModel:v9];

  unsigned int v10 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v11 = [v4 uniqueProxyIdentifier];
  [v10 sendMessage:v8 forIdentifier:v11];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    int v12 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v12 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendDeviceUnavailableMessageToClientForUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendDeviceUnavailableMessageToClient", v8, 2u);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:18];
  [(CSDMessagingRelayMessage *)v6 setDisconnectedReason:10];
  id v7 = [(CSDRelayMessagingController *)self sessionMessenger];
  [v7 sendMessage:v6 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v4];
}

- (void)sendPullRelayingCallsMessageToClientAndDisconnectCallsWithUPI:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendPullRelayingCallsMessageToClient", v9, 2u);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:10];
  id v7 = [v4 mutableCopy];

  [(CSDMessagingRelayMessage *)v6 setOtherUniqueProxyIdentifiers:v7];
  id v8 = [(CSDRelayMessagingController *)self sessionMessenger];
  [v8 sendMessage:v6 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
}

- (void)sendResetStateMessageToClient
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendResetStateMessageToClient", buf, 2u);
  }

  id v4 = [[CSDMessagingRelayMessage alloc] initWithType:23];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(CSDRelayMessagingController *)self callCenter];
  id v6 = [v5 currentAudioAndVideoCalls];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      unsigned int v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CSDMessagingRelayMessage *)v4 addCall:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
        unsigned int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  id v11 = [(CSDRelayMessagingController *)self sessionMessenger];
  [v11 sendMessage:v4 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    int v12 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v12 sendMessage:v4 wantsAcknowledgement:1 completionHandler:0];
  }
}

- (void)sendHardPauseAvailabilityMessageToClientForState:(int)a3 digits:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendHardPauseAvailabilityMessageToClientForState %d digits: %@", (uint8_t *)v10, 0x12u);
  }

  id v8 = [[CSDMessagingRelayMessage alloc] initWithType:24];
  [(CSDMessagingRelayMessage *)v8 setHardPauseDigitsState:v4];
  [(CSDMessagingRelayMessage *)v8 setHardPauseDigits:v6];
  uint64_t v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  [v9 sendMessage:v8 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
}

- (void)sendUpdateRemoteCallStateMessageToClient
{
}

- (void)sendUpdateRemoteCallStateMessageToClient:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateRemoteCallStateMessageToClient force=%@", buf, 0xCu);
  }

  id v7 = [[CSDMessagingRelayMessage alloc] initWithType:26];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [(CSDRelayMessagingController *)self callCenter];
  uint64_t v9 = [v8 currentAudioAndVideoCalls];

  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v10)
  {

LABEL_15:
    long long v16 = [(CSDRelayMessagingController *)self sessionMessenger];
    [v16 sendMessage:v7 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];

    goto LABEL_16;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v19;
  int v13 = 1;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      [(CSDMessagingRelayMessage *)v7 addCall:v15];
      v13 &= [v15 isConnected];
    }
    id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v11);

  if (v13) {
    goto LABEL_15;
  }
LABEL_16:
  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice:v3])
  {
    int v17 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v17 sendMessage:v7 completionHandler:0];
  }
}

- (void)sendCallStartedConnectingMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendCallStartedConnectingMessageToClientForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  CFStringRef v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:29 uniqueProxyIdentifier:v7];

  uint64_t v9 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v9 sendMessage:v8 completionHandler:0];

  if (([v4 isEndpointOnCurrentDevice] & 1) == 0
    && [v4 isOutgoing])
  {
    id v10 = [(CSDRelayMessagingController *)self sessionMessenger];
    id v11 = [v4 uniqueProxyIdentifier];
    [v10 sendMessage:v8 forIdentifier:v11];
  }
}

- (void)sendDialCallFailedForUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendDialCallFailedForUniqueProxyIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDRelayMessagingController *)self sendDialCallFailedForUniqueProxyIdentifier:v4 withDisconnectedReason:14];
}

- (void)sendDialCallFailedForScreenTimeForUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendDialCallFailedForScreenTimeForUniqueProxyIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDRelayMessagingController *)self sendDialCallFailedForUniqueProxyIdentifier:v4 withDisconnectedReason:25];
}

- (void)sendDialCallFailedForUniqueProxyIdentifier:(id)a3 withDisconnectedReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v9 = [[CSDMessagingRelayMessage alloc] initWithType:2];
  [(CSDMessagingRelayMessage *)v9 setUniqueProxyIdentifier:v6];
  [(CSDMessagingRelayMessage *)v9 setDisconnectedReason:v4];
  id v7 = [(CSDRelayMessagingController *)self sessionMessenger];
  [v7 sendMessage:v9 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v6];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v8 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v8 sendMessage:v9 completionHandler:0];
  }
}

- (void)sendPushCallsMessageToClientDestination:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendPushCallsMessageToClientDestination: %@", buf, 0xCu);
  }

  id v35 = [[CSDMessagingRelayMessage alloc] initWithType:30];
  id v6 = [(CSDRelayMessagingController *)self callCenter];
  id v7 = [v6 _allCalls];

  long long v38 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  uint64_t v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  uint64_t v9 = +[CSDRelayIDSService sharedInstance];
  id v10 = [v4 deviceForService:v9];

  uint64_t v34 = self;
  long long v37 = (void *)v8;
  if (v10)
  {
    id v11 = +[CSDRelayIDSService sharedInstance];
    int v12 = [v11 pairedDevice];
    unsigned int v33 = [v12 isEqual:v10];
  }
  else
  {
    unsigned int v33 = 0;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v7;
  id v13 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (!v13)
  {
    char v36 = 0;
    goto LABEL_36;
  }
  id v14 = v13;
  char v36 = 0;
  uint64_t v15 = *(void *)v51;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v51 != v15) {
        objc_enumerationMutation(obj);
      }
      int v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      if (v10)
      {
        long long v18 = [*(id *)(*((void *)&v50 + 1) + 8 * i) provider];
        unsigned int v19 = [v10 canReceiveMessagesForCallProvider:v18];

        if (v19)
        {
          long long v20 = sub_100008DCC();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v56 = v17;
            __int16 v57 = 2112;
            id v58 = v4;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Allowing call: %@ to be pushed to destination: %@", buf, 0x16u);
          }
LABEL_21:

          unsigned int v19 = 1;
        }
      }
      else
      {
        if ([v4 isGuest]
          && ([v17 needsConversationOrVideoRelaySupport] & 1) == 0)
        {
          long long v20 = sub_100008DCC();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v56 = v17;
            __int16 v57 = 2112;
            id v58 = v4;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Allowing call: %@ to be pushed to destination: %@", buf, 0x16u);
          }
          char v36 = 1;
          goto LABEL_21;
        }
        unsigned int v19 = 0;
      }
      if (([v10 canReceiveRelayedGFTCalls] & 1) != 0
        || ![v17 needsConversationOrVideoRelaySupport])
      {
        if (v19)
        {
          id v22 = [v17 uniqueProxyIdentifier];
          [v38 addObject:v22];

          [v37 addObject:v17];
          continue;
        }
      }
      else
      {
        long long v21 = sub_100008DCC();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v56 = v17;
          __int16 v57 = 2112;
          id v58 = v4;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not allowing call: %@ to be pushed to destination: %@ because the call requires conversation or video relay support", buf, 0x16u);
        }
      }
      uint64_t v23 = sub_100008DCC();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v56 = v17;
        __int16 v57 = 2112;
        id v58 = v4;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Skipping call: %@ to track for pushing to destination: %@", buf, 0x16u);
      }
    }
    id v14 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
  }
  while (v14);
LABEL_36:

  if ([v38 count])
  {
    CFStringRef v24 = v37;
    if (v36)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v25 = v37;
      id v26 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v47;
        do
        {
          for (j = 0; j != v27; j = (char *)j + 1)
          {
            if (*(void *)v47 != v28) {
              objc_enumerationMutation(v25);
            }
            [(CSDRelayMessagingController *)v34 sendCallAnsweredElsewhereMessageToClientForCall:*(void *)(*((void *)&v46 + 1) + 8 * (void)j)];
          }
          id v27 = [v25 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v27);
      }
    }
    v30 = [(CSDRelayMessagingController *)v34 hostMessagingDelegate];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100094794;
    v40[3] = &unk_1005063D0;
    long long v41 = v37;
    v31 = v35;
    long long v42 = v35;
    long long v43 = v34;
    id v44 = v38;
    id v45 = v4;
    [v30 pushHostedCallsForRemoteInviteDictionary:0 destination:v45 toPairedDevice:v33 completion:v40];

    v32 = v41;
  }
  else
  {
    v32 = sub_100008DCC();
    v31 = v35;
    CFStringRef v24 = v37;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Found no calls to send sendPushCallsMessageToClientDestination", buf, 2u);
    }
  }
}

- (void)sendUpdateCallContextMessageToClientForCallProviderManager:(id)a3
{
  id v4 = a3;
  v5 = [[CSDMessagingRelayMessage alloc] initWithType:33];
  id v6 = +[CSDCallCapabilities sharedInstance];
  id v7 = [v6 callCapabilitiesState];
  [(CSDMessagingRelayMessage *)v5 setCallCapabilitiesState:v7];

  uint64_t v8 = [v4 providersByIdentifierForRemoteClients:0];

  uint64_t v9 = [v8 allValues];
  [(CSDMessagingRelayMessage *)v5 setTuProviders:v9];

  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) Sending UpdateCallContext message: %@", (uint8_t *)&v12, 0xCu);
  }

  id v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v11 sendMessage:v5 completionHandler:0];
}

- (void)sendNeedsManualInCallSoundsChangeMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendNeedsManualInCallSoundsChangeMessageToClientForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  uint64_t v8 = [(CSDMessagingRelayMessage *)v6 initWithType:34 uniqueProxyIdentifier:v7];

  -[CSDMessagingRelayMessage setNeedsManualInCallSounds:](v8, "setNeedsManualInCallSounds:", [v4 needsManualInCallSounds]);
  -[CSDMessagingRelayMessage setSoundRegion:](v8, "setSoundRegion:", [v4 soundRegion]);
  uint64_t v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendInvitationSentMessageToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendInvitationSentMessageToClientForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  uint64_t v8 = [(CSDMessagingRelayMessage *)v6 initWithType:35 uniqueProxyIdentifier:v7];

  uint64_t v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendUpdateRoutesMessageToClientForRoutes:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateRoutesMessageToClientForRoutes: %@", buf, 0xCu);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:44];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
        id v13 = [CSDMessagingRoute alloc];
        id v14 = -[CSDMessagingRoute initWithTURoute:](v13, "initWithTURoute:", v12, (void)v16);
        [(CSDMessagingRelayMessage *)v6 addRoutes:v14];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v15 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v15 sendMessage:v6 completionHandler:0];
}

- (void)sendUpdateSupportsDTMFUpdatesToClientForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateSupportsDTMFUpdatesToClientForCall: %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:55 uniqueProxyIdentifier:v7];

  -[CSDMessagingRelayMessage setSupportsDTMFUpdates:](v8, "setSupportsDTMFUpdates:", [v4 supportsDTMFUpdates]);
  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];
}

- (void)sendReceivedDTMFUpdateForCall:(id)a3 dtmfUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendReceivedDTMFUpdateForCall: %@ dtmfUpdate: %@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = [CSDMessagingRelayMessage alloc];
  uint64_t v10 = [v6 uniqueProxyIdentifier];
  int v11 = [(CSDMessagingRelayMessage *)v9 initWithType:56 uniqueProxyIdentifier:v10];

  id v12 = [v7 digits];
  [(CSDMessagingRelayMessage *)v11 setDtmfUpdateDigits:v12];

  id v13 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v14 = [v6 uniqueProxyIdentifier];
  [v13 sendMessage:v11 forIdentifier:v14];
}

- (void)sendDialCallMessageToHostForCall:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendDialCallMessageToHostForCall: %@", buf, 0xCu);
  }

  id v9 = [v6 dialRequest];
  uint64_t v10 = [v9 hostIDSIdentifier];
  [(CSDRelayMessagingController *)self _updateDialingIDSDeviceWithHostIDSIdentifier:v10];

  int v11 = [(CSDRelayMessagingController *)self dialingIDSDestination];

  if (!v11)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No dialing IDS device found. If we aren't already in a session, this dial call attempt will fail.", buf, 2u);
    }
  }
  id v13 = +[CSDRelayConferenceInterface sharedInstance];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000953B4;
  v16[3] = &unk_1005063F8;
  id v17 = v6;
  id v18 = self;
  id v19 = v7;
  id v14 = v7;
  id v15 = v6;
  [v13 prepareConferenceForCall:v15 remoteInviteDictionary:0 completion:v16];
}

- (void)sendJoinConversationMessageToHostForCall:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendJoinConversationMessageToHostForCall: %@", buf, 0xCu);
  }

  id v9 = [v6 dialRequest];
  uint64_t v10 = [v9 hostIDSIdentifier];
  [(CSDRelayMessagingController *)self _updateDialingIDSDeviceWithHostIDSIdentifier:v10];

  int v11 = [(CSDRelayMessagingController *)self dialingIDSDestination];

  if (!v11)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No dialing IDS device found. If we aren't already in a session, this join conversation request will fail.", buf, 2u);
    }
  }
  id v13 = +[CSDRelayConferenceInterface sharedInstance];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100095970;
  v16[3] = &unk_1005063F8;
  id v17 = v6;
  id v18 = self;
  id v19 = v7;
  id v14 = v7;
  id v15 = v6;
  [v13 prepareConferenceForCall:v15 remoteInviteDictionary:0 completion:v16];
}

- (void)sendAnswerCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendAnswerCallMessageToHostForCall: %@", buf, 0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100095DF8;
  v16[3] = &unk_100506368;
  id v6 = v4;
  id v17 = v6;
  id v7 = objc_retainBlock(v16);
  if ([v6 isEndpointOnCurrentDevice])
  {
    id v8 = +[CSDRelayConferenceInterface sharedInstance];
    id v9 = [v6 remoteInviteDictionary];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100095EDC;
    v13[3] = &unk_100506420;
    id v15 = v7;
    v13[4] = self;
    id v14 = v6;
    [v8 prepareConferenceForCall:v14 remoteInviteDictionary:v9 completion:v13];

    uint64_t v10 = v15;
  }
  else
  {
    uint64_t v10 = ((void (*)(void *))v7[2])(v7);
    int v11 = [(CSDRelayMessagingController *)self sessionMessenger];
    id v12 = [v6 uniqueProxyIdentifier];
    [v11 sendMessage:v10 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v12];
  }
}

- (void)sendDisconnectCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendDisconnectCallMessageToHostForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:9 uniqueProxyIdentifier:v7];

  -[CSDMessagingRelayMessage setDisconnectedReason:](v8, "setDisconnectedReason:", [v4 disconnectedReason]);
  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    int v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendHoldCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendHoldCallMessageToHostForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:11 uniqueProxyIdentifier:v7];

  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    int v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendUnholdCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendUnholdCallMessageToHostForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:12 uniqueProxyIdentifier:v7];

  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    int v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendGroupCallMessageToHostForCall:(id)a3 otherCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendGroupCallMessageToHostForCall: %@ otherCall: %@", (uint8_t *)&v16, 0x16u);
  }

  id v9 = [CSDMessagingRelayMessage alloc];
  uint64_t v10 = [v6 uniqueProxyIdentifier];
  int v11 = [(CSDMessagingRelayMessage *)v9 initWithType:13 uniqueProxyIdentifier:v10];

  int v12 = [v7 uniqueProxyIdentifier];
  [(CSDMessagingRelayMessage *)v11 addOtherUniqueProxyIdentifiers:v12];

  id v13 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v14 = [v6 uniqueProxyIdentifier];
  [v13 sendMessage:v11 forIdentifier:v14];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v15 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v15 sendMessage:v11 completionHandler:0];
  }
}

- (void)sendUngroupCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendUngroupCallMessageToHostForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  id v8 = [(CSDMessagingRelayMessage *)v6 initWithType:14 uniqueProxyIdentifier:v7];

  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  uint64_t v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    int v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendSwapCallsMessageToHost
{
  BOOL v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendSwapCallsMessageToHost", v7, 2u);
  }

  id v4 = [[CSDMessagingRelayMessage alloc] initWithType:16];
  v5 = [(CSDRelayMessagingController *)self sessionMessenger];
  [v5 sendMessage:v4 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v6 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v6 sendMessage:v4 completionHandler:0];
  }
}

- (void)sendEndActiveAndAnswerCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendEndActiveAndAnswerCallMessageToHostForCall: %@", buf, 0xCu);
  }

  id v6 = +[CSDRelayConferenceInterface sharedInstance];
  id v7 = [v4 remoteInviteDictionary];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100096944;
  v9[3] = &unk_100506448;
  id v10 = v4;
  int v11 = self;
  id v8 = v4;
  [v6 prepareConferenceForCall:v8 remoteInviteDictionary:v7 completion:v9];
}

- (void)sendEndHeldAndAnswerCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendEndHeldAndAnswerCallMessageToHostForCall: %@", buf, 0xCu);
  }

  id v6 = +[CSDRelayConferenceInterface sharedInstance];
  id v7 = [v4 remoteInviteDictionary];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100096BE8;
  v9[3] = &unk_100506448;
  id v10 = v4;
  int v11 = self;
  id v8 = v4;
  [v6 prepareConferenceForCall:v8 remoteInviteDictionary:v7 completion:v9];
}

- (void)sendHoldActiveAndAnswerCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendHoldActiveAndAnswerCallMessageToHostForCall: %@", buf, 0xCu);
  }

  id v6 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v7 = [v4 uniqueProxyIdentifier];
  int v8 = [v6 sessionProtocolVersionForIdentifier:v7];

  if (v8 <= 2)
  {
    id v9 = [(CSDRelayMessagingController *)self callCenter];
    id v10 = [v9 callWithStatus:1];

    if (v10)
    {
      int v11 = [v10 provider];
      if ([v11 isFaceTimeProvider])
      {

LABEL_9:
        [(CSDRelayMessagingController *)self sendHoldCallMessageToHostForCall:v10];
        goto LABEL_10;
      }
      id v14 = [v4 provider];
      unsigned int v15 = [v14 isFaceTimeProvider];

      if (v15) {
        goto LABEL_9;
      }
    }
LABEL_10:
    [(CSDRelayMessagingController *)self sendAnswerCallMessageToHostForCall:v4];
    goto LABEL_11;
  }
  int v12 = +[CSDRelayConferenceInterface sharedInstance];
  id v13 = [v4 remoteInviteDictionary];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100096F58;
  v16[3] = &unk_100506448;
  id v17 = v4;
  __int16 v18 = self;
  [v12 prepareConferenceForCall:v17 remoteInviteDictionary:v13 completion:v16];

  id v10 = v17;
LABEL_11:
}

- (void)sendDisconnectCurrentCallAndActivateHeldMessageToHostForDisconnectedCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendDisconnectCurrentCallAndActivateHeldToHost", v11, 2u);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:21];
  id v7 = [v4 uniqueProxyIdentifier];
  [(CSDMessagingRelayMessage *)v6 setUniqueProxyIdentifier:v7];

  int v8 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v9 = [v4 uniqueProxyIdentifier];

  [v8 sendMessage:v6 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v9];
  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v10 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v10 sendMessage:v6 completionHandler:0];
  }
}

- (void)sendDisconnectAllCallsMessageToHostForDisconnectedCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendDisconnectAllCallsToHost", v11, 2u);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:22];
  id v7 = [v4 uniqueProxyIdentifier];
  [(CSDMessagingRelayMessage *)v6 setUniqueProxyIdentifier:v7];

  int v8 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v9 = [v4 uniqueProxyIdentifier];

  [v8 sendMessage:v6 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v9];
  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v10 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v10 sendMessage:v6 completionHandler:0];
  }
}

- (void)sendSendHardPauseDigitsMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendSendHardPauseDigitsMessageToHost", v10, 2u);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:25];
  id v7 = [v4 uniqueProxyIdentifier];
  [(CSDMessagingRelayMessage *)v6 setUniqueProxyIdentifier:v7];

  int v8 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v9 = [v4 uniqueProxyIdentifier];

  [v8 sendMessage:v6 forIdentifier:v9];
}

- (void)sendRequestCallStateMessageToHost
{
  BOOL v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendRequestCallStateMessageToHost", v6, 2u);
  }

  id v4 = [[CSDMessagingRelayMessage alloc] initWithType:28];
  v5 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v5 sendMessage:v4 timeout:1 wantsAcknowledgement:3 maximumRetryAttempts:0 completionHandler:300.0];
}

- (void)sendPullCallsMessageToHost
{
  BOOL v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendPullCallsMessageToHost", buf, 2u);
  }

  id v4 = [[CSDMessagingRelayMessage alloc] initWithType:31];
  v5 = [(CSDRelayMessagingController *)self callCenter];
  id v6 = [v5 _allCalls];

  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v14 = [v13 uniqueProxyIdentifier];
        [v7 addObject:v14];

        [(CSDMessagingRelayMessage *)v4 addCall:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  unsigned int v15 = [(CSDRelayMessagingController *)self clientMessagingDelegate];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100097708;
  v18[3] = &unk_100506470;
  id v19 = v4;
  id v20 = self;
  id v21 = v7;
  id v16 = v7;
  id v17 = v4;
  [v15 pullRemotelyHostedCallsForMessage:v17 completion:v18];
}

- (void)sendPushRelayingCallsMessageToHostForSourceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client->Host) sendPushRelayingCallsMessageToHostForSourceIdentifier: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:32];
  [(CSDMessagingRelayMessage *)v6 setSourceIdentifier:v4];
  id v7 = [(CSDRelayMessagingController *)self sessionMessenger];
  [v7 sendMessage:v6 forIdentifier:0 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
}

- (void)sendUpdateRemoteUplinkMutedCallMessageToHostForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendUpdateRemoteUplinkMutedCallMessageToHostForCall: %@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  int v8 = [(CSDMessagingRelayMessage *)v6 initWithType:39 uniqueProxyIdentifier:v7];

  -[CSDMessagingRelayMessage setRemoteUplinkMuted:](v8, "setRemoteUplinkMuted:", [v4 isRemoteUplinkMuted]);
  id v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v10 = [v4 uniqueProxyIdentifier];
  [v9 sendMessage:v8 forIdentifier:v10];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    uint64_t v11 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v11 sendMessage:v8 completionHandler:0];
  }
}

- (void)sendPickRouteMessageToHostForRoute:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Host->Client) sendPickRouteMessageToHostForRoute: %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:45];
  id v7 = [[CSDMessagingRoute alloc] initWithTURoute:v4];
  [(CSDMessagingRelayMessage *)v6 setRoute:v7];

  int v8 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
  [v8 sendMessage:v6 completionHandler:0];
}

- (void)sendPlayDTMFToneForKeyMessageForCall:(id)a3 DTMFKey:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [CSDMessagingRelayMessage alloc];
  int v8 = [v6 uniqueProxyIdentifier];
  uint64_t v11 = [(CSDMessagingRelayMessage *)v7 initWithType:7 uniqueProxyIdentifier:v8];

  [(CSDMessagingRelayMessage *)v11 setDTMFKey:v4];
  int v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v10 = [v6 uniqueProxyIdentifier];

  [v9 sendMessage:v11 forIdentifier:v10];
}

- (void)sendSetTTYTypeCallMessageForCall:(id)a3 ttyType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 1024;
    int v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client<->Host) sendSetTTYTypeCallMessageForCall: %@ ttyType: %d", (uint8_t *)&v14, 0x12u);
  }

  int v8 = [CSDMessagingRelayMessage alloc];
  int v9 = [v6 uniqueProxyIdentifier];
  id v10 = [(CSDMessagingRelayMessage *)v8 initWithType:42 uniqueProxyIdentifier:v9];

  [(CSDMessagingRelayMessage *)v10 setTtyType:v4];
  uint64_t v11 = [(CSDRelayMessagingController *)self sessionMessenger];
  int v12 = [v6 uniqueProxyIdentifier];
  [v11 sendMessage:v10 forIdentifier:v12];

  if ([(CSDRelayMessagingController *)self _shouldSendToPairedIDSDevice])
  {
    id v13 = [(CSDRelayMessagingController *)self pairedDeviceMessenger];
    [v13 sendMessage:v10 completionHandler:0];
  }
}

- (void)sendSetUplinkMutedCallMessageForCall:(id)a3 uplinkMuted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client<->Host) sendSetUplinkMutedCallMessageForCall: %@ uplinkMuted: %d", (uint8_t *)&v17, 0x12u);
  }

  int v8 = [CSDMessagingRelayMessage alloc];
  int v9 = [v6 uniqueProxyIdentifier];
  id v10 = [(CSDMessagingRelayMessage *)v8 initWithType:38 uniqueProxyIdentifier:v9];

  [(CSDMessagingRelayMessage *)v10 setUplinkMuted:v4];
  uint64_t v11 = [v6 provider];
  LODWORD(v9) = [v11 isTinCanProvider];

  if (v9)
  {
    int v12 = +[CSDRelayConferenceInterface sharedInstance];
    id v13 = [(CSDMessagingRelayMessage *)v10 data];
    int v14 = [v6 uniqueProxyIdentifier];
    [v12 sendData:v13 throughConferenceForIdentifier:v14];
  }
  id v15 = [(CSDRelayMessagingController *)self sessionMessenger];
  __int16 v16 = [v6 uniqueProxyIdentifier];
  [v15 sendMessage:v10 forIdentifier:v16];
}

- (void)sendSuppressRingtoneMessageForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client<->Host) sendSuppressRingtoneMessageForCall", v11, 2u);
  }

  id v6 = [CSDMessagingRelayMessage alloc];
  id v7 = [v4 uniqueProxyIdentifier];
  int v8 = [(CSDMessagingRelayMessage *)v6 initWithType:27 uniqueProxyIdentifier:v7];

  int v9 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v10 = [v4 uniqueProxyIdentifier];

  [v9 sendMessage:v8 forIdentifier:v10 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
}

- (void)sendUpdateSystemVolumeForCall:(id)a3 volume:(float)a4
{
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client<->Host) sendUpdateSystemVolumeForCall: %@", (uint8_t *)&v14, 0xCu);
  }

  int v8 = [CSDMessagingRelayMessage alloc];
  int v9 = [v6 uniqueProxyIdentifier];
  id v10 = [(CSDMessagingRelayMessage *)v8 initWithType:40 uniqueProxyIdentifier:v9];

  *(float *)&double v11 = a4;
  [(CSDMessagingRelayMessage *)v10 setSystemVolume:v11];
  int v12 = [(CSDRelayMessagingController *)self sessionMessenger];
  id v13 = [v6 uniqueProxyIdentifier];
  [v12 sendMessage:v10 forIdentifier:v13];
}

- (void)sendBuzzMember:(id)a3 toConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 UUID];
    int v20 = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    long long v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client<->Host) sendBuzzMember: %@ toConversationWithUUID: %@", (uint8_t *)&v20, 0x16u);
  }
  id v10 = [[CSDMessagingRelayMessage alloc] initWithType:51];
  double v11 = +[CSDMessagingConversationMember memberWithTUConversationMember:v6];
  int v12 = +[NSMutableArray arrayWithObject:v11];
  [(CSDMessagingRelayMessage *)v10 setConversationMembers:v12];

  id v13 = [v7 UUID];
  int v14 = [v13 UUIDString];
  [(CSDMessagingRelayMessage *)v10 setConversationUUIDString:v14];

  id v15 = [(CSDRelayMessagingController *)self callCenter];
  __int16 v16 = [v7 groupUUID];
  int v17 = [v15 callForConversationWithGroupUUID:v16];

  if (v17)
  {
    id v18 = [(CSDRelayMessagingController *)self sessionMessenger];
    __int16 v19 = [v17 uniqueProxyIdentifier];
    [v18 sendMessage:v10 forIdentifier:v19];
  }
  else
  {
    id v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1003A9258(v7);
    }
  }
}

- (void)sendAddRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v10 UUID];
    int v21 = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(IDSMessaging Client<->Host) sendAddRemoteMembers: %@ otherInvitedHandles: %@ toConversationWithUUID: %@", (uint8_t *)&v21, 0x20u);
  }
  id v13 = [CSDMessagingRelayMessage alloc];
  int v14 = [v10 UUID];
  id v15 = [(CSDMessagingRelayMessage *)v13 initAddRemoteMemberMessageWithMembers:v8 otherInvitedHandles:v9 conversationWithUUID:v14];

  __int16 v16 = [(CSDRelayMessagingController *)self callCenter];
  int v17 = [v10 groupUUID];
  id v18 = [v16 callForConversationWithGroupUUID:v17];

  if (v18)
  {
    __int16 v19 = [(CSDRelayMessagingController *)self sessionMessenger];
    int v20 = [v18 uniqueProxyIdentifier];
    [v19 sendMessage:v15 forIdentifier:v20];
  }
  else
  {
    __int16 v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1003A92E0(v10);
    }
  }
}

- (void)requestAnswerForRequest:(id)a3 forCall:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = (char *)[v18 behavior];
  if ((unint64_t)(v7 - 1) > 3) {
    uint64_t v8 = 19;
  }
  else {
    uint64_t v8 = dword_10048D960[(void)(v7 - 1)];
  }
  id v9 = [CSDMessagingRelayMessage alloc];
  id v10 = [v6 uniqueProxyIdentifier];
  double v11 = [(CSDMessagingRelayMessage *)v9 initWithType:43 uniqueProxyIdentifier:v10];

  [(CSDMessagingRelayMessage *)v11 setRequestActionType:v8];
  int v12 = [v18 sourceIdentifier];
  [(CSDMessagingRelayMessage *)v11 setSourceIdentifier:v12];

  if ([v6 isHostedOnCurrentDevice])
  {
    id v13 = [(CSDRelayMessagingController *)self sessionMessenger];
    int v14 = [v6 uniqueProxyIdentifier];
    id v15 = [v18 endpointIDSDestination];
    __int16 v16 = +[NSSet setWithObject:v15];
    [v13 sendMessage:v11 forIdentifier:v14 toDestinations:v16];
  }
  else
  {
    int v17 = [v18 endpointIDSDestination];
    [(CSDMessagingRelayMessage *)v11 setEndpointIDSDestination:v17];

    id v13 = [(CSDRelayMessagingController *)self sessionMessenger];
    int v14 = [v6 uniqueProxyIdentifier];
    [v13 sendMessage:v11 forIdentifier:v14 customizedForRemoteProtocolVersion:0 waitUntilConnected:0 completionHandler:0];
  }
}

- (void)messenger:(id)a3 handledMessage:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (([v10 canReceiveRelayedCalls] & 1) != 0
    || [v11 canReceiveRelayedCalls])
  {
    if (-[CSDRelayMessagingController shouldProcessRelayMessageOfType:](self, "shouldProcessRelayMessageOfType:", [v9 type]))
    {
      if (v11 || ([v10 isGuest] & 1) != 0)
      {
        int v12 = sub_100008DCC();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v9 typeString];
          *(_DWORD *)buf = 138412546;
          id v47 = v13;
          __int16 v48 = 2112;
          id v49 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Handle incoming %@ message: %@", buf, 0x16u);
        }
        if (v11)
        {
          int v14 = +[CSDRelayIDSService sharedInstance];
          id v15 = [v14 pairedDevice];
          id v16 = [v15 isEqual:v11];
        }
        else
        {
          id v16 = 0;
        }
        uint64_t v28 = +[CSDReportingController sharedInstance];
        [v28 reportRelayMessageReceived:v9 fromPairedDevice:v16];

        int v17 = [(CSDRelayMessagingController *)self clientMessagingDelegate];
        __int16 v19 = [(CSDRelayMessagingController *)self hostMessagingDelegate];
        id v24 = [(CSDRelayMessagingController *)self commonMessagingDelegate];
        switch([v9 type])
        {
          case 1u:
            [v17 handleIncomingCallMessageFromHost:v9 fromPairedDevice:v16];
            break;
          case 2u:
            v29 = [v9 tuProvider];
            unsigned __int8 v30 = [v11 canReceiveMessagesForCallProvider:v29];

            if ((v30 & 1) == 0)
            {
              id v35 = sub_100008DCC();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                char v36 = [v9 tuProvider];
                *(_DWORD *)buf = 138412802;
                id v47 = v11;
                __int16 v48 = 2112;
                id v49 = v36;
                __int16 v50 = 2112;
                id v51 = v9;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[WARN] We determined that device: %@ cannot process messages for provider %@. Ignoring incoming message: %@", buf, 0x20u);
              }
              goto LABEL_94;
            }
            if (![(CSDRelayMessagingController *)self shouldScreenTimeRestrictMessage:v9])
            {
              v44[0] = _NSConcreteStackBlock;
              v44[1] = 3221225472;
              v44[2] = sub_100099474;
              v44[3] = &unk_100506498;
              v44[4] = self;
              id v45 = v9;
              [v19 handleDialCallMessageFromClient:v45 destination:v10 device:v11 completion:v44];
              uint64_t v34 = v45;
              goto LABEL_97;
            }
            v31 = sub_100008DCC();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              long long v37 = [v9 destinationID];
              v32 = [v9 tuProvider];
              unsigned int v33 = [v9 isEmergency];
              *(_DWORD *)buf = 138412802;
              id v47 = v37;
              __int16 v48 = 2112;
              id v49 = v32;
              __int16 v50 = 1024;
              LODWORD(v51) = v33;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[WARN] Screen Time restricted the call for dial call message with destinationID %@ and provider: %@ is emergency: (%d)", buf, 0x1Cu);
            }
            goto LABEL_84;
          case 3u:
            [v17 handleCallDialedMessageFromHost:v9 fromPairedDevice:v16];
            break;
          case 4u:
            [v19 handleAnswerCallMessageFromClient:v9 destination:v10 device:v11];
            break;
          case 5u:
            [v17 handleCallAnsweredElsewhereMessageFromHost:v9 fromPairedDevice:v16];
            break;
          case 6u:
            [v17 handleCallDisconnectedMessageFromHost:v9];
            break;
          case 7u:
            [v24 handlePlayDTMFToneForKeyMessage:v9];
            break;
          case 8u:
            [v17 handleCallConnectedMessageFromHost:v9];
            break;
          case 9u:
            [v19 handleDisconnectCallMessageFromClient:v9];
            break;
          case 0xAu:
            [v17 handlePullRelayingCallsMessageFromHost:v9 fromPairedDevice:v16];
            break;
          case 0xBu:
            [v19 handleHoldCallMessageFromClient:v9];
            break;
          case 0xCu:
            [v19 handleUnholdCallMessageFromClient:v9];
            break;
          case 0xDu:
            [v19 handleGroupCallMessageFromClient:v9];
            break;
          case 0xEu:
            [v19 handleUngroupCallMessageFromClient:v9];
            break;
          case 0xFu:
            [v17 handleResetWantsHoldMusicFromHost:v9];
            break;
          case 0x10u:
            [v19 handleSwapCallsMessageFromClient:v9];
            break;
          case 0x11u:
            [v17 handleUpdateCallModelMessageFromHost:v9];
            break;
          case 0x12u:
            [v17 handleDeviceUnavailableMessageFromHost:v9];
            break;
          case 0x13u:
            [v19 handleEndActiveAndAnswerMessageFromClient:v9];
            break;
          case 0x14u:
            [v19 handleEndHeldAndAnswerMessageFromClient:v9];
            break;
          case 0x15u:
            [v19 handleDisconnectCurrentCallAndActivateHeldMessageFromClient:v9];
            break;
          case 0x16u:
            [v19 handleDisconnectAllCallsMessageFromClient:v9];
            break;
          case 0x17u:
            [v17 handleResetStateMessageFromHost:v9 fromPairedDevice:v16];
            break;
          case 0x18u:
            [v17 handleHardPauseDigitsAvailabilityMessageFromHost:v9];
            break;
          case 0x19u:
            [v19 handleSendHardPauseDigitsMessageFromClient:v9];
            break;
          case 0x1Au:
            [v17 handleUpdateRemoteCallStateMessageFromHost:v9];
            break;
          case 0x1Bu:
            [v24 handleSuppressRingtoneMessage:v9];
            break;
          case 0x1Cu:
            [v19 handleRequestCallContextMessageFromClient:v9 fromDevice:v11];
            break;
          case 0x1Du:
            [v17 handleCallStartedConnectingMessageFromHost:v9];
            break;
          case 0x1Eu:
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_1000995DC;
            v40[3] = &unk_100506448;
            void v40[4] = self;
            id v41 = v9;
            [v17 handlePushHostedCallsMessageFromHost:v41 completion:v40];
            uint64_t v34 = v41;
            goto LABEL_97;
          case 0x1Fu:
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472;
            v38[2] = sub_1000995EC;
            v38[3] = &unk_100506448;
            v38[4] = self;
            id v39 = v9;
            [v19 handlePullHostedCallsMessageFromClient:v39 destination:v10 fromPairedDevice:v16 completion:v38];
            uint64_t v34 = v39;
            goto LABEL_97;
          case 0x20u:
            [v19 handlePushRelayingCallsMessageFromClient:v9];
            break;
          case 0x21u:
            [v17 handleUpdateCallContextAvailableMessageFromHost:v9];
            break;
          case 0x22u:
            [v17 handleNeedsManualInCallSoundsChangeMessageFromHost:v9];
            break;
          case 0x23u:
            [v17 handleInvitationSentMessageFromHost:v9];
            break;
          case 0x24u:
            [v19 handleHoldActiveAndAnswerMessageFromClient:v9];
            break;
          case 0x25u:
            [v17 handleUpdateCallDisplayContextMessageFromHost:v9];
            break;
          case 0x26u:
            [v24 handleSetUplinkMutedMessage:v9];
            break;
          case 0x27u:
            [v17 handleUpdateRemoteUplinkMutedMessageFromHost:v9];
            break;
          case 0x28u:
            [v24 handleUpdateSystemVolumeMessageFromHost:v9];
            break;
          case 0x29u:
            [v17 handleUpdateSupportsTTYWithVoiceMessageFromHost:v9];
            break;
          case 0x2Au:
            [v24 handleSetTTYTypeMessage:v9];
            break;
          case 0x2Bu:
            [v24 handleRequestActionMessage:v9];
            break;
          case 0x2Cu:
            [v17 handleUpdateRoutesMessageFromHost:v9];
            break;
          case 0x2Du:
            [v19 handlePickRouteMessageFromClient:v9];
            break;
          case 0x2Fu:
            [v17 handleUpdateFailureExpectedMessageFromHost:v9];
            break;
          case 0x30u:
            [v17 handleUpdateSupportsEmergencyFallbackMessageFromHost:v9];
            break;
          case 0x31u:
            goto LABEL_89;
          case 0x32u:
            if ([(CSDRelayMessagingController *)self shouldScreenTimeRestrictMessage:v9])
            {
              v31 = sub_100008DCC();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[WARN] Screen Time restricted the call for Join Conversation message", buf, 2u);
              }
LABEL_84:

              id v35 = [v9 uniqueProxyIdentifier];
              [(CSDRelayMessagingController *)self sendDialCallFailedForScreenTimeForUniqueProxyIdentifier:v35];
LABEL_94:
            }
            else
            {
              v42[0] = _NSConcreteStackBlock;
              v42[1] = 3221225472;
              v42[2] = sub_100099528;
              v42[3] = &unk_100506498;
              v42[4] = self;
              id v43 = v9;
              [v19 handleJoinConversationMessageFromClient:v43 destination:v10 device:v11 completion:v42];
              uint64_t v34 = v43;
LABEL_97:
            }
            break;
          case 0x33u:
            [v19 handleBuzzMemberMessageFromClient:v9];
            break;
          case 0x34u:
            [v19 handleAddMemberMessageFromClient:v9];
            break;
          case 0x35u:
            [v17 handleConversationProminenceMessageFromHost:v9];
            break;
          case 0x36u:
            [v17 handleUpdateConversationsMessageFromHost:v9];
LABEL_89:
            [v17 handleOngoingConversationMessageFromHost:v9];
            break;
          case 0x37u:
            [v17 handleUpdateSupportsDTMFUpdatesMessageFromHost:v9];
            break;
          case 0x38u:
            [v17 handleReceivedDTMFUpdateMessageFromHost:v9];
            break;
          default:
            break;
        }
LABEL_19:

LABEL_28:
        goto LABEL_29;
      }
      int v17 = sub_100008DCC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v47 = v10;
        __int16 v48 = 2112;
        id v49 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] We determined that device is null and destination: %@ is not guest. Ignoring incoming message: %@", buf, 0x16u);
      }
      goto LABEL_29;
    }
    int v17 = sub_100008DCC();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_29;
    }
    id v18 = [v9 type];
    if (v18 >= 0x39)
    {
      __int16 v19 = +[NSString stringWithFormat:@"(unknown: %i)", v18];
    }
    else
    {
      __int16 v19 = *(&off_1005064D8 + (int)v18);
    }
    *(_DWORD *)buf = 138412290;
    id v47 = v19;
    __int16 v25 = "[WARN] Ignoring %@ relay message since our device does not suppport processing messages of that type.";
    id v26 = v17;
    uint32_t v27 = 12;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    goto LABEL_28;
  }
  int v20 = sub_100008DCC();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v47 = v10;
    __int16 v48 = 2112;
    id v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Messaging device can't receive relayed calls ... destination %@ device %@", buf, 0x16u);
  }

  unsigned int v21 = [(CSDRelayMessagingController *)self shouldDeclineSessionInviteWithMessageWhenRelayIsDisabled:v9];
  int v17 = sub_100008DCC();
  BOOL v22 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v22)
    {
      __int16 v23 = [v9 typeString];
      *(_DWORD *)buf = 138412546;
      id v47 = v23;
      __int16 v48 = 2112;
      id v49 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "... and we were told to decline the session invite. Declining incoming %@ message: %@", buf, 0x16u);
    }
    int v17 = [[CSDMessagingRelayMessage alloc] initWithType:18];
    [v17 setDisconnectedReason:12];
    __int16 v19 = [(CSDRelayMessagingController *)self sessionMessenger];
    id v24 = [v9 uniqueProxyIdentifier];
    [v19 sendMessage:v17 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v24];
    goto LABEL_19;
  }
  if (v22)
  {
    __int16 v19 = [v9 typeString];
    *(_DWORD *)buf = 138412546;
    id v47 = v19;
    __int16 v48 = 2112;
    id v49 = v9;
    __int16 v25 = "... and we were told not to decline the session invite. Ignoring incoming %@ message: %@";
    id v26 = v17;
    uint32_t v27 = 22;
    goto LABEL_27;
  }
LABEL_29:
}

- (void)messengerConnectionEnded:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v9 = [(CSDRelayMessagingController *)self delegate];
  uint64_t v8 = [(CSDRelayMessagingController *)self _callsWithUniqueProxyIdentifiers:v7];

  [v9 messagingConnectionEndedForCalls:v8 didStartConnecting:v5];
}

- (void)messengerConnectionFailed:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v9 = [(CSDRelayMessagingController *)self delegate];
  uint64_t v8 = [(CSDRelayMessagingController *)self _callsWithUniqueProxyIdentifiers:v7];

  [v9 messagingConnectionFailedForCalls:v8 didStartConnecting:v5];
}

- (void)messengerConnectionCouldNotEstablishLink:(id)a3 forIdentifiers:(id)a4 didStartConnecting:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v9 = [(CSDRelayMessagingController *)self delegate];
  uint64_t v8 = [(CSDRelayMessagingController *)self _callsWithUniqueProxyIdentifiers:v7];

  [v9 messagingConnectionCouldNotEstablishLinkForCalls:v8 didStartConnecting:v5];
}

- (BOOL)_shouldDeclineSessionInviteWithMessage:(id)a3
{
  return [a3 type] == 2;
}

- (BOOL)shouldDeclineSecondSessionInviteWithMessage:(id)a3
{
  return [(CSDRelayMessagingController *)self _shouldDeclineSessionInviteWithMessage:a3];
}

- (BOOL)shouldDeclineSessionInviteWithMessageWhenRelayIsDisabled:(id)a3
{
  return [(CSDRelayMessagingController *)self _shouldDeclineSessionInviteWithMessage:a3];
}

- (BOOL)shouldProcessRelayMessageOfType:(int)a3
{
  BOOL v3 = 1;
  if (a3 <= 0x24 && ((1 << a3) & 0x1000791A14) != 0)
  {
    id v4 = +[FTDeviceSupport sharedInstance];
    BOOL v3 = [v4 deviceType] == (id)2;
  }
  return v3;
}

- (BOOL)_canReceiveGuestSessionInviteForMessageType:(int)a3
{
  BOOL v3 = +[FTDeviceSupport sharedInstance];
  id v4 = [v3 deviceType];

  return v4 == (id)7;
}

- (void)checkShouldIgnoreSessionInviteWithMessage:(id)a3 fromDestination:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = a4;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = +[TUCallCapabilities debugDescription];
    int v45 = 138412290;
    long long v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "TUCallCapabilities: %@", (uint8_t *)&v45, 0xCu);
  }
  unsigned int v13 = [v10 isGuest];

  if (v13
    && !-[CSDRelayMessagingController _canReceiveGuestSessionInviteForMessageType:](self, "_canReceiveGuestSessionInviteForMessageType:", [v8 type]))
  {
    uint32_t v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = [v8 typeString];
      v29 = +[FTDeviceSupport sharedInstance];
      unsigned __int8 v30 = [v29 model];
      int v45 = 138412546;
      long long v46 = v28;
      __int16 v47 = 2112;
      __int16 v48 = v30;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARN] Setting should ignore session to YES for %@ message because message is from a guest destination and this device is not a supported Guest Session device (%@)", (uint8_t *)&v45, 0x16u);
    }
    uint64_t v31 = 1;
  }
  else
  {
    unsigned int v14 = [v8 type];
    if (v14 == 31)
    {
      v32 = [(CSDRelayMessagingController *)self callCenter];
      unsigned int v33 = [v32 anyCallPassesTest:&stru_1005064B8];

      if ((v33 & 1) == 0)
      {
        uint64_t v34 = sub_100008DCC();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = [(CSDRelayMessagingController *)self callCenter];
          char v36 = [v35 _allCalls];
          int v45 = 138412290;
          long long v46 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[WARN] Setting should ignore session to YES because no calls exist with an endpoint on the current device: %@", (uint8_t *)&v45, 0xCu);
        }
      }
      uint64_t v31 = v33 ^ 1;
    }
    else
    {
      if (v14 == 1)
      {
        id v15 = [v8 tuProvider];
        id v16 = [v8 destinationID];
        int v17 = [v15 identifier];
        id v18 = +[TUICFInterface allowCallForDestinationID:v16 providerIdentifier:v17];

        __int16 v19 = sub_100008DCC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = [v8 destinationID];
          unsigned int v21 = [v15 identifier];
          int v45 = 138412802;
          long long v46 = v18;
          __int16 v47 = 2112;
          __int16 v48 = v20;
          __int16 v49 = 2112;
          __int16 v50 = v21;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Query result: %@ for handle: %@ provider: %@", (uint8_t *)&v45, 0x20u);
        }
        if ([v8 priority] != (id)2
          && ([v18 allowCallForDestinationID] & 1) == 0)
        {
          id v24 = sub_100008DCC();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            long long v37 = [v8 destinationID];
            int v45 = 138412546;
            long long v46 = v37;
            __int16 v47 = 2112;
            __int16 v48 = v15;
            id v39 = "[WARN] Setting should ignore session to YES because TUICFInterface allowCall = NO for destinationID %@"
                  " and provider %@";
            long long v40 = v24;
            uint32_t v41 = 22;
            goto LABEL_28;
          }
LABEL_29:

          uint64_t v31 = 1;
LABEL_30:

          goto LABEL_31;
        }
        BOOL v22 = [(CSDRelayMessagingController *)self callCenter];
        __int16 v23 = [v22 callWithStatus:3];

        if (v23)
        {
          id v24 = sub_100008DCC();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v25 = [(CSDRelayMessagingController *)self callCenter];
            id v26 = [v25 callWithStatus:3];
            int v45 = 138412290;
            long long v46 = v26;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[WARN] Setting should ignore session to YES because a call exists with sending status: %@", (uint8_t *)&v45, 0xCu);
          }
          goto LABEL_29;
        }
        if ([(CSDRelayMessagingController *)self shouldScreenTimeRestrictMessage:v8])
        {
          id v24 = sub_100008DCC();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            long long v37 = [v8 destinationID];
            unsigned int v38 = [v8 isEmergency];
            int v45 = 138412802;
            long long v46 = v37;
            __int16 v47 = 2112;
            __int16 v48 = v15;
            __int16 v49 = 1024;
            LODWORD(v50) = v38;
            id v39 = "[WARN] Setting should ignore session to YES because screen time filtered message for destinationID %@ "
                  "and provider %@ with emergency (%d)";
            long long v40 = v24;
            uint32_t v41 = 28;
LABEL_28:
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v39, (uint8_t *)&v45, v41);

            goto LABEL_29;
          }
          goto LABEL_29;
        }
        if ((+[TUCallCapabilities supportsPrimaryCalling] & 1) == 0)
        {
          long long v42 = [(CSDRelayMessagingController *)self callCenter];
          unsigned __int8 v43 = objc_msgSend(v42, "shouldPreferRelayOverDirectSecondaryCallingForProvider:isVideo:", v15, objc_msgSend(v8, "isVideo"));

          if ((v43 & 1) == 0)
          {
            if ([v15 isTelephonyProvider]
              && +[TUCallCapabilities isDirectTelephonyCallingCurrentlyAvailable])
            {
              id v24 = sub_100008DCC();
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_29;
              }
              LOWORD(v45) = 0;
              id v44 = "[WARN] Setting should ignore session to YES because relay is not preferred, message provider is Tele"
                    "phony, and isDirectTelephonyCallingCurrentlyAvailable is YES";
LABEL_52:
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v44, (uint8_t *)&v45, 2u);
              goto LABEL_29;
            }
            if ([v15 isFaceTimeProvider]
              && ([v8 isVideo] & 1) == 0
              && +[TUCallCapabilities isDirectFaceTimeAudioCallingCurrentlyAvailable])
            {
              id v24 = sub_100008DCC();
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_29;
              }
              LOWORD(v45) = 0;
              id v44 = "[WARN] Setting should ignore session to YES because relay is not preferred, message provider is Face"
                    "Time Audio, and isDirectFaceTimeAudioCallingCurrentlyAvailable is YES";
              goto LABEL_52;
            }
            if ([v15 isFaceTimeProvider]
              && [v8 isVideo]
              && +[TUCallCapabilities isDirectFaceTimeVideoCallingCurrentlyAvailable])
            {
              id v24 = sub_100008DCC();
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_29;
              }
              LOWORD(v45) = 0;
              id v44 = "[WARN] Setting should ignore session to YES because relay is not preferred, message provider is Face"
                    "Time Video, and isDirectFaceTimeVideoCallingCurrentlyAvailable is YES";
              goto LABEL_52;
            }
            if ([v15 isTinCanProvider]
              && +[TUCallCapabilities isDirectFaceTimeAudioCallingCurrentlyAvailable])
            {
              id v24 = sub_100008DCC();
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_29;
              }
              LOWORD(v45) = 0;
              id v44 = "[WARN] Setting should ignore session to YES because relay is not preferred, message provider is TinC"
                    "an, and isDirectFaceTimeAudioCallingCurrentlyAvailable is YES";
              goto LABEL_52;
            }
          }
        }
        uint64_t v31 = 0;
        goto LABEL_30;
      }
      uint64_t v31 = 0;
    }
  }
LABEL_31:
  v9[2](v9, v31);
}

- (BOOL)shouldScreenTimeRestrictMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 destinationID];
  if ([v5 length])
  {
    id v6 = [v4 destinationID];
  }
  else
  {
    id v6 = TUCallFilterUnknownCallerAddress;
  }
  id v7 = v6;

  id v8 = [(CSDRelayMessagingController *)self callCenter];
  unsigned __int8 v9 = [v4 isEmergency];
  id v10 = [v8 callFilterController];
  if (objc_opt_respondsToSelector())
  {
    id v11 = [v8 callFilterController];
    int v12 = +[NSSet setWithObject:v7];
    unsigned int v13 = [v4 tuProvider];
    unsigned int v14 = [(CSDRelayMessagingController *)self bundleIdentifierForProvider:v13];
    unsigned __int8 v15 = [v11 shouldRestrictAddresses:v12 forBundleIdentifier:v14 performSynchronously:1];
  }
  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15 & ~v9;
}

- (id)bundleIdentifierForProvider:(id)a3
{
  id v3 = a3;
  if ([v3 isTinCanProvider])
  {
    id v4 = (id *)&TUBundleIdentifierTinCan;
  }
  else
  {
    if (![v3 isTelephonyProvider])
    {
      if ([v3 isFaceTimeProvider]) {
        TUPreferredFaceTimeBundleIdentifier();
      }
      else {
      id v5 = [v3 bundleIdentifier];
      }
      goto LABEL_6;
    }
    id v4 = (id *)&TUBundleIdentifierMobilePhoneApplication;
  }
  id v5 = *v4;
LABEL_6:
  id v6 = v5;

  return v6;
}

- (int64_t)timeoutForInvitationWithMessage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 type];
  if (v4 == 2)
  {
    id v6 = [v3 tuProvider];
    [v3 isVideo];
    int64_t v5 = TUOutgoingInvitationTimeoutForCallProvider();
  }
  else if (v4 == 1)
  {
    int64_t v5 = TUIncomingInvitationTimeout();
  }
  else
  {
    int64_t v5 = 30;
  }

  return v5;
}

- (id)identifiersForSessionInvitationWithMessage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[NSMutableArray array];
  if (([v3 type] & 0xFFFFFFFE) == 0x1E)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int64_t v5 = objc_msgSend(v3, "protoCalls", 0);
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) uniqueProxyIdentifier];
          [v4 addObject:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v11 = [v3 uniqueProxyIdentifier];

    if (!v11) {
      goto LABEL_13;
    }
    int64_t v5 = [v3 uniqueProxyIdentifier];
    [v4 addObject:v5];
  }

LABEL_13:
  id v12 = [v4 copy];

  return v12;
}

- (void)performBlockOnTransportAvailability:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDRelayMessagingController *)self sessionMessenger];
  [v8 performBlockOnTransportAvailability:v7 forIdentifier:v6];
}

- (void)prepareToDisconnectMessagingConnectionForCall:(id)a3
{
  id v4 = a3;
  id v6 = [(CSDRelayMessagingController *)self sessionMessenger];
  int64_t v5 = [v4 uniqueProxyIdentifier];

  [v6 prepareSessionToEndForIdentifier:v5];
}

- (void)disconnectMessagingConnectionForCall:(id)a3
{
  id v4 = a3;
  id v6 = [(CSDRelayMessagingController *)self sessionMessenger];
  int64_t v5 = [v4 uniqueProxyIdentifier];

  [v6 cancelOrDeclineInvitationForIdentifier:v5];
}

- (CSDRelayMessagingControllerClientMessagingDelegate)clientMessagingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientMessagingDelegate);

  return (CSDRelayMessagingControllerClientMessagingDelegate *)WeakRetained;
}

- (void)setClientMessagingDelegate:(id)a3
{
}

- (CSDRelayMessagingControllerCommonMessagingDelegate)commonMessagingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commonMessagingDelegate);

  return (CSDRelayMessagingControllerCommonMessagingDelegate *)WeakRetained;
}

- (void)setCommonMessagingDelegate:(id)a3
{
}

- (CSDRelayMessagingControllerHostMessagingDelegate)hostMessagingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostMessagingDelegate);

  return (CSDRelayMessagingControllerHostMessagingDelegate *)WeakRetained;
}

- (void)setHostMessagingDelegate:(id)a3
{
}

- (CSDRelayMessagingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDRelayMessagingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSDRelayIDSSessionMessenger)sessionMessenger
{
  return self->_sessionMessenger;
}

- (CSDRelayPairedDeviceMessenger)pairedDeviceMessenger
{
  return self->_pairedDeviceMessenger;
}

- (IDSDestination)dialingIDSDestination
{
  return self->_dialingIDSDestination;
}

- (void)setDialingIDSDestination:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallContainer)callCenter
{
  return self->_callCenter;
}

- (CSDRouteController)localRouteController
{
  return self->_localRouteController;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_localRouteController, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dialingIDSDestination, 0);
  objc_storeStrong((id *)&self->_pairedDeviceMessenger, 0);
  objc_storeStrong((id *)&self->_sessionMessenger, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_hostMessagingDelegate);
  objc_destroyWeak((id *)&self->_commonMessagingDelegate);

  objc_destroyWeak((id *)&self->_clientMessagingDelegate);
}

@end