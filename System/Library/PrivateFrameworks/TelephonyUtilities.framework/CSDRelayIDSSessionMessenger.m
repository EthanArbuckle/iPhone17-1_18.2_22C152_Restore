@interface CSDRelayIDSSessionMessenger
- (BOOL)deviceOrDestinationWithActiveSessionCanReceiveMessagesForCallProvider:(id)a3 needsConversationRelaySupport:(BOOL)a4;
- (CSDRelayIDSDualSession)currentSession;
- (CSDRelayIDSDualSession)waitingSession;
- (CSDRelayIDSSessionMessenger)initWithQueue:(id)a3 localRouteController:(id)a4;
- (CSDRouteController)localRouteController;
- (IDSDestination)destinationWithActiveSession;
- (IDSDevice)deviceWithActiveSession;
- (NSMutableArray)sessions;
- (OS_dispatch_queue)queue;
- (id)_createSessionToDestinations:(id)a3;
- (id)_createSessionToDevices:(id)a3;
- (id)_createSessionsToAllDevicesSupportingProvider:(id)a3 requiresConversationRelaySupport:(BOOL)a4;
- (id)activeSessionForIdentifier:(id)a3;
- (id)deviceForFromID:(id)a3;
- (id)sessionForIdentifier:(id)a3;
- (int)sessionProtocolVersionForIdentifier:(id)a3;
- (void)_destroySession:(id)a3;
- (void)_sendMessage:(id)a3 andCancelInvitationIfNecessaryForSession:(id)a4;
- (void)_sendMessage:(id)a3 andDeclineInvitationIfNecessaryForSession:(id)a4;
- (void)_startSession:(id)a3 withMessage:(id)a4 identifiers:(id)a5 timeout:(int64_t)a6 declineOnError:(BOOL)a7;
- (void)acceptInvitationForIdentifier:(id)a3;
- (void)cancelOrDeclineInvitationForIdentifier:(id)a3;
- (void)dealloc;
- (void)endEndingSessions;
- (void)performBlockOnTransportAvailability:(id)a3 forIdentifier:(id)a4;
- (void)prepareConnectedSessionsToEnd;
- (void)prepareSessionToEndForIdentifier:(id)a3;
- (void)sendMessage:(id)a3 andAcceptInvitationIfNecessaryForIdentifier:(id)a4;
- (void)sendMessage:(id)a3 andCancelOrDeclineInvitationIfNecessaryForIdentifier:(id)a4;
- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifier:(id)a4 toDestination:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7;
- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifier:(id)a4 toDevicesSupportingProvider:(id)a5 requiresConversationRelay:(BOOL)a6 withTimeout:(int64_t)a7;
- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifiers:(id)a4 toDestination:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
- (void)sendMessage:(id)a3 customizedForRemoteProtocolVersion:(id)a4 completionHandler:(id)a5;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4 customizedForRemoteProtocolVersion:(id)a5 completionHandler:(id)a6;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4 customizedForRemoteProtocolVersion:(id)a5 waitUntilConnected:(BOOL)a6 completionHandler:(id)a7;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4 toDestinations:(id)a5;
- (void)sendMessage:(id)a3 forIdentifier:(id)a4 toDestinations:(id)a5 customizedForRemoteProtocolVersion:(id)a6 waitUntilConnected:(BOOL)a7 completionHandler:(id)a8;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)session:(id)a3 endedWithReason:(int)a4;
- (void)session:(id)a3 receivedData:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)session:(id)a3 receivedInvitationAcceptWithData:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)session:(id)a3 receivedInvitationCancelWithData:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)session:(id)a3 receivedInvitationDeclineWithData:(id)a4 fromDestination:(id)a5 device:(id)a6;
- (void)setSessions:(id)a3;
@end

@implementation CSDRelayIDSSessionMessenger

- (CSDRelayIDSSessionMessenger)initWithQueue:(id)a3 localRouteController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CSDRelayIDSSessionMessenger;
  v9 = [(CSDRelayIDSSessionMessenger *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = +[NSMutableArray array];
    sessions = v10->_sessions;
    v10->_sessions = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_localRouteController, a4);
    v13 = +[CSDRelayIDSService sharedInstance];
    [v13 addServiceDelegate:v10 queue:v10->_queue];
  }
  return v10;
}

- (void)dealloc
{
  v3 = +[CSDRelayIDSService sharedInstance];
  [v3 removeServiceDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDRelayIDSSessionMessenger;
  [(CSDRelayIDSSessionMessenger *)&v4 dealloc];
}

- (void)performBlockOnTransportAvailability:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDRelayIDSSessionMessenger *)self activeSessionForIdentifier:v7];
  if (v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001CCB28;
    v10[3] = &unk_10050A298;
    uint64_t v11 = v6;
    [v8 performBlockOnTransportAvailability:v10];
    v9 = v11;
  }
  else
  {
    v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find session for identifier %@ to perform block on transport availability for. Dropping this block on the floor", buf, 0xCu);
    }
  }
}

- (IDSDestination)destinationWithActiveSession
{
  v2 = [(CSDRelayIDSSessionMessenger *)self currentSession];
  v3 = [v2 remoteDestination];

  return (IDSDestination *)v3;
}

- (IDSDevice)deviceWithActiveSession
{
  v2 = [(CSDRelayIDSSessionMessenger *)self currentSession];
  v3 = [v2 remoteDevice];

  return (IDSDevice *)v3;
}

- (id)_createSessionsToAllDevicesSupportingProvider:(id)a3 requiresConversationRelaySupport:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableSet) initWithArray:&__NSArray0__struct];
  id v8 = +[CSDRelayIDSService sharedInstance];
  v9 = [v8 devices];

  v10 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v16, "canReceiveMessagesForCallProvider:", v6, (void)v24)
          && (!v4 || [v16 canReceiveRelayedGFTCalls]))
        {
          v17 = [v16 destination];
          [v10 addObject:v17];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    v18 = [v10 copy];
    v19 = [(CSDRelayIDSSessionMessenger *)self _createSessionToDestinations:v18];
    [v7 addObject:v19];
  }
  else
  {
    v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        CFStringRef v20 = @"YES";
      }
      else {
        CFStringRef v20 = @"NO";
      }
      id v21 = objc_msgSend(v11, "count", (void)v24);
      *(_DWORD *)buf = 138412802;
      id v29 = v6;
      __int16 v30 = 2112;
      CFStringRef v31 = v20;
      __int16 v32 = 2048;
      id v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No primary devices found that support call provider %@, requiresConversationRelaySupport %@. primaryAccountDevices count: %lu, not creating a session.", buf, 0x20u);
    }
  }

  id v22 = [v7 copy];

  return v22;
}

- (id)_createSessionToDevices:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating session to devices: %@", buf, 0xCu);
  }

  v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v11 destination];
        if (v12)
        {
          [v5 addObject:v12];
        }
        else
        {
          id v13 = sub_100008DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] destination for device returned a nil value, so we are going to skip creating a session to it: %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];
  objc_super v15 = [(CSDRelayIDSSessionMessenger *)self _createSessionToDestinations:v14];

  return v15;
}

- (id)_createSessionToDestinations:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating session to destinations: %@", (uint8_t *)&v10, 0xCu);
  }

  if ([v3 count])
  {
    id v5 = objc_alloc((Class)IDSSession);
    id v6 = +[CSDRelayIDSService sharedInstance];
    id v7 = [v6 account];
    id v8 = [v5 initWithAccount:v7 destinations:v3 transportType:0];
  }
  else
  {
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Would have created a session to an empty destination set. Returning a nil session", (uint8_t *)&v10, 2u);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)_destroySession:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Destroying session %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(CSDRelayIDSSessionMessenger *)self sessions];
  [v6 removeObject:v4];

  [v4 setDelegate:0];
}

- (CSDRelayIDSDualSession)waitingSession
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CSDRelayIDSSessionMessenger *)self sessions];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    int v7 = 0;
    id v8 = v5;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      id v5 = *(id *)(*((void *)&v10 + 1) + 8 * (void)v7);

      if ([v5 state] == 1) {
        break;
      }
      int v7 = (char *)v7 + 1;
      id v8 = v5;
      if (v4 == v7)
      {
        id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v5 = 0;
  }

  return (CSDRelayIDSDualSession *)v5;
}

- (CSDRelayIDSDualSession)currentSession
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(CSDRelayIDSSessionMessenger *)self sessions];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    int v7 = 0;
    id v8 = v5;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      id v5 = *(id *)(*((void *)&v10 + 1) + 8 * (void)v7);

      if ((int)[v5 state] >= 2 && (int)objc_msgSend(v5, "state") < 4) {
        break;
      }
      int v7 = (char *)v7 + 1;
      id v8 = v5;
      if (v4 == v7)
      {
        id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }

        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    id v5 = 0;
  }

  return (CSDRelayIDSDualSession *)v5;
}

- (id)activeSessionForIdentifier:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CSDRelayIDSSessionMessenger *)self sessions];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 hasIdentifier:v4] && (int)objc_msgSend(v9, "state") <= 3)
        {
          id v6 = v9;
          goto LABEL_12;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)sessionForIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CSDRelayIDSSessionMessenger *)self sessions];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    long long v10 = 0;
    long long v11 = v8;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(id *)(*((void *)&v13 + 1) + 8 * (void)v10);

      if ([v8 hasIdentifier:v4]) {
        break;
      }
      long long v10 = (char *)v10 + 1;
      long long v11 = v8;
      if (v7 == v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v8 = 0;
  }

  return v8;
}

- (int)sessionProtocolVersionForIdentifier:(id)a3
{
  id v3 = [(CSDRelayIDSSessionMessenger *)self activeSessionForIdentifier:a3];
  int v4 = [v3 remoteProtocolVersion];

  return v4;
}

- (void)prepareSessionToEndForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to prepare session to end for identifier %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(CSDRelayIDSSessionMessenger *)self activeSessionForIdentifier:v4];
  [v6 prepareToEnd];
}

- (void)prepareConnectedSessionsToEnd
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asked to prepare connected sessions to end", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(CSDRelayIDSSessionMessenger *)self sessions];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 state] == 3) {
          [v9 prepareToEnd];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)acceptInvitationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accepting session for identifier %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:0];
  [(CSDRelayIDSSessionMessenger *)self sendMessage:v6 andAcceptInvitationIfNecessaryForIdentifier:v4];
}

- (void)cancelOrDeclineInvitationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceling/declining session for identifier %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [[CSDMessagingRelayMessage alloc] initWithType:0];
  [(CSDRelayIDSSessionMessenger *)self sendMessage:v6 andCancelOrDeclineInvitationIfNecessaryForIdentifier:v4];
}

- (void)endEndingSessions
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asked to end ending sessions", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(CSDRelayIDSSessionMessenger *)self sessions];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 state] == 4) {
          [v9 end];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_startSession:(id)a3 withMessage:(id)a4 identifiers:(id)a5 timeout:(int64_t)a6 declineOnError:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [v13 addProtocolVersion];
  long long v15 = [CSDIDSDualSessionProvider alloc];
  long long v16 = +[TUCallCenter sharedInstance];
  v17 = [v16 queue];
  long long v21 = [(CSDIDSDualSessionProvider *)v15 initWithSession:v14 queue:v17];

  id v18 = [[CSDRelayIDSDualSession alloc] initAsInitiatorWithSessionProvider:v21 identifiers:v12];
  [v18 setDelegate:self];
  [v18 setInvitationTimeout:(double)a6];
  long long v19 = [v13 data];

  [v18 sendDataAndSendInvitationIfNecessary:v19 declineOnError:v7];
  long long v20 = [(CSDRelayIDSSessionMessenger *)self sessions];
  [v20 addObject:v18];
}

- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifier:(id)a4 toDevicesSupportingProvider:(id)a5 requiresConversationRelay:(BOOL)a6 withTimeout:(int64_t)a7
{
  BOOL v8 = a6;
  id v52 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    long long v16 = [v52 typeString];
    *(_DWORD *)buf = 138413058;
    id v62 = v13;
    __int16 v63 = 2112;
    CFStringRef v64 = v15;
    __int16 v65 = 2112;
    v66 = v16;
    __int16 v67 = 2112;
    id v68 = v52;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sendMessageAndStartSessionIfNecessary for service %@ requiresConversationRelay %@ and message type %@: %@", buf, 0x2Au);
  }
  v17 = [(CSDRelayIDSSessionMessenger *)self activeSessionForIdentifier:v12];
  if (v17)
  {
    id v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1003B1168();
    }
    goto LABEL_9;
  }
  long long v20 = [(CSDRelayIDSSessionMessenger *)self currentSession];

  if (v20)
  {
    id v21 = v13;
    unsigned int v22 = [(CSDRelayIDSSessionMessenger *)self deviceOrDestinationWithActiveSessionCanReceiveMessagesForCallProvider:v13 needsConversationRelaySupport:v8];
    id v18 = sub_100008DCC();
    BOOL v23 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      id v13 = v21;
      if (v23)
      {
        if (v8) {
          CFStringRef v24 = @"YES";
        }
        else {
          CFStringRef v24 = @"NO";
        }
        long long v25 = [(CSDRelayIDSSessionMessenger *)self currentSession];
        *(_DWORD *)buf = 138412802;
        id v62 = v21;
        __int16 v63 = 2112;
        CFStringRef v64 = v24;
        __int16 v65 = 2112;
        v66 = v25;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "A session exists with a destination/device that supports provider %@ and support conversation relay %@ : %@", buf, 0x20u);
      }
      long long v26 = [(CSDRelayIDSSessionMessenger *)self currentSession];
      int v27 = [v26 remoteProtocolVersion];

      if (v27 > 0)
      {
        v28 = [(CSDRelayIDSSessionMessenger *)self deviceWithActiveSession];

        id v29 = sub_100008DCC();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Starting another session to the device", buf, 2u);
          }

          CFStringRef v31 = [(CSDRelayIDSSessionMessenger *)self deviceWithActiveSession];
          v58 = v31;
          __int16 v32 = +[NSArray arrayWithObjects:&v58 count:1];
          uint64_t v33 = [(CSDRelayIDSSessionMessenger *)self _createSessionToDevices:v32];
        }
        else
        {
          if (v30)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Starting another session to the destination", buf, 2u);
          }

          CFStringRef v31 = [(CSDRelayIDSSessionMessenger *)self destinationWithActiveSession];
          __int16 v32 = +[NSSet setWithObject:v31];
          uint64_t v33 = [(CSDRelayIDSSessionMessenger *)self _createSessionToDestinations:v32];
        }
        long long v19 = v33;

        id v13 = v21;
        if (v19)
        {
          id v57 = v12;
          v50 = +[NSArray arrayWithObjects:&v57 count:1];
          [(CSDRelayIDSSessionMessenger *)self _startSession:v19 withMessage:v52 identifiers:v50 timeout:a7 declineOnError:0];

LABEL_12:
          goto LABEL_13;
        }
LABEL_10:
        long long v19 = sub_100008DCC();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Did not create session", buf, 2u);
        }
        goto LABEL_12;
      }
      v47 = sub_100008DCC();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "We'll send this message via the existing session", buf, 2u);
      }

      v48 = [(CSDRelayIDSSessionMessenger *)self currentSession];
      [v48 addIdentifier:v12];

      id v18 = [(CSDRelayIDSSessionMessenger *)self currentSession];
      v49 = [v52 data];
      [v18 sendData:v49 waitUntilConnected:1 completion:0];
    }
    else if (v23)
    {
      CFStringRef v46 = @"NO";
      if (v8) {
        CFStringRef v46 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v13 = v21;
      id v62 = v21;
      __int16 v63 = 2112;
      CFStringRef v64 = v46;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] A session exists, but it's with a device that doesn't support provider %@ or requires conversation relay %@ and device does not support GFT relay. Not starting a new session", buf, 0x16u);
    }
    else
    {
      id v13 = v21;
    }
LABEL_9:

    goto LABEL_10;
  }
  v34 = sub_100008DCC();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v35 = @"NO";
    if (v8) {
      CFStringRef v35 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v62 = v13;
    __int16 v63 = 2112;
    CFStringRef v64 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No session exists. Starting a new one by inviting all devices that support provider %@ and support conversation relay if necessary %@", buf, 0x16u);
  }
  id v51 = v13;

  v36 = [v52 tuProvider];
  v37 = [(CSDRelayIDSSessionMessenger *)self _createSessionsToAllDevicesSupportingProvider:v36 requiresConversationRelaySupport:v8];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v38 = v37;
  id v39 = [v38 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v54;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        id v59 = v12;
        v44 = +[NSArray arrayWithObjects:&v59 count:1];
        [(CSDRelayIDSSessionMessenger *)self _startSession:v43 withMessage:v52 identifiers:v44 timeout:a7 declineOnError:0];
      }
      id v40 = [v38 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v40);
  }

  id v45 = [v38 count];
  id v13 = v51;
  if (!v45) {
    goto LABEL_10;
  }
LABEL_13:
}

- (BOOL)deviceOrDestinationWithActiveSessionCanReceiveMessagesForCallProvider:(id)a3 needsConversationRelaySupport:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(CSDRelayIDSSessionMessenger *)self destinationWithActiveSession];
  if ([v7 canReceiveMessagesForCallProvider:v6])
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    uint64_t v9 = [(CSDRelayIDSSessionMessenger *)self deviceWithActiveSession];
    unsigned __int8 v8 = [v9 canReceiveMessagesForCallProvider:v6];
  }
  if (v4)
  {
    long long v10 = [(CSDRelayIDSSessionMessenger *)self deviceWithActiveSession];
    if ([v10 canReceiveRelayedGFTCalls])
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      id v12 = [(CSDRelayIDSSessionMessenger *)self destinationWithActiveSession];
      id v13 = +[CSDRelayIDSService sharedInstance];
      id v14 = [v12 deviceForService:v13];
      unsigned __int8 v11 = [v14 canReceiveRelayedGFTCalls];
    }
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v8 & v11;
}

- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifier:(id)a4 toDestination:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7
{
  id v17 = a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  long long v16 = +[NSArray arrayWithObjects:&v17 count:1];

  -[CSDRelayIDSSessionMessenger sendMessage:andStartSessionIfNecessaryForIdentifiers:toDestination:timeout:completionHandler:](self, "sendMessage:andStartSessionIfNecessaryForIdentifiers:toDestination:timeout:completionHandler:", v15, v16, v13, a6, v12, v17);
}

- (void)sendMessage:(id)a3 andStartSessionIfNecessaryForIdentifiers:(id)a4 toDestination:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, uint64_t, uint64_t))a7;
  long long v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v12 typeString];
    *(_DWORD *)buf = 138412546;
    id v46 = v17;
    __int16 v47 = 2112;
    id v48 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "sendMessageAndStartSessionIfNecessary for message type %@: %@", buf, 0x16u);
  }
  id v18 = [v13 firstObject];
  long long v19 = [(CSDRelayIDSSessionMessenger *)self activeSessionForIdentifier:v18];

  if (v19)
  {
    long long v20 = sub_100008DCC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1003B11E4(v13, (uint64_t)v19, v20);
    }

LABEL_7:
    uint64_t v21 = 0;
    unsigned int v22 = 0;
    goto LABEL_8;
  }
  BOOL v23 = [(CSDRelayIDSSessionMessenger *)self currentSession];

  if (!v23)
  {
    v36 = sub_100008DCC();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    if (!v14)
    {
      if (v37)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "[WARN] No IDSSession exists, and given device is nil. We can't start this session", buf, 2u);
      }

      goto LABEL_7;
    }
    if (v37)
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v14;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "No IDSSession exists. Starting a new one by inviting to destination %@", buf, 0xCu);
    }

    __int16 v32 = +[NSSet setWithObject:v14];
    unsigned int v22 = [(CSDRelayIDSSessionMessenger *)self _createSessionToDestinations:v32];
LABEL_23:

    if (v22)
    {
      uint64_t v21 = 1;
      [(CSDRelayIDSSessionMessenger *)self _startSession:v22 withMessage:v12 identifiers:v13 timeout:a6 declineOnError:1];
    }
    else
    {
      uint64_t v21 = 0;
    }
LABEL_8:
    if (v15) {
      v15[2](v15, v21, 1);
    }
    goto LABEL_10;
  }
  CFStringRef v24 = sub_100008DCC();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    long long v25 = [(CSDRelayIDSSessionMessenger *)self currentSession];
    *(_DWORD *)buf = 138412290;
    id v46 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "A session exists: %@", buf, 0xCu);
  }
  long long v26 = [(CSDRelayIDSSessionMessenger *)self currentSession];
  int v27 = [v26 remoteProtocolVersion];

  v28 = sub_100008DCC();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v27 > 0)
  {
    id v42 = v14;
    if (v29)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Starting a new session to the destination of the device with an active session", buf, 2u);
    }

    BOOL v30 = [(CSDRelayIDSSessionMessenger *)self deviceWithActiveSession];
    CFStringRef v31 = [v30 destination];

    if (!v31)
    {
      uint64_t v41 = sub_100008DCC();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[WARN] Cannot start a new session, no valid destination", buf, 2u);
      }

      uint64_t v21 = 0;
      unsigned int v22 = 0;
      goto LABEL_8;
    }
    __int16 v32 = [(CSDRelayIDSSessionMessenger *)self deviceWithActiveSession];
    uint64_t v33 = [v32 destination];
    +[NSSet setWithObject:v33];
    CFStringRef v35 = v34 = a6;
    unsigned int v22 = [(CSDRelayIDSSessionMessenger *)self _createSessionToDestinations:v35];

    a6 = v34;
    id v14 = v42;
    goto LABEL_23;
  }
  if (v29)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Sending the message through the existing session", buf, 2u);
  }

  id v38 = [(CSDRelayIDSSessionMessenger *)self currentSession];
  [v38 addIdentifiers:v13];

  id v39 = [(CSDRelayIDSSessionMessenger *)self currentSession];
  id v40 = [v12 data];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001CED6C;
  v43[3] = &unk_10050A2C0;
  v44 = v15;
  [v39 sendData:v40 waitUntilConnected:1 completion:v43];

  unsigned int v22 = 0;
  id v15 = 0;
LABEL_10:
}

- (void)sendMessage:(id)a3 andAcceptInvitationIfNecessaryForIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 typeString];
    int v28 = 138412802;
    id v29 = v7;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sendMessage:andAcceptInvitationIfNecessaryForIdentifier for identifier %@ and message type %@: %@", (uint8_t *)&v28, 0x20u);
  }
  [v6 addProtocolVersion];
  long long v10 = [(CSDRelayIDSSessionMessenger *)self activeSessionForIdentifier:v7];
  unsigned __int8 v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Session for identifier is %@", (uint8_t *)&v28, 0xCu);
  }

  id v12 = [(CSDRelayIDSSessionMessenger *)self currentSession];

  if (v12)
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(CSDRelayIDSSessionMessenger *)self currentSession];
      int v28 = 138412290;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "A current session already exists: %@", (uint8_t *)&v28, 0xCu);
    }
    id v15 = [(CSDRelayIDSSessionMessenger *)self currentSession];
    int v16 = [v15 remoteProtocolVersion];

    id v17 = sub_100008DCC();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16 > 0)
    {
      if (v18)
      {
        int v28 = 138412290;
        id v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending the message through the current session and declining this one %@", (uint8_t *)&v28, 0xCu);
      }

      long long v19 = [(CSDRelayIDSSessionMessenger *)self currentSession];
      [v19 mergeSession:v10];

      long long v20 = [(CSDRelayIDSSessionMessenger *)self currentSession];
      uint64_t v21 = [v6 data];
      [v20 sendDataAndAcceptInvitationIfNecessary:v21];

      [v10 sendDataAndDeclineInvitationIfNecessary:0];
      goto LABEL_23;
    }
    if (v18)
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending the message through the current session", (uint8_t *)&v28, 2u);
    }

    long long v25 = [(CSDRelayIDSSessionMessenger *)self currentSession];
    [v25 addIdentifier:v7];

    CFStringRef v24 = [(CSDRelayIDSSessionMessenger *)self currentSession];
    long long v26 = [v6 data];
    [v24 sendDataAndAcceptInvitationIfNecessary:v26];

LABEL_19:
    goto LABEL_23;
  }
  unsigned int v22 = sub_100008DCC();
  BOOL v23 = v22;
  if (v10)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No current session already exists, so sending the message through this session %@", (uint8_t *)&v28, 0xCu);
    }

    CFStringRef v24 = [v6 data];
    [v10 sendDataAndAcceptInvitationIfNecessary:v24];
    goto LABEL_19;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    int v27 = [(CSDRelayIDSSessionMessenger *)self sessions];
    int v28 = 138412802;
    id v29 = v7;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v27;
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Could not determine session to accept for identifier %@ and message %@. All sessions: %@", (uint8_t *)&v28, 0x20u);
  }
LABEL_23:
}

- (void)sendMessage:(id)a3 andCancelOrDeclineInvitationIfNecessaryForIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 typeString];
    int v16 = 138412802;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sendMessage:andCancelOrDeclineInvitationIfNecessaryForIdentifier for identifier %@ and message type %@: %@", (uint8_t *)&v16, 0x20u);
  }
  long long v10 = [(CSDRelayIDSSessionMessenger *)self activeSessionForIdentifier:v7];
  unsigned __int8 v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Session for identifier is %@", (uint8_t *)&v16, 0xCu);
  }

  if (v10)
  {
    id v12 = [v10 allIdentifiers];
    id v13 = [v12 count];

    if ((unint64_t)v13 < 2)
    {
      if ([v10 isInitiator]) {
        [(CSDRelayIDSSessionMessenger *)self _sendMessage:v6 andCancelInvitationIfNecessaryForSession:v10];
      }
      else {
        [(CSDRelayIDSSessionMessenger *)self _sendMessage:v6 andDeclineInvitationIfNecessaryForSession:v10];
      }
    }
    else
    {
      id v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v10 allIdentifiers];
        int v16 = 138412546;
        id v17 = v15;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Session has multiple identifiers: %@. Removing identifier %@ and not canceling/declining", (uint8_t *)&v16, 0x16u);
      }
      [(CSDRelayIDSSessionMessenger *)self sendMessage:v6 forIdentifier:v7];
      [v10 removeIdentifier:v7];
    }
  }
}

- (void)_sendMessage:(id)a3 andCancelInvitationIfNecessaryForSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = [v5 typeString];
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_sendMessage:andCancelInvitationIfNecessaryForIdentifier for session %@ and message type %@: %@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Session for identifier is %@", (uint8_t *)&v11, 0xCu);
  }

  long long v10 = [v5 data];
  [v6 sendDataAndCancelInvitationIfNecessary:v10];
}

- (void)_sendMessage:(id)a3 andDeclineInvitationIfNecessaryForSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = [v5 typeString];
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_sendMessage:andDeclineInvitationIfNecessaryForIdentifier for session %@ and message type %@: %@", (uint8_t *)&v11, 0x20u);
  }
  [v5 addProtocolVersion];
  uint64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Session for identifier is %@", (uint8_t *)&v11, 0xCu);
  }

  long long v10 = [v5 data];
  [v6 sendDataAndDeclineInvitationIfNecessary:v10];
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4
{
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4 toDestinations:(id)a5
{
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
}

- (void)sendMessage:(id)a3 customizedForRemoteProtocolVersion:(id)a4 completionHandler:(id)a5
{
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4 customizedForRemoteProtocolVersion:(id)a5 completionHandler:(id)a6
{
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4 customizedForRemoteProtocolVersion:(id)a5 waitUntilConnected:(BOOL)a6 completionHandler:(id)a7
{
}

- (void)sendMessage:(id)a3 forIdentifier:(id)a4 toDestinations:(id)a5 customizedForRemoteProtocolVersion:(id)a6 waitUntilConnected:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = (void (**)(id, id, unsigned char *))a6;
  __int16 v18 = (void (**)(id, uint64_t))a8;
  id v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = [v14 typeString];
    *(_DWORD *)buf = 138413058;
    id v34 = v20;
    __int16 v35 = 2112;
    id v36 = v15;
    __int16 v37 = 2112;
    id v38 = v16;
    __int16 v39 = 1024;
    LODWORD(v40) = v9;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "for message type: %@ identifier: %@ destinations: %@ waitUntilConnected: %d", buf, 0x26u);
  }
  id v21 = sub_100008DCC();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "identifier: %@ message: %@", buf, 0x16u);
  }

  if (v15) {
    [(CSDRelayIDSSessionMessenger *)self sessionForIdentifier:v15];
  }
  else {
  unsigned int v22 = [(CSDRelayIDSSessionMessenger *)self currentSession];
  }
  BOOL v23 = v22;
  if (v22)
  {
    objc_msgSend(v14, "customizeForProtocolVersion:", objc_msgSend(v22, "remoteProtocolVersion"));
    char v32 = 0;
    if (v17 && (v17[2](v17, [v23 remoteProtocolVersion], &v32), v32))
    {
      CFStringRef v24 = sub_100008DCC();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        long long v25 = [v14 typeString];
        *(_DWORD *)buf = 138412546;
        id v34 = v25;
        __int16 v35 = 2112;
        id v36 = v14;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Not sending message because protocolVersionCustomizationBlock's preventMessageSend was set to YES for message type %@: %@", buf, 0x16u);
      }
    }
    else
    {
      long long v26 = sub_100008DCC();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v27)
        {
          int v28 = [v14 typeString];
          *(_DWORD *)buf = 138413058;
          id v34 = v23;
          __int16 v35 = 2112;
          id v36 = v28;
          __int16 v37 = 2112;
          id v38 = v16;
          __int16 v39 = 2112;
          id v40 = v14;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "sendMessage through session %@ for message type %@ to destinations %@: %@", buf, 0x2Au);
        }
        CFStringRef v24 = [v14 data];
        [v23 sendData:v24 toDestinations:v16 completion:v18];
      }
      else
      {
        if (v27)
        {
          id v31 = [v14 typeString];
          *(_DWORD *)buf = 138412802;
          id v34 = v23;
          __int16 v35 = 2112;
          id v36 = v31;
          __int16 v37 = 2112;
          id v38 = v14;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "sendMessage through session %@ for message type %@: %@", buf, 0x20u);
        }
        CFStringRef v24 = [v14 data];
        [v23 sendData:v24 waitUntilConnected:v9 completion:v18];
      }
    }
  }
  else
  {
    id v29 = sub_100008DCC();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v30 = [v14 typeString];
      *(_DWORD *)buf = 138412546;
      id v34 = v30;
      __int16 v35 = 2112;
      id v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No session available to send message type %@: %@", buf, 0x16u);
    }
    if (v18) {
      v18[2](v18, 1);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v33 = a3;
  id v34 = a4;
  id v37 = a5;
  id v13 = a6;
  id v36 = a7;
  __int16 v39 = +[IDSDestination destinationWithURI:v13];
  id v14 = +[CSDRelayIDSService sharedInstance];
  id v15 = [v14 deviceForFromID:v13];

  id v38 = [[CSDMessagingRelayMessage alloc] initWithData:v36];
  __int16 v35 = [(CSDRelayIDSMessenger *)self delegate];
  id v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = +[NSDate date];
    [v17 timeIntervalSince1970];
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v50 = v39;
    *(_WORD *)id v51 = 2112;
    *(void *)&v51[2] = v15;
    *(_WORD *)&v51[10] = 2112;
    *(void *)&v51[12] = v38;
    __int16 v52 = 2048;
    uint64_t v53 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invite received for session %@ from (fromID=%@) destination %@ device %@ with message %@ (timestamp: %f)", buf, 0x3Eu);
  }
  id v19 = [(CSDRelayIDSSessionMessenger *)self currentSession];
  if (!v19) {
    goto LABEL_8;
  }
  __int16 v20 = [(CSDRelayIDSSessionMessenger *)self destinationWithActiveSession];
  if ([v39 isEqual:v20])
  {

LABEL_8:
    unsigned int v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v23 = [(CSDRelayIDSSessionMessenger *)self destinationWithActiveSession];
      unsigned int v24 = [v39 isEqual:v23];
      if (v15)
      {
        id v7 = [(CSDRelayIDSSessionMessenger *)self deviceWithActiveSession];
        unsigned int v25 = [v15 isEqual:v7];
      }
      else
      {
        unsigned int v25 = 0;
      }
      long long v26 = [(CSDRelayIDSSessionMessenger *)self currentSession];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&uint8_t buf[4] = v24;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v25;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v26 == 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "... and it's from the same destination that we have an active session with (%d) or it's from the same device that we have an active session with (%d) or we don't have a session (%d)", buf, 0x14u);

      if (v15) {
    }
      }

    if (v38)
    {
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v50 = sub_1001D01A4;
      *(void *)id v51 = sub_1001D01B4;
      *(void *)&v51[8] = self->_queue;
      objc_initWeak(&location, self);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1001D01BC;
      v40[3] = &unk_10050A310;
      id v46 = buf;
      objc_copyWeak(&v47, &location);
      id v41 = v35;
      id v42 = v38;
      id v43 = v37;
      v44 = v39;
      id v45 = v15;
      [v41 checkShouldIgnoreSessionInviteWithMessage:v42 fromDestination:v44 completion:v40];

      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_30;
    }
    BOOL v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "... but there was no accompanying message so just ignoring the invite", buf, 2u);
    }
LABEL_29:

    goto LABEL_30;
  }
  if (v15)
  {
    id v7 = [(CSDRelayIDSSessionMessenger *)self deviceWithActiveSession];
    unsigned __int8 v21 = [v15 isEqual:v7];

    if (v21) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  int v28 = sub_100008DCC();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "... but it is from a different device than the one that we have an active session with", buf, 2u);
  }

  unsigned int v29 = [v35 shouldDeclineSecondSessionInviteWithMessage:v38];
  BOOL v27 = sub_100008DCC();
  BOOL v30 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (!v29)
  {
    if (v30)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "... and we were NOT told to decline the invite, so just ignoring it", buf, 2u);
    }
    goto LABEL_29;
  }
  if (v30)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "... and we were told to decline the invite", buf, 2u);
  }

  id v31 = [[CSDMessagingRelayMessage alloc] initWithType:18];
  [(CSDMessagingRelayMessage *)v31 setDisconnectedReason:10];
  char v32 = [(CSDMessagingRelayMessage *)v31 data];
  [v37 declineInvitationWithData:v32];

LABEL_30:
}

- (id)deviceForFromID:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[CSDRelayIDSService sharedInstance];
  id v5 = [v4 deviceForFromID:v3];

  return v5;
}

- (void)session:(id)a3 endedWithReason:(int)a4
{
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109120;
    LODWORD(v17) = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Session ended with reason %d", (uint8_t *)&v16, 8u);
  }

  unsigned __int8 v8 = [(CSDRelayIDSMessenger *)self delegate];
  BOOL v9 = [v6 allIdentifiers];
  long long v10 = [v9 firstObject];
  int v11 = [(CSDRelayIDSSessionMessenger *)self activeSessionForIdentifier:v10];

  if (v11)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not notifying delegate of messenger connection end because a different active session with the same identifier exists: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else if (a4 >= 5)
  {
    if (a4 == 5)
    {
      id v15 = sub_100008DCC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Notifying delegate that connection could not establish link", (uint8_t *)&v16, 2u);
      }

      id v12 = [v6 allIdentifiers];
      objc_msgSend(v8, "messengerConnectionCouldNotEstablishLink:forIdentifiers:didStartConnecting:", self, v12, objc_msgSend(v6, "hasStartedConnecting"));
    }
    else
    {
      if (a4 != 6) {
        goto LABEL_11;
      }
      id v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Notifying delegate of connection failure", (uint8_t *)&v16, 2u);
      }

      id v12 = [v6 allIdentifiers];
      objc_msgSend(v8, "messengerConnectionFailed:forIdentifiers:didStartConnecting:", self, v12, objc_msgSend(v6, "hasStartedConnecting"));
    }
  }
  else
  {
    id v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notifying delegate of connection end", (uint8_t *)&v16, 2u);
    }

    id v12 = [v6 allIdentifiers];
    objc_msgSend(v8, "messengerConnectionEnded:forIdentifiers:didStartConnecting:", self, v12, objc_msgSend(v6, "hasStartedConnecting"));
  }

LABEL_11:
  [(CSDRelayIDSSessionMessenger *)self _destroySession:v6];
}

- (void)session:(id)a3 receivedInvitationAcceptWithData:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v14 = [[CSDMessagingRelayMessage alloc] initWithData:v11];
    objc_msgSend(v10, "setReceiverProtocolVersion:", -[CSDMessagingRelayMessage protocolVersion](v14, "protocolVersion"));
    id v15 = [(CSDRelayIDSMessenger *)self delegate];
    [v15 messenger:self handledMessage:v14 fromDestination:v12 device:v13];
  }
  else
  {
    int v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received invitation accept with no data payload.", v17, 2u);
    }
  }
}

- (void)session:(id)a3 receivedInvitationCancelWithData:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(CSDRelayIDSMessenger *)self delegate];
  if (v11)
  {
    id v15 = [[CSDMessagingRelayMessage alloc] initWithData:v11];
    int v16 = [v10 remoteDevice];
    [v14 messenger:self handledMessage:v15 fromDestination:v13 device:v16];
  }
  else
  {
    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received invitation cancel with no data payload. Assuming the invitation was answered elsewhere", v18, 2u);
    }

    id v15 = [[CSDMessagingRelayMessage alloc] initWithType:5];
    [v14 messenger:self handledMessage:v15 fromDestination:v13 device:v12];
  }
}

- (void)session:(id)a3 receivedInvitationDeclineWithData:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    id v13 = a3;
    id v14 = [[CSDMessagingRelayMessage alloc] initWithData:v10];
    objc_msgSend(v13, "setReceiverProtocolVersion:", -[CSDMessagingRelayMessage protocolVersion](v14, "protocolVersion"));

    id v15 = [(CSDRelayIDSMessenger *)self delegate];
    [v15 messenger:self handledMessage:v14 fromDestination:v11 device:v12];
  }
  else
  {
    id v16 = a3;
    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received invitation decline with no data payload. Assuming invitation was accepted by sending a message through another session", v19, 2u);
    }

    uint64_t v18 = [(CSDRelayIDSSessionMessenger *)self currentSession];
    [v18 mergeSession:v16];
  }
}

- (void)session:(id)a3 receivedData:(id)a4 fromDestination:(id)a5 device:(id)a6
{
  id v16 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = [[CSDMessagingRelayMessage alloc] initWithData:v12];

  id v14 = [(CSDRelayIDSMessenger *)self delegate];
  if ((int)[v16 remoteProtocolVersion] <= 0)
  {
    id v15 = [v14 identifiersForSessionInvitationWithMessage:v13];
    [v16 addIdentifiers:v15];
  }
  [v14 messenger:self handledMessage:v13 fromDestination:v10 device:v11];
}

- (CSDRouteController)localRouteController
{
  return self->_localRouteController;
}

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessions, 0);

  objc_storeStrong((id *)&self->_localRouteController, 0);
}

@end