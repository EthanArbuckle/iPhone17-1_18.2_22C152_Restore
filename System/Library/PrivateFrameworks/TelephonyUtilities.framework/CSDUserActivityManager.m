@interface CSDUserActivityManager
+ (CSDUserActivityManager)sharedInstance;
+ (id)allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4;
+ (id)sharedInstanceWithQueue:(id)a3;
- (CSDUserActivity)handoffActivity;
- (CSDUserActivityCommunicatorProtocol)activityCommunicator;
- (CSDUserActivityManager)initWithQueue:(id)a3 activityCommunicator:(id)a4 callCenter:(id)a5 featureFlags:(id)a6;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (id)dynamicIdentifierForConversation:(id)a3 uplinkMuted:(BOOL)a4 sendingVideo:(BOOL)a5;
- (id)lockdownModeEnabled;
- (void)callConnected:(id)a3;
- (void)callContinuityChanged:(id)a3;
- (void)callIsSendingVideoChanged:(id)a3;
- (void)callIsUplinkMutedChanged:(id)a3;
- (void)callStartedConnecting:(id)a3;
- (void)callStatusChanged:(id)a3;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 screeningChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)dealloc;
- (void)deregisterHandoffIdentifiersForConversation:(id)a3;
- (void)endHandoffActivity;
- (void)processStatusChangeAsHandedOffIfNecessaryForCall:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)receivedBroadcastedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4 originatingDeviceType:(id)a5;
- (void)setActivityCommunicator:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setHandoffActivity:(id)a3;
- (void)setLockdownModeEnabled:(id)a3;
- (void)shouldSuppressRingtoneChanged:(id)a3;
- (void)startSuppressRingtoneActivityBroadcastingForCall:(id)a3;
- (void)startSuppressRingtoneActivityBroadcastingIfNecessaryForCallWithStatusChange:(id)a3;
- (void)stopAdvertisingForRemovedConversationIfNecessary:(id)a3;
- (void)stoppedReceivingActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4;
- (void)updateAppHistoryActivityForCall;
- (void)updateAudioVideoHandoffPreferencesForCall:(id)a3;
- (void)updateCallHandoffRegistration;
- (void)updateHandoffActivityStateForCall:(id)a3;
- (void)updateHandoffAdvertisementForCall:(id)a3;
- (void)updateHandoffAdvertisementForConversation:(id)a3 fromOldConversation:(id)a4;
- (void)updateHandoffAdvertisementForConversation:(id)a3 fromOldConversation:(id)a4 uplinkMuted:(BOOL)a5 sendingVideo:(BOOL)a6;
- (void)updateHandoffRegistrationForConversation:(id)a3 fromOldConversation:(id)a4;
- (void)updateSuppressRingtoneActivityListeningState;
@end

@implementation CSDUserActivityManager

+ (CSDUserActivityManager)sharedInstance
{
  return (CSDUserActivityManager *)+[CSDUserActivityManager sharedInstanceWithQueue:&_dispatch_main_q];
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D9E4;
  block[3] = &unk_100504EC0;
  id v8 = a3;
  uint64_t v3 = qword_10058C1C8;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10058C1C8, block);
  }
  id v5 = (id)qword_10058C1C0;

  return v5;
}

- (CSDUserActivityManager)initWithQueue:(id)a3 activityCommunicator:(id)a4 callCenter:(id)a5 featureFlags:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CSDUserActivityManager;
  v15 = [(CSDUserActivityManager *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_featureFlags, a6);
    objc_storeStrong((id *)&v16->_activityCommunicator, a4);
    [(CSDUserActivityCommunicatorProtocol *)v16->_activityCommunicator setDelegate:v16];
    objc_storeWeak((id *)&v16->_callCenter, v13);
    id lockdownModeEnabled = v16->_lockdownModeEnabled;
    v16->_id lockdownModeEnabled = &stru_100505140;

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v16 selector:"callStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v18 addObserver:v16 selector:"callStatusChanged:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
    [v18 addObserver:v16 selector:"callContinuityChanged:" name:TUCallCenterCallContinuityStateChangedNotification object:0];
    [v18 addObserver:v16 selector:"shouldSuppressRingtoneChanged:" name:TUCallShouldSuppressRingingChangedNotification object:0];
    [v18 addObserver:v16 selector:"callStartedConnecting:" name:TUCallCenterCallStartedConnectingNotification object:0];
    [v18 addObserver:v16 selector:"callConnected:" name:TUCallCenterCallConnectedNotification object:0];
    [v18 addObserver:v16 selector:"callIsUplinkMutedChanged:" name:TUCallIsUplinkMutedChangedNotification object:0];
    [v18 addObserver:v16 selector:"callIsSendingVideoChanged:" name:TUCallIsSendingVideoChangedNotification object:0];
    v19 = [(CSDUserActivityManager *)v16 callCenter];
    v20 = [v19 providerManager];
    [v20 addDelegate:v16 queue:v16->_queue];

    v21 = [v19 conversationManager];
    [v21 addDelegate:v16 queue:v16->_queue];

    [(CSDUserActivityManager *)v16 updateCallHandoffRegistration];
    [(CSDUserActivityManager *)v16 updateAppHistoryActivityForCall];
    [(CSDUserActivityManager *)v16 updateSuppressRingtoneActivityListeningState];
    v22 = [v19 currentCalls];
    v23 = [v22 firstObject];

    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CSDUserActivityManager *)v16 updateHandoffActivityStateForCall:v23];
        v24 = sub_100008DCC();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "It's interesting that we have a call here when we don't really expect one %@", buf, 0xCu);
        }
      }
    }
  }
  return v16;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(CSDUserActivityManager *)self callCenter];
  id v5 = [v4 conversationManager];
  [v5 removeDelegate:self];

  TURemoveEveryTelephonyCenterObserver();
  v6.receiver = self;
  v6.super_class = (Class)CSDUserActivityManager;
  [(CSDUserActivityManager *)&v6 dealloc];
}

- (void)updateCallHandoffRegistration
{
  if (+[TUCallCapabilities supportsPrimaryCalling])
  {
    uint64_t v3 = [(CSDUserActivityManager *)self activityCommunicator];
    [v3 stopListeningForActivityType:2 dynamicIdentifier:0];

    id v4 = [(CSDUserActivityManager *)self callCenter];
    id v5 = [v4 providerManager];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [v5 providers];
    id v18 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v18)
    {
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = v6;
          v7 = *(void **)(*((void *)&v24 + 1) + 8 * v6);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v8 = [v7 handoffIdentifiers];
          id v9 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v21;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v21 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
                id v14 = sub_100008DCC();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v29 = v13;
                  __int16 v30 = 2112;
                  v31 = v7;
                  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Registering to handle call handoff activity type with dynamic identifier %@ for provider %@", buf, 0x16u);
                }

                v15 = [(CSDUserActivityManager *)self activityCommunicator];
                [v15 listenForActivityType:2 dynamicIdentifier:v13];
              }
              id v10 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
            }
            while (v10);
          }

          uint64_t v6 = v19 + 1;
        }
        while ((id)(v19 + 1) != v18);
        id v18 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v18);
    }
  }
}

- (void)updateHandoffActivityStateForCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  if (![v4 isHostedOnCurrentDevice])
  {
LABEL_28:
    long long v20 = [(CSDUserActivityManager *)self handoffActivity];

    if (v20) {
      [(CSDUserActivityManager *)self endHandoffActivity];
    }
    goto LABEL_30;
  }
  uint64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Frontmost call is hosted here ...", (uint8_t *)&v21, 2u);
  }

  unsigned int v7 = [v4 isEndpointOnCurrentDevice];
  id v8 = sub_100008DCC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "... and it is an endpoint here ...", (uint8_t *)&v21, 2u);
    }

    unsigned __int8 v10 = +[TUCallCapabilities supportsPrimaryCalling];
    uint64_t v11 = sub_100008DCC();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "... but we are a primary device. Not broadcasting frontmost call", (uint8_t *)&v21, 2u);
      }

      goto LABEL_28;
    }
    if (v12)
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "... and we are a secondary device ...", (uint8_t *)&v21, 2u);
    }

    v16 = [v4 handoffDynamicIdentifier];
    uint64_t v17 = [v4 handoffActivityUserInfo];
    id v18 = sub_100008DCC();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16 && v17)
    {
      if (v19)
      {
        int v21 = 138412290;
        *(void *)long long v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "... using a broadcast activity with dynamic identifier: %@.", (uint8_t *)&v21, 0xCu);
      }

      uint64_t v13 = +[CSDUserActivity activityWithType:2 dynamicIdentifier:v16 userInfo:v17 originatingDeviceType:0];
    }
    else
    {
      if (v19)
      {
        int v21 = 67109376;
        *(_DWORD *)long long v22 = v16 == 0;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = v17 == 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] ... but no dynamic identifier could be found (%d) or no handoff user info exists (%d). Not broadcasting frontmost call", (uint8_t *)&v21, 0xEu);
      }

      uint64_t v13 = 0;
    }

    if (!v13) {
      goto LABEL_28;
    }
  }
  else
  {
    if (v9)
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "... and it is being relayed elsewhere. Using a local activity", (uint8_t *)&v21, 2u);
    }

    uint64_t v13 = +[CSDUserActivity activityWithType:1 dynamicIdentifier:0 userInfo:0 originatingDeviceType:0];
    if (!v13) {
      goto LABEL_28;
    }
  }
  [(CSDUserActivityManager *)self endHandoffActivity];
  id v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    *(void *)long long v22 = v13;
    *(_WORD *)&v22[8] = 2112;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beginning handoff activity %@ for call %@", (uint8_t *)&v21, 0x16u);
  }

  v15 = [(CSDUserActivityManager *)self activityCommunicator];
  [v15 broadcastActivity:v13];

  [(CSDUserActivityManager *)self setHandoffActivity:v13];
LABEL_30:
}

- (void)endHandoffActivity
{
  uint64_t v3 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDUserActivityManager *)self handoffActivity];

  if (v4)
  {
    id v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CSDUserActivityManager *)self handoffActivity];
      int v9 = 138412290;
      unsigned __int8 v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ending handoff activity: %@", (uint8_t *)&v9, 0xCu);
    }
    unsigned int v7 = [(CSDUserActivityManager *)self activityCommunicator];
    id v8 = [(CSDUserActivityManager *)self handoffActivity];
    [v7 stopBroadcastingActivity:v8];

    [(CSDUserActivityManager *)self setHandoffActivity:0];
  }
}

- (void)startSuppressRingtoneActivityBroadcastingIfNecessaryForCallWithStatusChange:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  if (v4 && [v4 status] == 6 && objc_msgSend(v4, "wasDeclined"))
  {
    uint64_t v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Broadcasting suppress ringtone activity for declined call: %@", (uint8_t *)&v7, 0xCu);
    }

    [(CSDUserActivityManager *)self startSuppressRingtoneActivityBroadcastingForCall:v4];
  }
}

- (void)startSuppressRingtoneActivityBroadcastingForCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v9 = [(CSDUserActivityManager *)self activityCommunicator];
  uint64_t v6 = [v4 handle];

  int v7 = [v6 value];
  id v8 = +[CSDUserActivity activityWithType:3 dynamicIdentifier:v7 userInfo:0 originatingDeviceType:0];
  [v9 broadcastActivity:v8 withTimeout:1 shouldPrioritize:2.0];
}

- (void)updateSuppressRingtoneActivityListeningState
{
  uint64_t v3 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDUserActivityManager *)self callCenter];
  id v8 = [v4 callPassingTest:&stru_100505180];

  id v5 = [(CSDUserActivityManager *)self activityCommunicator];
  if (v8)
  {
    uint64_t v6 = [v8 handle];
    int v7 = [v6 value];
    [v5 listenForActivityType:3 dynamicIdentifier:v7];
  }
  else
  {
    [v5 stopListeningForActivityType:3 dynamicIdentifier:0];
  }
}

- (void)updateHandoffAdvertisementForConversation:(id)a3 fromOldConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDUserActivityManager *)self callCenter];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001EA48;
  v13[3] = &unk_1005051A8;
  id v14 = v6;
  id v9 = v6;
  unsigned __int8 v10 = [v8 callPassingTest:v13];

  if (v10)
  {
    id v11 = [v10 isUplinkMuted];
    uint64_t v12 = (uint64_t)[v10 isSendingVideo];
  }
  else
  {
    id v11 = 0;
    uint64_t v12 = 1;
  }
  [(CSDUserActivityManager *)self updateHandoffAdvertisementForConversation:v9 fromOldConversation:v7 uplinkMuted:v11 sendingVideo:v12];
}

- (void)updateHandoffAdvertisementForCall:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || ![v4 isConversation]
    || ([v5 callGroupUUID], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v7 = (void *)v6, unsigned int v8 = [v5 status], v7, v8 != 1))
  {
    id v14 = sub_100008DCC();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    if ([v5 isUplinkMuted]) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    if ([v5 isSendingVideo]) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    if (v5) {
      CFStringRef v24 = @"YES";
    }
    else {
      CFStringRef v24 = @"NO";
    }
    if (!v5)
    {
      *(_DWORD *)buf = 138413570;
      CFStringRef v42 = v22;
      __int16 v43 = 2112;
      CFStringRef v44 = v23;
      __int16 v45 = 2112;
      CFStringRef v46 = v24;
      __int16 v47 = 2112;
      CFStringRef v48 = @"NO";
      __int16 v49 = 2112;
      CFStringRef v50 = @"NO";
      __int16 v51 = 2112;
      CFStringRef v52 = @"NO";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but call didn't meet criteria (call is non-nil: %@, call is conversation: %@, call has groupUUID: %@, call is active: %@)", buf, 0x3Eu);
      goto LABEL_39;
    }
    if ([v5 isConversation]) {
      CFStringRef v25 = @"YES";
    }
    else {
      CFStringRef v25 = @"NO";
    }
    CFStringRef v35 = v25;
    long long v26 = [v5 callGroupUUID];
    if (v26) {
      CFStringRef v27 = @"YES";
    }
    else {
      CFStringRef v27 = @"NO";
    }
    *(_DWORD *)buf = 138413570;
    if ([v5 status] == 1) {
      CFStringRef v28 = @"YES";
    }
    else {
      CFStringRef v28 = @"NO";
    }
    CFStringRef v42 = v22;
    __int16 v43 = 2112;
    CFStringRef v44 = v23;
    __int16 v45 = 2112;
    CFStringRef v46 = v24;
    __int16 v47 = 2112;
    CFStringRef v48 = v35;
    __int16 v49 = 2112;
    CFStringRef v50 = v27;
    __int16 v51 = 2112;
    CFStringRef v52 = v28;
    uint64_t v29 = "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but cal"
          "l didn't meet criteria (call is non-nil: %@, call is conversation: %@, call has groupUUID: %@, call is active: %@)";
    __int16 v30 = v14;
    uint32_t v31 = 62;
LABEL_37:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);

    goto LABEL_39;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = [(CSDUserActivityManager *)self callCenter];
  unsigned __int8 v10 = [v9 conversationManager];
  id v11 = [v10 activeConversations];

  id v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v12)
  {

LABEL_41:
    id v14 = sub_100008DCC();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    CFStringRef v32 = @"YES";
    if ([v5 isUplinkMuted]) {
      CFStringRef v33 = @"YES";
    }
    else {
      CFStringRef v33 = @"NO";
    }
    if (![v5 isSendingVideo]) {
      CFStringRef v32 = @"NO";
    }
    long long v26 = [v5 callGroupUUID];
    *(_DWORD *)buf = 138412802;
    CFStringRef v42 = v33;
    __int16 v43 = 2112;
    CFStringRef v44 = v32;
    __int16 v45 = 2112;
    CFStringRef v46 = v26;
    uint64_t v29 = "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but cou"
          "ld not find conversation for call with groupUUID: %@";
    __int16 v30 = v14;
    uint32_t v31 = 32;
    goto LABEL_37;
  }
  id v13 = v12;
  v34 = self;
  id v14 = 0;
  uint64_t v15 = *(void *)v37;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v37 != v15) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      id v18 = [v5 callGroupUUID];
      BOOL v19 = [v17 groupUUID];
      unsigned int v20 = [v18 isEqual:v19];

      if (v20)
      {
        int v21 = v17;

        id v14 = v21;
      }
    }
    id v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v13);

  if (!v14) {
    goto LABEL_41;
  }
  -[CSDUserActivityManager updateHandoffAdvertisementForConversation:fromOldConversation:uplinkMuted:sendingVideo:](v34, "updateHandoffAdvertisementForConversation:fromOldConversation:uplinkMuted:sendingVideo:", v14, 0, [v5 isUplinkMuted], objc_msgSend(v5, "isSendingVideo"));
LABEL_39:
}

- (void)updateHandoffAdvertisementForConversation:(id)a3 fromOldConversation:(id)a4 uplinkMuted:(BOOL)a5 sendingVideo:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  unsigned __int8 v10 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(CSDUserActivityManager *)self featureFlags];
  unsigned int v12 = [v11 conversationHandoffEnabled];

  if (v12)
  {
    id v13 = [(CSDUserActivityManager *)self lockdownModeEnabled];
    int v14 = v13[2]();

    if (v14)
    {
      uint64_t v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not updating handoff advertisement because lockdown mode is enabled", buf, 2u);
      }
    }
    else
    {
      uint64_t v15 = [(CSDUserActivityManager *)self dynamicIdentifierForConversation:v9 uplinkMuted:v7 sendingVideo:v6];
      if (v15) {
        unsigned __int8 v34 = [v9 shouldAdvertiseConversationHandoff];
      }
      else {
        unsigned __int8 v34 = 0;
      }
      CFStringRef v33 = self;
      v16 = [(CSDUserActivityManager *)self activityCommunicator];
      uint64_t v17 = [v16 queuedActivitiesOfType:5];

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id obj = v17;
      id v18 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v37;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v37 != v20) {
              objc_enumerationMutation(obj);
            }
            CFStringRef v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            CFStringRef v23 = [v22 dynamicIdentifier];
            unsigned __int8 v24 = [v23 isEqual:v15];

            if (v24)
            {
              unsigned __int8 v34 = 0;
            }
            else
            {
              CFStringRef v25 = [v22 dynamicIdentifier];
              id v26 = v9;
              CFStringRef v27 = [v9 groupUUID];
              CFStringRef v28 = [v27 UUIDString];
              unsigned int v29 = [v25 containsString:v28];

              if (v29)
              {
                __int16 v30 = [(CSDUserActivityManager *)v33 activityCommunicator];
                [v30 stopBroadcastingActivity:v22];
              }
              id v9 = v26;
            }
          }
          id v19 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v19);
      }

      if (v34)
      {
        uint32_t v31 = +[CSDUserActivity activityWithType:5 dynamicIdentifier:v15 userInfo:0 originatingDeviceType:0];
        CFStringRef v32 = [(CSDUserActivityManager *)v33 activityCommunicator];
        [v32 broadcastActivity:v31 withTimeout:1 shouldPrioritize:-1.0];
      }
    }
  }
}

- (void)processStatusChangeAsHandedOffIfNecessaryForCall:(id)a3
{
  id v4 = a3;
  unsigned __int8 v34 = self;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [v4 provider];
  if (![v6 isFaceTimeProvider]
    || [v4 status] != 6
    || [v4 disconnectedReason] != 7)
  {

    goto LABEL_29;
  }
  BOOL v7 = [v4 handoffRecipientParticipant];

  if (v7)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    unsigned int v8 = [(CSDUserActivityManager *)self callCenter];
    id v9 = [v8 conversationManager];
    unsigned __int8 v10 = [v9 activeConversations];

    id v11 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (!v11)
    {

      goto LABEL_31;
    }
    id v12 = v11;
    CFStringRef v35 = 0;
    uint64_t v13 = *(void *)v41;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v16 = [v4 callGroupUUID];
        uint64_t v17 = [v15 groupUUID];
        if ([v16 isEqual:v17])
        {
          id v18 = [v15 provider];
          unsigned int v19 = [v18 isDefaultProvider];

          if (!v19) {
            continue;
          }
          v16 = v35;
          CFStringRef v35 = v15;
        }
        else
        {
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (!v12)
      {

        if (v35)
        {
          uint64_t v20 = [v4 handoffRecipientParticipant];
          id v21 = [v20 unsignedLongLongValue];

          CFStringRef v22 = [v35 groupUUID];
          CFStringRef v23 = +[CSDUserActivityManager allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:v22 participantIdentifier:v21];

          unsigned __int8 v24 = sub_100008DCC();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v25 = [v35 UUID];
            *(_DWORD *)buf = 138412546;
            CFStringRef v46 = v25;
            __int16 v47 = 2048;
            id v48 = v21;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "After conversation %@ was handed off elsewhere, re-registering for handoff advertisement for participant %llu so that it can be handed off back", buf, 0x16u);
          }
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v26 = v23;
          id v27 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = *(void *)v37;
            do
            {
              for (j = 0; j != v28; j = (char *)j + 1)
              {
                if (*(void *)v37 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v36 + 1) + 8 * (void)j);
                CFStringRef v32 = [(CSDUserActivityManager *)v34 activityCommunicator];
                [v32 listenForActivityType:5 dynamicIdentifier:v31];
              }
              id v28 = [v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v28);
          }

          CFStringRef v33 = v35;
          goto LABEL_33;
        }
LABEL_31:
        CFStringRef v33 = sub_100008DCC();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_1003A6B34((uint64_t)v4, v33);
        }
LABEL_33:

        break;
      }
    }
  }
LABEL_29:
}

- (void)updateHandoffRegistrationForConversation:(id)a3 fromOldConversation:(id)a4
{
  id v46 = a3;
  id v47 = a4;
  BOOL v6 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = [(CSDUserActivityManager *)self featureFlags];
  unsigned int v8 = [v7 conversationHandoffEnabled];

  if (v8)
  {
    id v9 = [(CSDUserActivityManager *)self lockdownModeEnabled];
    int v10 = v9[2]();

    if (v10)
    {
      id v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not updating handoff registration because lockdown mode is enabled", buf, 2u);
      }
    }
    else
    {
      id v12 = +[NSMutableSet set];
      __int16 v45 = +[NSMutableSet set];
      if ([v46 isAnyOtherAccountDeviceActive])
      {
        uint64_t v13 = [v46 provider];
        unsigned int v14 = [v13 isDefaultProvider];

        if (v14)
        {
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          uint64_t v15 = [v46 activeRemoteParticipants];
          id v16 = [v15 countByEnumeratingWithState:&v60 objects:v68 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v61;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v61 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                if ([v20 isLocalAccountHandle])
                {
                  id v21 = [v46 groupUUID];
                  CFStringRef v22 = +[CSDUserActivityManager allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:](CSDUserActivityManager, "allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:", v21, [v20 identifier]);
                  [v12 unionSet:v22];
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v60 objects:v68 count:16];
            }
            while (v17);
          }
        }
      }
      if (v47 && [v47 isAnyOtherAccountDeviceActive])
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        CFStringRef v23 = [v47 activeRemoteParticipants];
        id v24 = [v23 countByEnumeratingWithState:&v56 objects:v67 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v57;
          do
          {
            for (j = 0; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v57 != v26) {
                objc_enumerationMutation(v23);
              }
              id v28 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
              if ([v28 isLocalAccountHandle])
              {
                uint64_t v29 = [v47 groupUUID];
                __int16 v30 = +[CSDUserActivityManager allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:](CSDUserActivityManager, "allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:participantIdentifier:", v29, [v28 identifier]);

                uint64_t v31 = [v30 anyObject];
                LOBYTE(v29) = [v12 containsObject:v31];

                if ((v29 & 1) == 0) {
                  [v45 unionSet:v30];
                }
              }
            }
            id v25 = [v23 countByEnumeratingWithState:&v56 objects:v67 count:16];
          }
          while (v25);
        }
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v11 = v12;
      id v32 = [v11 countByEnumeratingWithState:&v52 objects:v66 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v53;
        do
        {
          for (k = 0; k != v33; k = (char *)k + 1)
          {
            if (*(void *)v53 != v34) {
              objc_enumerationMutation(v11);
            }
            uint64_t v36 = *(void *)(*((void *)&v52 + 1) + 8 * (void)k);
            long long v37 = [(CSDUserActivityManager *)self activityCommunicator];
            [v37 listenForActivityType:5 dynamicIdentifier:v36];
          }
          id v33 = [v11 countByEnumeratingWithState:&v52 objects:v66 count:16];
        }
        while (v33);
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v38 = v45;
      id v39 = [v38 countByEnumeratingWithState:&v48 objects:v65 count:16];
      if (v39)
      {
        id v40 = v39;
        uint64_t v41 = *(void *)v49;
        do
        {
          for (m = 0; m != v40; m = (char *)m + 1)
          {
            if (*(void *)v49 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v48 + 1) + 8 * (void)m);
            CFStringRef v44 = [(CSDUserActivityManager *)self activityCommunicator];
            [v44 stopListeningForActivityType:5 dynamicIdentifier:v43];
          }
          id v40 = [v38 countByEnumeratingWithState:&v48 objects:v65 count:16];
        }
        while (v40);
      }
    }
  }
}

- (void)deregisterHandoffIdentifiersForConversation:(id)a3
{
  id v10 = a3;
  id v4 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDUserActivityManager *)self featureFlags];
  unsigned int v6 = [v5 conversationHandoffEnabled];

  if (v6)
  {
    BOOL v7 = [(CSDUserActivityManager *)self activityCommunicator];
    unsigned int v8 = [v10 groupUUID];
    id v9 = [v8 UUIDString];
    [v7 stopListeningForActivityType:5 matchingDynamicIdentifierSubstring:v9];
  }
}

+ (id)allConversationHandoffDynamicIdentifierPossibilitiesForGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4
{
  id v5 = a3;
  unsigned int v6 = +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:v5 participantIdentifier:a4 uplinkMuted:0 sendingVideo:0];
  v13[0] = v6;
  BOOL v7 = +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:v5 participantIdentifier:a4 uplinkMuted:0 sendingVideo:1];
  v13[1] = v7;
  unsigned int v8 = +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:v5 participantIdentifier:a4 uplinkMuted:1 sendingVideo:0];
  v13[2] = v8;
  id v9 = +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:v5 participantIdentifier:a4 uplinkMuted:1 sendingVideo:1];

  v13[3] = v9;
  id v10 = +[NSArray arrayWithObjects:v13 count:4];
  id v11 = +[NSSet setWithArray:v10];

  return v11;
}

- (void)updateAppHistoryActivityForCall
{
  uint64_t v3 = [(CSDUserActivityManager *)self callCenter];
  id v4 = [v3 currentAudioAndVideoCalls];
  id v5 = [v4 firstObject];

  if ([v5 isHostedOnCurrentDevice]
    && ([v5 status] == 3 || objc_msgSend(v5, "status") == 4))
  {
    unsigned int v6 = [v5 localizedLabel];
    BOOL v7 = [v5 handle];
    unsigned int v8 = [v7 value];
    id v9 = [v5 isoCountryCode];
    id v10 = TUFormattedPhoneNumber();
    id v11 = +[NSString stringWithFormat:@"%@ – %@", v6, v10];

    id v12 = +[NSMutableArray arrayWithCapacity:2];
    uint64_t v13 = [v5 handle];
    unsigned int v14 = [v13 value];

    if (v14)
    {
      uint64_t v15 = [v5 handle];
      id v16 = [v15 value];
      [v12 addObject:v16];
    }
    id v17 = [v5 displayName];

    if (v17)
    {
      uint64_t v18 = [v5 displayName];
      [v12 addObject:v18];
    }
    unsigned int v19 = +[NSMutableDictionary dictionaryWithCapacity:4];
    uint64_t v20 = TUCallUserActivityDestinationIDKey;
    if (TUCallUserActivityDestinationIDKey)
    {
      id v21 = [v5 handle];
      CFStringRef v22 = [v21 value];

      if (v22)
      {
        CFStringRef v23 = [v5 handle];
        id v24 = [v23 value];
        [v19 setObject:v24 forKeyedSubscript:v20];
      }
    }
    uint64_t v25 = TUCallUserActivityHandleKey;
    if (TUCallUserActivityHandleKey)
    {
      uint64_t v26 = [v5 handle];
      id v27 = [v26 dictionaryRepresentation];

      if (v27)
      {
        id v28 = [v5 handle];
        uint64_t v29 = [v28 dictionaryRepresentation];
        [v19 setObject:v29 forKeyedSubscript:v25];
      }
    }
    uint64_t v30 = TUCallUserActivityProviderIdentifierKey;
    if (TUCallUserActivityProviderIdentifierKey)
    {
      uint64_t v31 = [v5 provider];
      id v32 = [v31 identifier];

      if (v32)
      {
        id v33 = [v5 provider];
        uint64_t v34 = [v33 identifier];
        [v19 setObject:v34 forKeyedSubscript:v30];
      }
    }
    CFStringRef v35 = [v5 displayName];
    uint64_t v36 = +[CSDUserActivity appHistoryActivityWithTitle:v35 subtitle:v11 keywords:v12 userInfo:v19];

    long long v37 = [(CSDUserActivityManager *)self activityCommunicator];
    [v37 broadcastActivity:v36 withTimeout:1 shouldPrioritize:0.0];

    id v38 = sub_100008DCC();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v36;
      __int16 v41 = 2112;
      long long v42 = v5;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Began app history activity %@ for call %@", buf, 0x16u);
    }
  }
}

- (void)callStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned int v8 = [v4 object];
    [(CSDUserActivityManager *)self startSuppressRingtoneActivityBroadcastingIfNecessaryForCallWithStatusChange:v8];

    [(CSDUserActivityManager *)self updateAppHistoryActivityForCall];
    id v9 = [v4 object];
    [(CSDUserActivityManager *)self updateHandoffActivityStateForCall:v9];

    [(CSDUserActivityManager *)self updateSuppressRingtoneActivityListeningState];
    id v10 = [v4 object];
    [(CSDUserActivityManager *)self processStatusChangeAsHandedOffIfNecessaryForCall:v10];
  }
  else
  {
    id v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v4 object];
      int v14 = 138412546;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = (id)objc_opt_class();
      id v13 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Expected %@ to be kind of class %@, but is not", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)callContinuityChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned int v8 = [v4 object];
    [(CSDUserActivityManager *)self updateHandoffActivityStateForCall:v8];
  }
  else
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 object];
      int v12 = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Expected %@ to be kind of class %@, but is not", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)shouldSuppressRingtoneChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDUserActivityManager *)self updateSuppressRingtoneActivityListeningState];
  unsigned int v6 = [v4 object];

  if ([v6 shouldSuppressRingtone]
    && ([v6 ringtoneSuppressedRemotely] & 1) == 0)
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Broadcasting suppress ringtone activity for call that suppressed its ringtone: %@", (uint8_t *)&v8, 0xCu);
    }

    [(CSDUserActivityManager *)self startSuppressRingtoneActivityBroadcastingForCall:v6];
  }
}

- (void)callStartedConnecting:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [v4 object];

  if (([v6 isOutgoing] & 1) == 0)
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Broadcasting suppress ringtone activity for incoming call that started connecting: %@", (uint8_t *)&v8, 0xCu);
    }

    [(CSDUserActivityManager *)self startSuppressRingtoneActivityBroadcastingForCall:v6];
  }
}

- (void)callConnected:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v8 = [v4 object];
    [(CSDUserActivityManager *)self updateHandoffActivityStateForCall:v8];
  }
  else
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v4 object];
      int v12 = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Expected %@ to be kind of class %@, but is not", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)callIsUplinkMutedChanged:(id)a3
{
  id v8 = a3;
  id v4 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDUserActivityManager *)self featureFlags];
  unsigned int v6 = [v5 conversationHandoffEnabled];

  if (v6)
  {
    BOOL v7 = [v8 object];
    [(CSDUserActivityManager *)self updateAudioVideoHandoffPreferencesForCall:v7];
  }
}

- (void)callIsSendingVideoChanged:(id)a3
{
  id v8 = a3;
  id v4 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(CSDUserActivityManager *)self featureFlags];
  unsigned int v6 = [v5 conversationHandoffEnabled];

  if (v6)
  {
    BOOL v7 = [v8 object];
    [(CSDUserActivityManager *)self updateAudioVideoHandoffPreferencesForCall:v7];
  }
}

- (void)updateAudioVideoHandoffPreferencesForCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self featureFlags];
  unsigned int v6 = [v5 conversationHandoffEnabled];

  if (v6)
  {
    if (v4
      && [v4 isConversation]
      && ([v4 callGroupUUID], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)
      && (id v8 = (void *)v7, v9 = [v4 status], v8, v9 == 1))
    {
      [(CSDUserActivityManager *)self updateHandoffAdvertisementForCall:v4];
    }
    else
    {
      id v10 = sub_100008DCC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if ([v4 isUplinkMuted]) {
          CFStringRef v11 = @"YES";
        }
        else {
          CFStringRef v11 = @"NO";
        }
        if ([v4 isSendingVideo]) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        if (v4) {
          CFStringRef v13 = @"YES";
        }
        else {
          CFStringRef v13 = @"NO";
        }
        if (v4)
        {
          if ([v4 isConversation]) {
            CFStringRef v14 = @"YES";
          }
          else {
            CFStringRef v14 = @"NO";
          }
          id v15 = [v4 callGroupUUID];
          if (v15) {
            CFStringRef v16 = @"YES";
          }
          else {
            CFStringRef v16 = @"NO";
          }
          int v18 = 138413570;
          if ([v4 status] == 1) {
            CFStringRef v17 = @"YES";
          }
          else {
            CFStringRef v17 = @"NO";
          }
          CFStringRef v19 = v11;
          __int16 v20 = 2112;
          CFStringRef v21 = v12;
          __int16 v22 = 2112;
          CFStringRef v23 = v13;
          __int16 v24 = 2112;
          CFStringRef v25 = v14;
          __int16 v26 = 2112;
          CFStringRef v27 = v16;
          __int16 v28 = 2112;
          CFStringRef v29 = v17;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but call didn't meet criteria (call is non-nil: %@, call is conversation: %@, call has groupUUID: %@, call is active: %@)", (uint8_t *)&v18, 0x3Eu);
        }
        else
        {
          int v18 = 138413570;
          CFStringRef v19 = v11;
          __int16 v20 = 2112;
          CFStringRef v21 = v12;
          __int16 v22 = 2112;
          CFStringRef v23 = v13;
          __int16 v24 = 2112;
          CFStringRef v25 = @"NO";
          __int16 v26 = 2112;
          CFStringRef v27 = @"NO";
          __int16 v28 = 2112;
          CFStringRef v29 = @"NO";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] User activity manager aware of change to audio-video state (mic muted: %@, camera enabled: %@), but call didn't meet criteria (call is non-nil: %@, call is conversation: %@, call has groupUUID: %@, call is active: %@)", (uint8_t *)&v18, 0x3Eu);
        }
      }
    }
  }
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDUserActivityManager *)self updateCallHandoffRegistration];
}

- (void)receivedBroadcastedActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4 originatingDeviceType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDUserActivityManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100020C04;
  v13[3] = &unk_1005051D0;
  unsigned int v17 = a3;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)stoppedReceivingActivityType:(unsigned int)a3 dynamicIdentifier:(id)a4
{
  unsigned int v6 = [(CSDUserActivityManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021050;
  v7[3] = &unk_100505080;
  unsigned int v8 = a3;
  v7[4] = self;
  dispatch_async(v6, v7);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  unsigned int v8 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v8);

  [(CSDUserActivityManager *)self updateHandoffAdvertisementForConversation:v9 fromOldConversation:v7];
}

- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  unsigned int v8 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v8);

  [(CSDUserActivityManager *)self updateHandoffAdvertisementForConversation:v9 fromOldConversation:v7];
}

- (void)conversationManager:(id)a3 screeningChangedForConversation:(id)a4
{
  id v6 = a4;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDUserActivityManager *)self updateHandoffAdvertisementForConversation:v6 fromOldConversation:0];
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v6 = a4;
  id v7 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 UUID];
    int v10 = 136315394;
    id v11 = "-[CSDUserActivityManager conversationManager:activeRemoteParticipantsChangedForConversation:fromOldConversation:]";
    __int16 v12 = 2112;
    CFStringRef v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Updating handoff registration for conversation UUID %@", (uint8_t *)&v10, 0x16u);
  }
  [(CSDUserActivityManager *)self updateHandoffRegistrationForConversation:v6 fromOldConversation:v6];
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v5 UUID];
    int v9 = 136315394;
    int v10 = "-[CSDUserActivityManager conversationManager:addedActiveConversation:]";
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Updating handoff registration for conversation UUID %@", (uint8_t *)&v9, 0x16u);
  }
  [(CSDUserActivityManager *)self updateHandoffRegistrationForConversation:v5 fromOldConversation:0];
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = [v7 activeConversations];

  id v10 = [v9 count];
  if (v10)
  {
    [(CSDUserActivityManager *)self deregisterHandoffIdentifiersForConversation:v6];
  }
  else
  {
    __int16 v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No more conversations, unregistering all conversation handoff dynamic identifiers", v13, 2u);
    }

    __int16 v12 = [(CSDUserActivityManager *)self activityCommunicator];
    [v12 stopListeningForActivityType:5 dynamicIdentifier:0];
  }
  [(CSDUserActivityManager *)self stopAdvertisingForRemovedConversationIfNecessary:v6];
}

- (void)stopAdvertisingForRemovedConversationIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDUserActivityManager *)self queue];
  dispatch_assert_queue_V2(v5);

  CFStringRef v19 = self;
  id v6 = [(CSDUserActivityManager *)self activityCommunicator];
  id v7 = [v6 queuedActivitiesOfType:5];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        CFStringRef v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = [v13 dynamicIdentifier];
        id v15 = [v4 groupUUID];
        id v16 = [v15 UUIDString];
        unsigned int v17 = [v14 containsString:v16];

        if (v17)
        {
          int v18 = [(CSDUserActivityManager *)v19 activityCommunicator];
          [v18 stopBroadcastingActivity:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (id)dynamicIdentifierForConversation:(id)a3 uplinkMuted:(BOOL)a4 sendingVideo:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if ([v7 state] != (id)3) {
    goto LABEL_6;
  }
  id v8 = [v7 provider];
  if (![v8 isDefaultProvider])
  {
LABEL_8:
    __int16 v12 = 0;
    goto LABEL_9;
  }
  id v9 = [v7 activeRemoteParticipants];
  id v10 = [v9 count];
  if (v10 >= +[TUConversationManager maximumNumberOfInvitedMembers])
  {

    goto LABEL_8;
  }
  id v11 = [v7 avMode];

  if (!v11)
  {
LABEL_6:
    __int16 v12 = 0;
    goto LABEL_10;
  }
  id v8 = [v7 groupUUID];
  __int16 v12 = +[NSString tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:](NSString, "tu_conversationHandoffDynamicIdentifierWithGroupUUID:participantIdentifier:uplinkMuted:sendingVideo:", v8, [v7 localParticipantIdentifier], v6, v5);
LABEL_9:

LABEL_10:

  return v12;
}

- (id)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (void)setLockdownModeEnabled:(id)a3
{
}

- (CSDUserActivityCommunicatorProtocol)activityCommunicator
{
  return self->_activityCommunicator;
}

- (void)setActivityCommunicator:(id)a3
{
}

- (TUCallCenter)callCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callCenter);

  return (TUCallCenter *)WeakRetained;
}

- (void)setCallCenter:(id)a3
{
}

- (CSDUserActivity)handoffActivity
{
  return self->_handoffActivity;
}

- (void)setHandoffActivity:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handoffActivity, 0);
  objc_destroyWeak((id *)&self->_callCenter);
  objc_storeStrong((id *)&self->_activityCommunicator, 0);

  objc_storeStrong(&self->_lockdownModeEnabled, 0);
}

@end