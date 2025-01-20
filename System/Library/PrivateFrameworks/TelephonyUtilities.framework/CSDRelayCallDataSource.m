@interface CSDRelayCallDataSource
+ (Class)callClass;
- (CSDRelayCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingActiveCalls:(id)a5;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingHeldCalls:(id)a5 andHoldingCalls:(id)a6;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileHoldingActiveCalls:(id)a5;
- (void)dealloc;
- (void)disconnectAllCalls:(id)a3 withReason:(int)a4;
- (void)disconnectCall:(id)a3 whileUngroupingCall:(id)a4;
- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6;
- (void)groupCalls:(id)a3 withCalls:(id)a4;
- (void)handleLocalFrequencyChanged:(id)a3;
- (void)handleLocalMeterLevelChanged:(id)a3;
- (void)handleMutedChanged:(id)a3;
- (void)handleRemoteFrequencyChanged:(id)a3;
- (void)handleRemoteMeterLevelChanged:(id)a3;
- (void)handleSendingAudioChanged:(id)a3;
- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4;
- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4;
@end

@implementation CSDRelayCallDataSource

- (CSDRelayCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSDRelayCallDataSource;
  v7 = [(CSDCallDataSource *)&v17 initWithCallStateController:v6 queue:a4];
  if (v7)
  {
    v8 = [v6 queue];
    id v9 = +[CSDRelayConferenceInterface sharedInstanceWithQueue:v8];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v7 selector:"handleLocalFrequencyChanged:" name:@"CSDRelayConferenceLocalFrequencyChangedNotification" object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v7 selector:"handleRemoteFrequencyChanged:" name:@"CSDRelayConferenceRemoteFrequencyChangedNotification" object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v7 selector:"handleLocalMeterLevelChanged:" name:@"CSDRelayConferenceLocalMeterLevelChangedNotification" object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v7 selector:"handleRemoteMeterLevelChanged:" name:@"CSDRelayConferenceRemoteMeterLevelChangedNotification" object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"handleMutedChanged:" name:@"CSDRelayConferenceMutedChangedNotification" object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v7 selector:"handleSendingAudioChanged:" name:@"CSDRelayConferenceSendingAudioChangedNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDRelayCallDataSource;
  [(CSDRelayCallDataSource *)&v4 dealloc];
}

+ (Class)callClass
{
  return (Class)objc_opt_class();
}

- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to hold relay calls %@ while unholding relay calls %@", (uint8_t *)&v11, 0x16u);
  }

  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    id v9 = [(CSDCallDataSource *)self callStateController];
    v10 = [v9 relayMessagingController];
    [v10 sendSwapCallsMessageToHost];

LABEL_10:
    goto LABEL_11;
  }
  if ([v6 count])
  {
    id v9 = [v6 firstObject];
    [v9 hold];
    goto LABEL_10;
  }
  if ([v7 count])
  {
    id v9 = [v7 firstObject];
    [v9 unhold];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingActiveCalls:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v47 = v8;
    __int16 v48 = 2112;
    id v49 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Asked to answer relay call %@ while disconnecting active relay calls %@", buf, 0x16u);
  }

  if ([v8 canBeAnsweredWithRequest:v9])
  {
    id v12 = [(CSDCallDataSource *)self callStateController];
    __int16 v13 = [v12 callController];
    if ([v10 count])
    {
      id v14 = [v12 relayMessagingController];
      [v14 sendEndActiveAndAnswerCallMessageToHostForCall:v8];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v15 = [v13 callContainer];
      v16 = [v15 callsHostedElsewhere];

      id v17 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v40;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v16);
            }
            if ([*(id *)(*((void *)&v39 + 1) + 8 * i) isOnHold])
            {

              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v26 = v10;
              id v27 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
              if (v27)
              {
                id v28 = v27;
                uint64_t v29 = *(void *)v36;
                do
                {
                  for (j = 0; j != v28; j = (char *)j + 1)
                  {
                    if (*(void *)v36 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) setLocallyDisconnectedWithReasonIfNone:0];
                  }
                  id v28 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
                }
                while (v28);
              }

              [v8 answerWithRequest:v9];
              goto LABEL_33;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      [v8 answerWithRequest:v9];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v21 = v10;
      id v22 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v32;
        do
        {
          for (k = 0; k != v23; k = (char *)k + 1)
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v21);
            }
            objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * (void)k), "setLocallyDisconnectedWithReasonIfNone:", 0, (void)v31);
          }
          id v23 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
        }
        while (v23);
      }
    }
    else
    {
      [v8 answerWithRequest:v9];
      id v21 = [v12 relayMessagingController];
      [v21 sendAnswerCallMessageToHostForCall:v8];
    }

LABEL_33:
  }
  else
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to answer call because canBeAnswered is NO: %@", buf, 0xCu);
    }
  }
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingHeldCalls:(id)a5 andHoldingCalls:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Asked to answer relay call %@ while disconnecting held relay calls %@ and holding relay calls %@", buf, 0x20u);
  }

  if ([v10 canBeAnsweredWithRequest:v11])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v12;
    id v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v19), "setLocallyDisconnectedWithReasonIfNone:", 0, (void)v22);
          uint64_t v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v10 answerWithRequest:v11];
    v20 = [(CSDCallDataSource *)self callStateController];
    id v21 = [v20 relayMessagingController];
    [v21 sendEndHeldAndAnswerCallMessageToHostForCall:v10];
  }
  else
  {
    v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to answer call because canBeAnswered is NO: %@", buf, 0xCu);
    }
  }
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileHoldingActiveCalls:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Asked to answer relay call %@ while holding relay calls %@", buf, 0x16u);
  }

  if ([v8 canBeAnsweredWithRequest:v9])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v16), "setCallStatus:", 2, (void)v19);
          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v8 answerWithRequest:v9];
    id v17 = [(CSDCallDataSource *)self callStateController];
    uint64_t v18 = [v17 relayMessagingController];
    [v18 sendHoldActiveAndAnswerCallMessageToHostForCall:v8];
  }
  else
  {
    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to answer call because canBeAnswered is NO: %@", buf, 0xCu);
    }
  }
}

- (void)groupCalls:(id)a3 withCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v5;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to group relay calls %@ with relay calls %@", buf, 0x16u);
  }

  id v8 = [v5 firstObject];
  id v9 = [v6 firstObject];
  [v8 groupWithOtherCall:v9];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v14) setCallStatus:1];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      long long v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v19), "setCallStatus:", 1, (void)v20);
        long long v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to ungroup relay call %@ from other relay calls in group %@", buf, 0x16u);
  }

  [v5 ungroup];
  [v5 setCallStatus:1];
  if ([v6 count] == (id)1)
  {
    id v8 = [v6 firstObject];
    [v8 setCallGroupUUID:0];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v13), "setCallStatus:", 2, (void)v14);
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)disconnectCall:(id)a3 whileUngroupingCall:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to disconnect relay call %@ while ungrouping relay call %@", (uint8_t *)&v8, 0x16u);
  }

  [v5 disconnect];
  [v6 setCallGroupUUID:0];
}

- (void)disconnectAllCalls:(id)a3 withReason:(int)a4
{
  id v5 = a3;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to disconnect relay calls %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v11), "setLocallyDisconnectedWithReasonIfNone:", 0, (void)v15);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if ([v7 count])
  {
    uint64_t v12 = [(CSDCallDataSource *)self callStateController];
    uint64_t v13 = [v12 relayMessagingController];
    long long v14 = [v7 firstObject];
    [v13 sendDisconnectAllCallsMessageToHostForDisconnectedCall:v14];
  }
}

- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v59 = v10;
    __int16 v60 = 2112;
    id v61 = v11;
    __int16 v62 = 2112;
    id v63 = v12;
    __int16 v64 = 2112;
    id v65 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Asked to disconnect relay calls %@ while holding relay calls %@ and unholding relay calls %@ and ungrouping calls %@", buf, 0x2Au);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v15 = v10;
  id v16 = [v15 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v51;
    do
    {
      long long v19 = 0;
      do
      {
        if (*(void *)v51 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * (void)v19) setLocallyDisconnectedWithReasonIfNone:0];
        long long v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v17);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = v11;
  id v21 = [v20 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v47;
    do
    {
      long long v24 = 0;
      do
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * (void)v24) setCallStatus:2];
        long long v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v22);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v25 = v12;
  id v26 = [v25 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      __int16 v29 = 0;
      do
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * (void)v29) setCallStatus:1];
        __int16 v29 = (char *)v29 + 1;
      }
      while (v27 != v29);
      id v27 = [v25 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v27);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v30 = v13;
  id v31 = [v30 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v39;
    do
    {
      long long v34 = 0;
      do
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(v30);
        }
        objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * (void)v34), "setCallGroupUUID:", 0, (void)v38);
        long long v34 = (char *)v34 + 1;
      }
      while (v32 != v34);
      id v32 = [v30 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v32);
  }

  if ([v15 count])
  {
    long long v35 = [(CSDCallDataSource *)self callStateController];
    long long v36 = [v35 relayMessagingController];
    long long v37 = [v15 firstObject];
    [v36 sendDisconnectCurrentCallAndActivateHeldMessageToHostForDisconnectedCall:v37];
  }
}

- (void)handleLocalFrequencyChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v10 = [v4 object];

  id v6 = [(CSDCallDataSource *)self callStateController];
  id v7 = [v6 callController];
  id v8 = [v7 callContainer];
  id v9 = [v8 callsHostedElsewhere];
  [(CSDCallDataSource *)self handleFrequencyDataChanged:v10 inDirection:2 forCalls:v9];
}

- (void)handleRemoteFrequencyChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v10 = [v4 object];

  id v6 = [(CSDCallDataSource *)self callStateController];
  id v7 = [v6 callController];
  id v8 = [v7 callContainer];
  id v9 = [v8 callsHostedElsewhere];
  [(CSDCallDataSource *)self handleFrequencyDataChanged:v10 inDirection:1 forCalls:v9];
}

- (void)handleLocalMeterLevelChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v13 = [v4 object];

  [v13 floatValue];
  int v7 = v6;
  id v8 = [(CSDCallDataSource *)self callStateController];
  id v9 = [v8 callController];
  id v10 = [v9 callContainer];
  id v11 = [v10 callsHostedElsewhere];
  LODWORD(v12) = v7;
  [(CSDCallDataSource *)self handleMeterLevelChanged:2 inDirection:v11 forCalls:v12];
}

- (void)handleRemoteMeterLevelChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v13 = [v4 object];

  [v13 floatValue];
  int v7 = v6;
  id v8 = [(CSDCallDataSource *)self callStateController];
  id v9 = [v8 callController];
  id v10 = [v9 callContainer];
  id v11 = [v10 callsHostedElsewhere];
  LODWORD(v12) = v7;
  [(CSDCallDataSource *)self handleMeterLevelChanged:1 inDirection:v11 forCalls:v12];
}

- (void)handleMutedChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification: %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v7 = [(CSDCallDataSource *)self callStateController];
  id v8 = [v7 callController];
  id v9 = [v8 callContainer];
  id v10 = [v9 callsHostedElsewhere];

  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) propertiesChanged];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)handleSendingAudioChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification: %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v7 = [(CSDCallDataSource *)self callStateController];
  id v8 = [v7 callController];
  id v9 = [v8 callContainer];
  id v10 = [v9 callsHostedElsewhere];

  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) propertiesChanged];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

@end