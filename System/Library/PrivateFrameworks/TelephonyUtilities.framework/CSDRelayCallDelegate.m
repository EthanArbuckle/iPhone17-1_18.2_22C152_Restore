@interface CSDRelayCallDelegate
- (BOOL)_anyOtherCallHasAnEndpointElsewhere:(id)a3;
- (CSDCallController)callController;
- (CSDCallStateController)callStateController;
- (CSDRelayCallDelegate)init;
- (CSDRelayMessagingController)relayMessagingController;
- (TUDTMFSoundPlayer)dtmfSoundPlayer;
- (id)localProviderWithIdentifier:(id)a3;
- (void)_handleJoinConversationResponse:(BOOL)a3 sessionAvailable:(BOOL)a4 forRelayCall:(id)a5;
- (void)_setAllCallsToHeldExceptCall:(id)a3;
- (void)relayCall:(id)a3 didAnswerWithRequest:(id)a4;
- (void)relayCall:(id)a3 didGroupWithOtherCall:(id)a4;
- (void)relayCall:(id)a3 didPlayLocalDTMFToneForKey:(unsigned __int8)a4;
- (void)relayCallConferenceDidStartSuccessfullyForIncomingAnsweredCall:(id)a3;
- (void)relayCallConferenceDidStartSuccessfullyForPulledCall:(id)a3;
- (void)relayCallConferenceDidStop:(id)a3 cleanly:(BOOL)a4 error:(id)a5;
- (void)relayCallConferenceFailedToStart:(id)a3;
- (void)relayCallDidBecomeEndpointForPull:(id)a3;
- (void)relayCallDidDial:(id)a3;
- (void)relayCallDidDisconnect:(id)a3;
- (void)relayCallDidHold:(id)a3;
- (void)relayCallDidJoin:(id)a3;
- (void)relayCallDidPerformUplinkMuted:(id)a3 uplinkMuted:(BOOL)a4;
- (void)relayCallDidSendHardPauseDigits:(id)a3;
- (void)relayCallDidUngroup:(id)a3;
- (void)relayCallDidUnhold:(id)a3;
- (void)setCallStateController:(id)a3;
@end

@implementation CSDRelayCallDelegate

- (CSDRelayCallDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSDRelayCallDelegate;
  v2 = [(CSDRelayCallDelegate *)&v6 init];
  if (v2)
  {
    v3 = (TUDTMFSoundPlayer *)objc_alloc_init((Class)TUDTMFSoundPlayer);
    dtmfSoundPlayer = v2->_dtmfSoundPlayer;
    v2->_dtmfSoundPlayer = v3;
  }
  return v2;
}

- (CSDRelayMessagingController)relayMessagingController
{
  v2 = [(CSDRelayCallDelegate *)self callStateController];
  v3 = [v2 relayMessagingController];

  return (CSDRelayMessagingController *)v3;
}

- (CSDCallController)callController
{
  v2 = [(CSDRelayCallDelegate *)self callStateController];
  v3 = [v2 callController];

  return (CSDCallController *)v3;
}

- (void)_setAllCallsToHeldExceptCall:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(CSDRelayCallDelegate *)self callController];
  objc_super v6 = [v5 callContainer];
  v7 = [v6 callsHostedElsewhere];

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (v12 != v4) {
          [v12 setCallStatus:2];
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)_anyOtherCallHasAnEndpointElsewhere:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(CSDRelayCallDelegate *)self callController];
  objc_super v6 = [v5 callContainer];
  v7 = [v6 callsHostedElsewhere];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(id *)(*((void *)&v15 + 1) + 8 * i);
        if (v13 != v4)
        {
          [*(id *)(*((void *)&v15 + 1) + 8 * i) setCallStatus:2];
          if (v10) {
            char v10 = 1;
          }
          else {
            char v10 = [v13 isEndpointOnCurrentDevice] ^ 1;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10 & 1;
}

- (void)_handleJoinConversationResponse:(BOOL)a3 sessionAvailable:(BOOL)a4 forRelayCall:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (!a3)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1003B0594();
    }

    id v13 = v9;
    uint64_t v14 = 9;
    goto LABEL_11;
  }
  if (!a4)
  {
    long long v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1003B052C();
    }

    id v13 = v9;
    uint64_t v14 = 8;
LABEL_11:
    [v13 setLocallyDisconnectedWithReasonIfNone:v14];
    goto LABEL_12;
  }
  if ([v8 isEndpointOnCurrentDevice])
  {
    char v10 = [(CSDRelayCallDelegate *)self relayMessagingController];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001A9988;
    v16[3] = &unk_1005098C8;
    id v17 = v9;
    uint64_t v11 = [v17 uniqueProxyIdentifier];
    [v10 performBlockOnTransportAvailability:v16 forIdentifier:v11];
  }
LABEL_12:
}

- (id)localProviderWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRelayCallDelegate *)self callStateController];
  objc_super v6 = [v5 callProviderManager];
  v7 = [v6 localProvidersByIdentifierForRemoteClients:0];

  id v8 = [v7 objectForKeyedSubscript:v4];

  return v8;
}

- (void)relayCallDidJoin:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hasRelaySupport:2];
  unsigned int v6 = [(CSDRelayCallDelegate *)self _anyOtherCallHasAnEndpointElsewhere:v4];
  unsigned int v7 = v6;
  if (!v5 || v6 && ([v4 isSOS] & 1) == 0) {
    [v4 setEndpointOnCurrentDevice:0];
  }
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v4 isEndpointOnCurrentDevice];
    CFStringRef v10 = @"NO";
    if (v9) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    if (v5) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    CFStringRef v18 = v11;
    __int16 v19 = 2112;
    CFStringRef v20 = v12;
    if (v7) {
      CFStringRef v10 = @"YES";
    }
    __int16 v21 = 2112;
    CFStringRef v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Determined if endpoint should be on current device: %@; hasRelaySupport: %@, anyOtherCallHasAnEndpointElsewhere: %@",
      buf,
      0x20u);
  }

  id v13 = [v4 joinConversationRequest];

  if (v13)
  {
    uint64_t v14 = [(CSDRelayCallDelegate *)self relayMessagingController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001A9CF8;
    v15[3] = &unk_1005098F0;
    v15[4] = self;
    id v16 = v4;
    [v14 sendJoinConversationMessageToHostForCall:v16 completionHandler:v15];
  }
}

- (void)relayCallDidDial:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 hasRelaySupport:2];
  unsigned int v6 = [(CSDRelayCallDelegate *)self _anyOtherCallHasAnEndpointElsewhere:v4];
  unsigned int v7 = v6;
  if (!v5 || v6 && ([v4 isSOS] & 1) == 0) {
    [v4 setEndpointOnCurrentDevice:0];
  }
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ([v4 isEndpointOnCurrentDevice]) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    if (v5) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    if (v7) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    *(_DWORD *)buf = 138413058;
    if ([v4 isSOS]) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    CFStringRef v19 = v9;
    __int16 v20 = 2112;
    CFStringRef v21 = v10;
    __int16 v22 = 2112;
    CFStringRef v23 = v11;
    __int16 v24 = 2112;
    CFStringRef v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Determined if endpoint should be on current device: %@; hasRelaySupport: %@, anyOtherCallHasAnEndpointElsewhere: %"
      "@, relayCall.isSOS: %@",
      buf,
      0x2Au);
  }

  id v13 = [v4 dialRequest];

  if (v13)
  {
    uint64_t v14 = [(CSDRelayCallDelegate *)self relayMessagingController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001A9EFC;
    v15[3] = &unk_1005098F0;
    id v16 = v4;
    id v17 = self;
    [v14 sendDialCallMessageToHostForCall:v16 completionHandler:v15];
  }
}

- (void)relayCall:(id)a3 didAnswerWithRequest:(id)a4
{
  id v6 = a3;
  if ([v6 canBeAnsweredWithAudioOrVideoRelayWithRequest:a4])
  {
    [v6 setLocallyConnecting];
  }
  else
  {
    unsigned int v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting endpoint elsewhere for call because it can't be answered with audio or video relay: %@", buf, 0xCu);
    }

    [v6 setEndpointOnCurrentDevice:0];
    [v6 setLocallyConnected];
  }
  if ([v6 isEndpointOnCurrentDevice])
  {
    id v8 = [(CSDRelayCallDelegate *)self relayMessagingController];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001AA2C0;
    v10[3] = &unk_1005098C8;
    id v11 = v6;
    CFStringRef v9 = [v11 uniqueProxyIdentifier];
    [v8 performBlockOnTransportAvailability:v10 forIdentifier:v9];
  }
}

- (void)relayCallDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayCallDelegate *)self relayMessagingController];
  [v5 sendDisconnectCallMessageToHostForCall:v4];
}

- (void)relayCallDidHold:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayCallDelegate *)self relayMessagingController];
  [v5 sendHoldCallMessageToHostForCall:v4];
}

- (void)relayCallDidUnhold:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayCallDelegate *)self relayMessagingController];
  [v5 sendUnholdCallMessageToHostForCall:v4];
}

- (void)relayCall:(id)a3 didGroupWithOtherCall:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDRelayCallDelegate *)self relayMessagingController];
  [v8 sendGroupCallMessageToHostForCall:v7 otherCall:v6];
}

- (void)relayCallDidUngroup:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayCallDelegate *)self relayMessagingController];
  [v5 sendUngroupCallMessageToHostForCall:v4];
}

- (void)relayCall:(id)a3 didPlayLocalDTMFToneForKey:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v5 = [(CSDRelayCallDelegate *)self dtmfSoundPlayer];
  [v5 attemptToPlayKey:v4];
}

- (void)relayCallDidSendHardPauseDigits:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayCallDelegate *)self relayMessagingController];
  [v5 sendSendHardPauseDigitsMessageToHostForCall:v4];
}

- (void)relayCallDidBecomeEndpointForPull:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayCallDelegate *)self relayMessagingController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001AA6E4;
  v8[3] = &unk_1005098C8;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v6 uniqueProxyIdentifier];
  [v5 performBlockOnTransportAvailability:v8 forIdentifier:v7];
}

- (void)relayCallConferenceDidStartSuccessfullyForIncomingAnsweredCall:(id)a3
{
  id v4 = a3;
  [(CSDRelayCallDelegate *)self _setAllCallsToHeldExceptCall:v4];
  [v4 setLocallyConnected];
}

- (void)relayCallConferenceDidStartSuccessfullyForPulledCall:(id)a3
{
  v3 = +[NSURL faceTimeShowInCallUIURL];
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Opening URL for handled pushHostedCalls message from host: %@", (uint8_t *)&v5, 0xCu);
  }

  TUOpenURL();
}

- (void)relayCallConferenceFailedToStart:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 isEndpointOnCurrentDevice];
  int v5 = sub_100008DCC();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1003B079C();
    }

    [v3 setLocallyDisconnectedWithReasonIfNone:8];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not disconnecting call for failed conference start because it is not an endpoint here: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)relayCallConferenceDidStop:(id)a3 cleanly:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 isEndpointOnCurrentDevice])
  {
    if (v8 || !a4)
    {
      id v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1003B0804();
      }

      uint64_t v9 = 8;
    }
    else
    {
      uint64_t v9 = 0;
    }
    [v7 setLocallyDisconnectedWithReasonIfNone:v9];
  }
  else
  {
    CFStringRef v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not disconnecting call for conference didStop because it is not an endpoint here: %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)relayCallDidPerformUplinkMuted:(id)a3 uplinkMuted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CSDRelayCallDelegate *)self relayMessagingController];
  [v7 sendSetUplinkMutedCallMessageForCall:v6 uplinkMuted:v4];
}

- (CSDCallStateController)callStateController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callStateController);

  return (CSDCallStateController *)WeakRetained;
}

- (void)setCallStateController:(id)a3
{
}

- (TUDTMFSoundPlayer)dtmfSoundPlayer
{
  return self->_dtmfSoundPlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtmfSoundPlayer, 0);

  objc_destroyWeak((id *)&self->_callStateController);
}

@end