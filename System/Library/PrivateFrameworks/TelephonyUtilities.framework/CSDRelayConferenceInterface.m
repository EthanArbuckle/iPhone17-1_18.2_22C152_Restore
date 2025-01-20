@interface CSDRelayConferenceInterface
+ (CSDRelayConferenceInterface)sharedInstance;
+ (id)sharedInstanceWithQueue:(id)a3;
- (BOOL)isMutedForIdentifier:(id)a3;
- (BOOL)isSendingAudioForIdentifier:(id)a3;
- (CSDAVConference)activeConference;
- (CSDRelayConferenceInterface)initWithSerialQueue:(id)a3;
- (NSMutableArray)conferenceConnections;
- (NSMutableSet)conferencesAwaitingConnectionClose;
- (OS_dispatch_queue)queue;
- (double)closeConnectionTimeout;
- (double)connectionTimeout;
- (double)prepareToStopTimeout;
- (id)_conferenceConnectionsForConference:(id)a3;
- (id)activeConferenceConnectionForIdentifier:(id)a3;
- (id)conferenceConnectionForIdentifier:(id)a3;
- (id)conferenceCreationBlock;
- (int64_t)inputAudioPowerSpectrumTokenForIdentifier:(id)a3;
- (int64_t)outputAudioPowerSpectrumTokenForIdentifier:(id)a3;
- (int64_t)spatialAudioSourceIdentifierForIdentifier:(id)a3;
- (void)_cleanUpAllConferenceConnectionsForConference:(id)a3 withError:(id)a4;
- (void)_cleanUpConferenceConnection:(id)a3 error:(id)a4;
- (void)_postDidCloseNotificationForConference:(id)a3;
- (void)_postDidCloseNotificationForConferenceIfNecessary:(id)a3;
- (void)_prepareConferenceForConferenceConnection:(id)a3 remoteInviteDictionary:(id)a4;
- (void)_stopConference:(id)a3;
- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5;
- (void)conference:(id)a3 endedWithReason:(int64_t)a4 error:(id)a5;
- (void)conference:(id)a3 inputFrequencyLevelChangedTo:(id)a4;
- (void)conference:(id)a3 inputLevelChangedTo:(float)a4;
- (void)conference:(id)a3 outputFrequencyLevelChangedTo:(id)a4;
- (void)conference:(id)a3 outputLevelChangedTo:(float)a4;
- (void)conferenceFinishedPreparing:(id)a3;
- (void)conferenceStarted:(id)a3;
- (void)connectionClosedForConference:(id)a3;
- (void)dealloc;
- (void)mutedChangedForConference:(id)a3;
- (void)prepareConferenceConnection:(id)a3 remoteInviteDictionary:(id)a4 completion:(id)a5;
- (void)prepareConferenceForCall:(id)a3 remoteInviteDictionary:(id)a4 completion:(id)a5;
- (void)prepareToStopConferenceForIdentifier:(id)a3;
- (void)sendData:(id)a3 throughConferenceForIdentifier:(id)a4;
- (void)sendingAudioChangedForConference:(id)a3;
- (void)setCloseConnectionTimeout:(double)a3;
- (void)setConferenceActiveForIdentifier:(id)a3;
- (void)setConferenceConnections:(id)a3;
- (void)setConferenceCreationBlock:(id)a3;
- (void)setConferencesAwaitingConnectionClose:(id)a3;
- (void)setConnectionTimeout:(double)a3;
- (void)setMuted:(BOOL)a3 forIdentifier:(id)a4;
- (void)setPrepareToStopTimeout:(double)a3;
- (void)setQueue:(id)a3;
- (void)setSendingAudio:(BOOL)a3 forIdentifier:(id)a4;
- (void)startConferenceForIdentifier:(id)a3 usingTransport:(id)a4 remoteInviteDictionary:(id)a5 didStartHandler:(id)a6 didStopHandler:(id)a7;
- (void)stopConferenceForIdentifier:(id)a3;
- (void)updateConferenceForIdentifier:(id)a3 isUsingBaseband:(BOOL)a4 disableAudio:(BOOL)a5 isTinCan:(BOOL)a6;
- (void)uplinkMutedStatusChanged:(id)a3;
@end

@implementation CSDRelayConferenceInterface

+ (CSDRelayConferenceInterface)sharedInstance
{
  return (CSDRelayConferenceInterface *)+[CSDRelayConferenceInterface sharedInstanceWithQueue:&_dispatch_main_q];
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D816C;
  block[3] = &unk_100504EC0;
  id v8 = a3;
  uint64_t v3 = qword_10058C398;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10058C398, block);
  }
  id v5 = (id)qword_10058C390;

  return v5;
}

- (CSDRelayConferenceInterface)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSDRelayConferenceInterface;
  v6 = [(CSDRelayConferenceInterface *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = +[NSMutableArray array];
    conferenceConnections = v7->_conferenceConnections;
    v7->_conferenceConnections = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableSet set];
    conferencesAwaitingConnectionClose = v7->_conferencesAwaitingConnectionClose;
    v7->_conferencesAwaitingConnectionClose = (NSMutableSet *)v10;

    id conferenceCreationBlock = v7->_conferenceCreationBlock;
    v7->_id conferenceCreationBlock = &stru_100507190;

    *(_OWORD *)&v7->_connectionTimeout = xmmword_10048D9A0;
    v7->_prepareToStopTimeout = 10.0;
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v7 selector:"uplinkMutedStatusChanged:" name:TUAudioSystemUplinkMuteStatusChangedNotification object:0];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDRelayConferenceInterface;
  [(CSDRelayConferenceInterface *)&v4 dealloc];
}

- (void)uplinkMutedStatusChanged:(id)a3
{
  uint64_t v3 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_async(v3, &stru_1005071B0);
}

- (BOOL)isMutedForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v4];

  if (v6)
  {
    v7 = [v6 conference];
    unsigned __int8 v8 = [v7 isMuted];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)setMuted:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v6];
  unsigned int v9 = [(CSDRelayConferenceInterface *)self isMutedForIdentifier:v6];
  if (!v8)
  {
    v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(CSDRelayConferenceInterface *)self conferenceConnections];
      int v14 = 138412546;
      *(void *)objc_super v15 = v6;
      *(_WORD *)&v15[8] = 2112;
      *(void *)&v15[10] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] setMuted:forIdentifier: no conference connection found for identifier %@. All conference connections: %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_8;
  }
  if (v9 != v4)
  {
    uint64_t v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109378;
      *(_DWORD *)objc_super v15 = v4;
      *(_WORD *)&v15[4] = 2112;
      *(void *)&v15[6] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting muted to %d for %@", (uint8_t *)&v14, 0x12u);
    }

    v11 = +[TUAudioSystemController sharedAudioSystemController];
    [v11 setUplinkMuted:v4];

    v12 = [v8 conference];
    [v12 setMuted:v4];
LABEL_8:
  }
}

- (BOOL)isSendingAudioForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v4];

  if (v6)
  {
    v7 = [v6 conference];
    unsigned __int8 v8 = [v7 isSendingAudio];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (int64_t)inputAudioPowerSpectrumTokenForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v4];

  if (v6)
  {
    v7 = [v6 conference];
    id v8 = [v7 inputAudioPowerSpectrumToken];
  }
  else
  {
    id v8 = 0;
  }

  return (int64_t)v8;
}

- (int64_t)outputAudioPowerSpectrumTokenForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v4];

  if (v6)
  {
    v7 = [v6 conference];
    id v8 = [v7 outputAudioPowerSpectrumToken];
  }
  else
  {
    id v8 = 0;
  }

  return (int64_t)v8;
}

- (int64_t)spatialAudioSourceIdentifierForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v4];

  if (v6)
  {
    v7 = [v6 conference];
    id v8 = [v7 callID];
  }
  else
  {
    id v8 = 0;
  }

  return (int64_t)v8;
}

- (void)setSendingAudio:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v6];
  unsigned int v9 = v8;
  if (!v8)
  {
    v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [(CSDRelayConferenceInterface *)self conferenceConnections];
      int v15 = 138412546;
      *(void *)v16 = v6;
      *(_WORD *)&v16[8] = 2112;
      *(void *)&v16[10] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] setSendingAudio:forIdentifier: no conference connection found for identifier %@. All conference connections: %@", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_8;
  }
  uint64_t v10 = [v8 conference];
  unsigned int v11 = [v10 isSendingAudio];

  if (v11 != v4)
  {
    v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109378;
      *(_DWORD *)v16 = v4;
      *(_WORD *)&v16[4] = 2112;
      *(void *)&v16[6] = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting sending audio to %d for %@", (uint8_t *)&v15, 0x12u);
    }

    v13 = [v9 conference];
    [v13 setSendingAudio:v4];
LABEL_8:
  }
}

- (void)prepareConferenceConnection:(id)a3 remoteInviteDictionary:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  uint64_t v10 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v10);

  unsigned int v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Asked to prepare conference connection %@ remoteInviteDictionary %@", buf, 0x16u);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v12 = [(CSDRelayConferenceInterface *)self conferenceConnections];
  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v32;
LABEL_5:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v32 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
      if (([v17 isPreparedToStop] & 1) == 0)
      {
        v18 = [v17 conference];
        unsigned int v19 = [v18 state];

        if (v19 - 2 < 2 || (v19 - 4 <= 1 ? (BOOL v20 = v9 == 0) : (BOOL v20 = 1), !v20))
        {
          uint64_t v21 = [v17 conference];
          if (v21) {
            break;
          }
        }
      }
      if (v14 == (id)++v16)
      {
        id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v14) {
          goto LABEL_5;
        }
        goto LABEL_17;
      }
    }
    v26 = (void *)v21;

    v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Not preparing a new conference because another conference already exists: %@", buf, 0xCu);
    }

    [v8 setConference:v26];
    v25 = v30;
    [v8 setDidPrepareHandler:v30];
    v28 = [(CSDRelayConferenceInterface *)self conferenceConnections];
    [v28 addObject:v8];

    if ((int)[v26 state] >= 3)
    {
      v23 = [v26 localInviteDictionary];
      [v8 invokeDidPrepareIfNecessary:v23];
      goto LABEL_27;
    }
  }
  else
  {
LABEL_17:

    v22 = [v8 identifier];
    v23 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v22];

    if (v23)
    {
      v24 = sub_100008DCC();
      v25 = v30;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1003AA82C((uint64_t)v23, v24);
      }
    }
    else
    {
      v25 = v30;
      [v8 setDidPrepareHandler:v30];
      v29 = [(CSDRelayConferenceInterface *)self conferenceConnections];
      [v29 addObject:v8];

      [(CSDRelayConferenceInterface *)self _prepareConferenceForConferenceConnection:v8 remoteInviteDictionary:v9];
    }
    v26 = 0;
LABEL_27:
  }
}

- (void)prepareConferenceForCall:(id)a3 remoteInviteDictionary:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned int v11 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v11);

  v12 = [[CSDRelayConferenceConnection alloc] initWithCall:v10];
  [(CSDRelayConferenceInterface *)self prepareConferenceConnection:v12 remoteInviteDictionary:v9 completion:v8];
}

- (void)startConferenceForIdentifier:(id)a3 usingTransport:(id)a4 remoteInviteDictionary:(id)a5 didStartHandler:(id)a6 didStopHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (Block_layout *)a6;
  uint64_t v16 = (Block_layout *)a7;
  v17 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v17);

  v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 138412290;
    id v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Asked to start conference for identifier %@", (uint8_t *)&v34, 0xCu);
  }

  unsigned int v19 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v12];
  BOOL v20 = v19;
  if (v19)
  {
    [v19 setTransport:v13];
    if (v15) {
      uint64_t v21 = v15;
    }
    else {
      uint64_t v21 = &stru_1005071F0;
    }
    [v20 setDidStartHandler:v21];
    if (v16) {
      v22 = v16;
    }
    else {
      v22 = &stru_100507210;
    }
    [v20 setDidStopHandler:v22];
    v23 = [(CSDRelayConferenceInterface *)self activeConference];

    if (v23)
    {
      v24 = sub_100008DCC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "We already have an active conference. Invoking this conference connection's didStart immediately", (uint8_t *)&v34, 2u);
      }

      v25 = [(CSDRelayConferenceInterface *)self activeConference];
      [v20 setConference:v25];

      v26 = [v20 identifier];
      [(CSDRelayConferenceInterface *)self setConferenceActiveForIdentifier:v26];

      [v20 invokeDidStartIfNecessary:1 error:0];
    }
    else
    {
      v28 = [v20 conference];
      v29 = [v28 remoteInviteDictionary];

      if (!v29)
      {
        if (v14)
        {
          id v30 = [v20 conference];
          [v30 setRemoteInviteDictionary:v14];
        }
        else
        {
          id v31 = [v20 isHost];
          id v30 = [v20 conference];
          [v30 setCaller:v31];
        }
      }
      long long v32 = [v20 conference];
      long long v33 = [v20 transport];
      [v32 startConnectionWithTransport:v33];
    }
  }
  else
  {
    v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1003AA8A4((uint64_t)v12, self, v27);
    }
  }
}

- (void)sendData:(id)a3 throughConferenceForIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Asked to send data to conference for identifier %@", (uint8_t *)&v12, 0xCu);
  }

  id v10 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v6];
  unsigned int v11 = [v10 conference];
  [v11 sendData:v7];
}

- (void)updateConferenceForIdentifier:(id)a3 isUsingBaseband:(BOOL)a4 disableAudio:(BOOL)a5 isTinCan:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  unsigned int v11 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v11);

  int v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138413058;
    id v24 = v10;
    __int16 v25 = 1024;
    *(_DWORD *)v26 = v8;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v7;
    __int16 v27 = 1024;
    BOOL v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Asked to update conference for identifier %@ with isUsingBaseband=%d disableAudio=%d isTinCan=%d", (uint8_t *)&v23, 0x1Eu);
  }

  id v13 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v10];
  id v14 = v13;
  if (v13)
  {
    [v13 setUsingBaseband:v8];
    [v14 setAudioDisabled:v7];
    [v14 setTinCan:v6];
    uint64_t v15 = [v14 conference];
    uint64_t v16 = [v14 capabilities];
    [v15 updateCapabilities:v16];

    unsigned int v17 = [v14 deviceRole];
    v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412546;
      id v24 = v10;
      __int16 v25 = 1024;
      *(_DWORD *)v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating device role for identifier %@ to %d", (uint8_t *)&v23, 0x12u);
    }

    id v19 = [v14 deviceRole];
    BOOL v20 = [v14 conference];
    [v20 setDeviceRole:v19];

    -[CSDRelayConferenceInterface setSendingAudio:forIdentifier:](self, "setSendingAudio:forIdentifier:", [v14 isAudioDisabled] ^ 1, v10);
  }
  else
  {
    uint64_t v21 = sub_100008DCC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(CSDRelayConferenceInterface *)self conferenceConnections];
      int v23 = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      *(void *)v26 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Did not find conference connection for identifier %@. All conference connections: %@", (uint8_t *)&v23, 0x16u);
    }
  }
}

- (void)setConferenceActiveForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v4];

  if (v6)
  {
    BOOL v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting conference connection active: %@", (uint8_t *)&v9, 0xCu);
    }

    BOOL v8 = [v6 identifier];
    -[CSDRelayConferenceInterface updateConferenceForIdentifier:isUsingBaseband:disableAudio:isTinCan:](self, "updateConferenceForIdentifier:isUsingBaseband:disableAudio:isTinCan:", v8, [v6 isUsingBaseband], 0, objc_msgSend(v6, "isTinCan"));
  }
}

- (void)prepareToStopConferenceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to prepare to stop conference for identifier %@", buf, 0xCu);
  }

  BOOL v7 = [(CSDRelayConferenceInterface *)self activeConferenceConnectionForIdentifier:v4];
  BOOL v8 = v7;
  if (v7)
  {
    [v7 setPreparedToStop:1];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v9 = [v8 conference];
    id v10 = [(CSDRelayConferenceInterface *)self _conferenceConnectionsForConference:v9];

    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        id v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          if (![*(id *)(*((void *)&v22 + 1) + 8 * (void)v14) isPreparedToStop])
          {

            goto LABEL_16;
          }
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Pausing audio and setting up timeout for conference connection: %@", buf, 0xCu);
    }

    uint64_t v16 = [v8 conference];
    [v16 setSendingAudio:0];

    [(CSDRelayConferenceInterface *)self prepareToStopTimeout];
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
    id v19 = [(CSDRelayConferenceInterface *)self queue];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000D9908;
    v20[3] = &unk_100504F10;
    v20[4] = self;
    id v21 = v8;
    dispatch_after(v18, v19, v20);
  }
LABEL_16:
}

- (void)stopConferenceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to stop conference for identifier %@", (uint8_t *)&v10, 0xCu);
  }

  BOOL v7 = [(CSDRelayConferenceInterface *)self conferenceConnectionForIdentifier:v4];
  if (v7)
  {
    [(CSDRelayConferenceInterface *)self _cleanUpConferenceConnection:v7 error:0];
  }
  else
  {
    BOOL v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(CSDRelayConferenceInterface *)self conferenceConnections];
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Did not find conference connection for identifier %@. All conference connections: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (id)activeConferenceConnectionForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v6 = [(CSDRelayConferenceInterface *)self conferenceConnections];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 identifier];
        if ([v11 isEqualToString:v4]
          && ![v10 isPreparedToStop])
        {
          __int16 v12 = [v10 conference];
          int v13 = [v12 state];

          if (v13 <= 5)
          {
            id v7 = v10;
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v7;
}

- (id)conferenceConnectionForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v6 = [(CSDRelayConferenceInterface *)self conferenceConnections];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 identifier];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_conferenceConnectionsForConference:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(CSDRelayConferenceInterface *)self conferenceConnections];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 conference];

        if (v13 == v4) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v14 = [v6 copy];

  return v14;
}

- (CSDAVConference)activeConference
{
  uint64_t v3 = [(CSDRelayConferenceInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CSDRelayConferenceInterface *)self conferenceConnections];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v8 isPreparedToStop] & 1) == 0)
        {
          id v9 = [v8 conference];
          if ([v9 state] == 4)
          {

LABEL_13:
            id v5 = [v8 conference];
            goto LABEL_14;
          }
          uint64_t v10 = [v8 conference];
          unsigned int v11 = [v10 state];

          if (v11 == 5) {
            goto LABEL_13;
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (CSDAVConference *)v5;
}

- (void)_prepareConferenceForConferenceConnection:(id)a3 remoteInviteDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDRelayConferenceInterface *)self conferenceCreationBlock];
  id v9 = v8[2]();
  [v7 setConference:v9];

  uint64_t v10 = [v7 conference];
  [v10 setDelegate:self];

  unsigned int v11 = [(CSDRelayConferenceInterface *)self queue];
  unsigned int v12 = [v7 conference];
  [v12 setDelegateQueue:v11];

  [(CSDRelayConferenceInterface *)self connectionTimeout];
  double v14 = v13;
  long long v15 = [v7 conference];
  [v15 setConnectionTimeout:v14];

  long long v18 = objc_alloc_init(CSDAVConferenceConfiguration);
  [(CSDAVConferenceConfiguration *)v18 setCaller:v6 == 0];
  long long v16 = [v7 capabilities];
  [(CSDAVConferenceConfiguration *)v18 setCapabilities:v16];

  [(CSDAVConferenceConfiguration *)v18 setRequiresInviteDictionary:1];
  [(CSDAVConferenceConfiguration *)v18 setRemoteInviteDictionary:v6];

  long long v17 = [v7 conference];

  [v17 prepareWithConfiguration:v18];
}

- (void)_cleanUpAllConferenceConnectionsForConference:(id)a3 withError:(id)a4
{
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = -[CSDRelayConferenceInterface _conferenceConnectionsForConference:](self, "_conferenceConnectionsForConference:", a3, 0);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      unsigned int v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CSDRelayConferenceInterface *)self _cleanUpConferenceConnection:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) error:v6];
        unsigned int v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_cleanUpConferenceConnection:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDRelayConferenceInterface *)self conferenceConnections];
  unsigned int v9 = [v8 containsObject:v6];

  if (v9)
  {
    uint64_t v10 = [(CSDRelayConferenceInterface *)self conferenceConnections];
    [v10 removeObject:v6];

    unsigned int v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cleaning up conference connection %@", buf, 0xCu);
    }

    [v6 invokeDidPrepareIfNecessary:0];
    NSErrorUserInfoKey v34 = NSLocalizedFailureReasonErrorKey;
    long long v12 = +[NSString stringWithFormat:@"Conference cleaned up before handling a didStart with error: %@", v7];
    id v35 = v12;
    long long v13 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    long long v14 = +[NSError errorWithDomain:@"com.apple.telephonyutilities" code:1 userInfo:v13];
    [v6 invokeDidStartIfNecessary:0 error:v14];

    [v6 invokeDidStopIfNecessary:v7 == 0 error:v7];
    long long v15 = [v6 conference];
    long long v16 = [(CSDRelayConferenceInterface *)self _conferenceConnectionsForConference:v15];

    if ([v16 count]
      || ([v6 conference],
          long long v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v17 state],
          v17,
          v18 < 4))
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v19 = v16;
      id v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v20)
      {
        id v21 = v20;
        v26 = v16;
        id v27 = v7;
        id v28 = v6;
        uint64_t v22 = *(void *)v30;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if ([v24 isPreparedToStop])
            {
              long long v25 = sub_100008DCC();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v37 = v24;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Also cleaning up conference connection which is already prepared to stop %@", buf, 0xCu);
              }

              [(CSDRelayConferenceInterface *)self _cleanUpConferenceConnection:v24 error:0];
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v21);
        id v7 = v27;
        id v6 = v28;
        long long v16 = v26;
      }
    }
    else
    {
      id v19 = [v6 conference];
      [(CSDRelayConferenceInterface *)self _stopConference:v19];
    }
  }
}

- (void)_stopConference:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CFStringRef v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Calling stop on conference %@", (uint8_t *)&v9, 0xCu);
  }

  [(__CFString *)v4 stop];
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CFStringRef v10 = @"CSDRelayConferenceConnectionWillCloseNotification";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"CSDRelayConferenceConnectionWillCloseNotification" object:0];

  id v8 = [(CSDRelayConferenceInterface *)self conferencesAwaitingConnectionClose];
  [v8 addObject:v4];
}

- (void)_postDidCloseNotificationForConferenceIfNecessary:(id)a3
{
  id v7 = a3;
  id v4 = [(CSDRelayConferenceInterface *)self conferencesAwaitingConnectionClose];
  unsigned int v5 = [v4 containsObject:v7];

  if (v5)
  {
    id v6 = [(CSDRelayConferenceInterface *)self conferencesAwaitingConnectionClose];
    [v6 removeObject:v7];

    [(CSDRelayConferenceInterface *)self _postDidCloseNotificationForConference:v7];
  }
}

- (void)_postDidCloseNotificationForConference:(id)a3
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    CFStringRef v6 = @"CSDRelayConferenceConnectionDidCloseNotification";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CSDRelayConferenceConnectionDidCloseNotification" object:0];
}

- (void)conference:(id)a3 didReceiveData:(id)a4 forCallID:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  CFStringRef v25 = @"CSDRelayConferenceConnectionDidReceiveDataNotificationDataKey";
  id v26 = v8;
  CFStringRef v10 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v18 = v7;
  unsigned int v11 = [(CSDRelayConferenceInterface *)self _conferenceConnectionsForConference:v7];
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v15);
        long long v17 = +[NSNotificationCenter defaultCenter];
        [v17 postNotificationName:@"CSDRelayConferenceConnectionDidReceiveDataNotification" object:v16 userInfo:v10];

        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)conferenceFinishedPreparing:(id)a3
{
  id v4 = a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CFStringRef v6 = -[CSDRelayConferenceInterface _conferenceConnectionsForConference:](self, "_conferenceConnectionsForConference:", v4, 0);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      CFStringRef v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
        id v12 = [v4 localInviteDictionary];
        [v11 invokeDidPrepareIfNecessary:v12];

        CFStringRef v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)conferenceStarted:(id)a3
{
  id v4 = a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  CFStringRef v6 = -[CSDRelayConferenceInterface _conferenceConnectionsForConference:](self, "_conferenceConnectionsForConference:", v4, 0);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      CFStringRef v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) invokeDidStartIfNecessary:1 error:0];
        CFStringRef v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)conference:(id)a3 endedWithReason:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  CFStringRef v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v20 = a4;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "reason: %ld error: %@", buf, 0x16u);
  }

  [(CSDRelayConferenceInterface *)self _cleanUpAllConferenceConnectionsForConference:v8 withError:v9];
  if ((unint64_t)a4 <= 7)
  {
    if (((1 << a4) & 0xFA) != 0)
    {
      long long v11 = sub_100008DCC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1003AAA2C((uint64_t)v9, a4, v11);
      }

      [(CSDRelayConferenceInterface *)self _postDidCloseNotificationForConference:v8];
    }
    else
    {
      long long v12 = sub_100008DCC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting up close connection timeout because conference ended reason was normal", buf, 2u);
      }

      long long v13 = [(CSDRelayConferenceInterface *)self conferencesAwaitingConnectionClose];
      [v13 addObject:v8];

      [(CSDRelayConferenceInterface *)self closeConnectionTimeout];
      dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
      long long v16 = [(CSDRelayConferenceInterface *)self queue];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000DB0D8;
      v17[3] = &unk_100504F10;
      v17[4] = self;
      id v18 = v8;
      dispatch_after(v15, v16, v17);
    }
  }
}

- (void)connectionClosedForConference:(id)a3
{
  id v4 = a3;
  int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }

  [(CSDRelayConferenceInterface *)self _cleanUpAllConferenceConnectionsForConference:v4 withError:0];
  [(CSDRelayConferenceInterface *)self _postDidCloseNotificationForConferenceIfNecessary:v4];
}

- (void)mutedChangedForConference:(id)a3
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CSDRelayConferenceMutedChangedNotification" object:0];
}

- (void)sendingAudioChangedForConference:(id)a3
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CSDRelayConferenceSendingAudioChangedNotification" object:0];
}

- (void)conference:(id)a3 inputFrequencyLevelChangedTo:(id)a4
{
  id v4 = a4;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"CSDRelayConferenceLocalFrequencyChangedNotification" object:v4];
}

- (void)conference:(id)a3 outputFrequencyLevelChangedTo:(id)a4
{
  id v4 = a4;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"CSDRelayConferenceRemoteFrequencyChangedNotification" object:v4];
}

- (void)conference:(id)a3 inputLevelChangedTo:(float)a4
{
  id v7 = +[NSNotificationCenter defaultCenter];
  *(float *)&double v5 = a4;
  CFStringRef v6 = +[NSNumber numberWithFloat:v5];
  [v7 postNotificationName:@"CSDRelayConferenceLocalMeterLevelChangedNotification" object:v6];
}

- (void)conference:(id)a3 outputLevelChangedTo:(float)a4
{
  id v7 = +[NSNotificationCenter defaultCenter];
  *(float *)&double v5 = a4;
  CFStringRef v6 = +[NSNumber numberWithFloat:v5];
  [v7 postNotificationName:@"CSDRelayConferenceRemoteMeterLevelChangedNotification" object:v6];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)conferenceConnections
{
  return self->_conferenceConnections;
}

- (void)setConferenceConnections:(id)a3
{
}

- (NSMutableSet)conferencesAwaitingConnectionClose
{
  return self->_conferencesAwaitingConnectionClose;
}

- (void)setConferencesAwaitingConnectionClose:(id)a3
{
}

- (id)conferenceCreationBlock
{
  return self->_conferenceCreationBlock;
}

- (void)setConferenceCreationBlock:(id)a3
{
}

- (double)connectionTimeout
{
  return self->_connectionTimeout;
}

- (void)setConnectionTimeout:(double)a3
{
  self->_connectionTimeout = a3;
}

- (double)closeConnectionTimeout
{
  return self->_closeConnectionTimeout;
}

- (void)setCloseConnectionTimeout:(double)a3
{
  self->_closeConnectionTimeout = a3;
}

- (double)prepareToStopTimeout
{
  return self->_prepareToStopTimeout;
}

- (void)setPrepareToStopTimeout:(double)a3
{
  self->_prepareToStopTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_conferenceCreationBlock, 0);
  objc_storeStrong((id *)&self->_conferencesAwaitingConnectionClose, 0);
  objc_storeStrong((id *)&self->_conferenceConnections, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end