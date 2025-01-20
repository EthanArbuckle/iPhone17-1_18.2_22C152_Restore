@interface CSDRelayIDSDualSession
- (BOOL)hasIdentifier:(id)a3;
- (BOOL)hasReceivedAccept;
- (BOOL)hasStarted;
- (CSDRelayIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteDestination:(id)a5 remoteDevice:(id)a6 remoteProtocolVersion:(id)a7 identifiers:(id)a8;
- (CSDRelayIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5;
- (CSDRelayIDSDualSessionDelegate)delegate;
- (IDSDestination)remoteDestination;
- (IDSDevice)remoteDevice;
- (NSArray)allIdentifiers;
- (NSData)acceptPayloadData;
- (NSMutableArray)blocksPendingTransportAvailability;
- (NSMutableArray)pendingData;
- (NSMutableSet)identifiers;
- (id)initAsInitiatorWithSessionProvider:(id)a3 identifiers:(id)a4;
- (id)initAsReceiverWithSessionProvider:(id)a3 remoteDestination:(id)a4 remoteDevice:(id)a5 remoteProtocolVersion:(int)a6 identifiers:(id)a7;
- (id)transport;
- (void)addIdentifier:(id)a3;
- (void)addIdentifiers:(id)a3;
- (void)dealloc;
- (void)mergeSession:(id)a3;
- (void)pendData:(id)a3 completion:(id)a4;
- (void)performBlockOnTransportAvailability:(id)a3;
- (void)prepareToEnd;
- (void)removeIdentifier:(id)a3;
- (void)removeIdentifiers:(id)a3;
- (void)removePendingData;
- (void)runBlocksPendingTransportAvailability:(BOOL)a3;
- (void)runBlocksPendingTransportAvailabilityIfNecessary:(BOOL)a3;
- (void)sendData:(id)a3 toDestinations:(id)a4 completion:(id)a5;
- (void)sendData:(id)a3 waitUntilConnected:(BOOL)a4 completion:(id)a5;
- (void)sendDataAndAcceptInvitationIfNecessary:(id)a3;
- (void)sendDataAndCancelInvitationIfNecessary:(id)a3;
- (void)sendDataAndDeclineInvitationIfNecessary:(id)a3;
- (void)sendDataAndSendInvitationIfNecessary:(id)a3 declineOnError:(BOOL)a4;
- (void)sendPendingData;
- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5;
- (void)sessionProvider:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5;
- (void)sessionProviderStarted:(id)a3;
- (void)setAcceptPayloadData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasReceivedAccept:(BOOL)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setRemoteDestination:(id)a3;
- (void)setRemoteDevice:(id)a3;
@end

@implementation CSDRelayIDSDualSession

- (CSDRelayIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteProtocolVersion:(id)a5
{
  v7 = +[NSAssertionHandler currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"CSDRelayIDSDualSession.m" lineNumber:57 description:@"Use another initializer instead"];

  return 0;
}

- (CSDRelayIDSDualSession)initWithSessionProvider:(id)a3 isInitiator:(BOOL)a4 remoteDestination:(id)a5 remoteDevice:(id)a6 remoteProtocolVersion:(id)a7 identifiers:(id)a8
{
  BOOL v12 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CSDRelayIDSDualSession;
  v18 = [(CSDIDSDualSession *)&v29 initWithSessionProvider:a3 isInitiator:v12 remoteProtocolVersion:a7];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_remoteDestination, a5);
    objc_storeStrong((id *)&v19->_remoteDevice, a6);
    uint64_t v20 = +[NSMutableArray array];
    pendingData = v19->_pendingData;
    v19->_pendingData = (NSMutableArray *)v20;

    uint64_t v22 = +[NSMutableSet setWithArray:v17];
    identifiers = v19->_identifiers;
    v19->_identifiers = (NSMutableSet *)v22;

    uint64_t v24 = +[NSMutableArray array];
    blocksPendingTransportAvailability = v19->_blocksPendingTransportAvailability;
    v19->_blocksPendingTransportAvailability = (NSMutableArray *)v24;

    v26 = [(CSDIDSDualSession *)v19 sessionProvider];
    v30[0] = IDSLinkPreferenceOptionPacketsPerSecondKey;
    v30[1] = IDSLinkPreferenceOptionInputBytesPerSecondKey;
    v31[0] = &off_100523A70;
    v31[1] = &off_100523A88;
    v30[2] = IDSLinkPreferenceOptionOutputBytesPerSecondKey;
    v30[3] = IDSLinkPreferenceOptionIntent;
    v31[2] = &off_100523A88;
    v31[3] = @"forceBTClassic";
    v27 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
    [v26 setStreamPreferences:v27];
  }
  return v19;
}

- (id)initAsInitiatorWithSessionProvider:(id)a3 identifiers:(id)a4
{
  return [(CSDRelayIDSDualSession *)self initWithSessionProvider:a3 isInitiator:1 remoteDestination:0 remoteDevice:0 remoteProtocolVersion:0 identifiers:a4];
}

- (id)initAsReceiverWithSessionProvider:(id)a3 remoteDestination:(id)a4 remoteDevice:(id)a5 remoteProtocolVersion:(int)a6 identifiers:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[NSNumber numberWithInt:v7];
  id v17 = [(CSDRelayIDSDualSession *)self initWithSessionProvider:v15 isInitiator:0 remoteDestination:v14 remoteDevice:v13 remoteProtocolVersion:v16 identifiers:v12];

  return v17;
}

- (void)dealloc
{
  [(CSDRelayIDSDualSession *)self runBlocksPendingTransportAvailability:0];
  [(CSDRelayIDSDualSession *)self removePendingData];
  v3.receiver = self;
  v3.super_class = (Class)CSDRelayIDSDualSession;
  [(CSDRelayIDSDualSession *)&v3 dealloc];
}

- (id)transport
{
  v7.receiver = self;
  v7.super_class = (Class)CSDRelayIDSDualSession;
  objc_super v3 = [(CSDIDSDualSession *)&v7 transport];
  v4 = [(CSDRelayIDSDualSession *)self remoteDestination];
  [v3 setRemoteDestination:v4];

  v5 = [(CSDRelayIDSDualSession *)self remoteDevice];
  [v3 setRemoteDevice:v5];

  return v3;
}

- (NSArray)allIdentifiers
{
  v2 = [(CSDRelayIDSDualSession *)self identifiers];
  objc_super v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (BOOL)hasIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRelayIDSDualSession *)self identifiers];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)addIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayIDSDualSession *)self identifiers];
  [v5 addObject:v4];
}

- (void)addIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayIDSDualSession *)self identifiers];
  [v5 addObjectsFromArray:v4];
}

- (void)removeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayIDSDualSession *)self identifiers];
  [v5 removeObject:v4];
}

- (void)removeIdentifiers:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v8);
        v10 = [(CSDRelayIDSDualSession *)self identifiers];
        [v10 removeObject:v9];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)mergeSession:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDRelayIDSDualSession *)self identifiers];
  id v6 = [v4 allIdentifiers];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = [v4 identifiers];
  [v7 removeAllObjects];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = objc_msgSend(v4, "blocksPendingTransportAvailability", 0);
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [(CSDRelayIDSDualSession *)self performBlockOnTransportAvailability:*(void *)(*((void *)&v14 + 1) + 8 * (void)v12)];
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  long long v13 = [v4 blocksPendingTransportAvailability];
  [v13 removeAllObjects];
}

- (void)runBlocksPendingTransportAvailabilityIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSDRelayIDSDualSession *)self hasStarted]
    && ([(CSDRelayIDSDualSession *)self hasReceivedAccept]
     || ![(CSDIDSDualSession *)self isInitiator]))
  {
    [(CSDRelayIDSDualSession *)self runBlocksPendingTransportAvailability:v3];
  }
  else
  {
    id v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138413058;
      uint64_t v7 = self;
      __int16 v8 = 1024;
      unsigned int v9 = [(CSDRelayIDSDualSession *)self hasStarted];
      __int16 v10 = 1024;
      unsigned int v11 = [(CSDRelayIDSDualSession *)self hasReceivedAccept];
      __int16 v12 = 1024;
      unsigned int v13 = [(CSDIDSDualSession *)self isInitiator];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ not running pending blocks yet because self.hasStarted=%d self.hasReceivedAccept=%d self.isInitiator=%d", (uint8_t *)&v6, 0x1Eu);
    }
  }
}

- (void)runBlocksPendingTransportAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(CSDRelayIDSDualSession *)self blocksPendingTransportAvailability];
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        unsigned int v9 = *(void (***)(void, void, void))(*((void *)&v18 + 1) + 8 * i);
        if (v3)
        {
          __int16 v10 = [(CSDRelayIDSDualSession *)self transport];
        }
        else
        {
          __int16 v10 = 0;
        }
        unsigned int v11 = sub_100008DCC();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = objc_retainBlock(v9);
          unsigned int v13 = [(CSDRelayIDSDualSession *)self acceptPayloadData];
          *(_DWORD *)buf = 138413058;
          CFStringRef v14 = @"non-nil";
          if (!v13) {
            CFStringRef v14 = @"nil";
          }
          v23 = self;
          __int16 v24 = 2112;
          id v25 = v12;
          __int16 v26 = 2112;
          v27 = v10;
          __int16 v28 = 2112;
          CFStringRef v29 = v14;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "self: %@ running block %@ with transport %@ and %@ accept payload data", buf, 0x2Au);
        }
        long long v15 = [(CSDRelayIDSDualSession *)self acceptPayloadData];
        ((void (**)(void, void *, void *))v9)[2](v9, v10, v15);
      }
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v6);
  }

  long long v16 = [(CSDRelayIDSDualSession *)self blocksPendingTransportAvailability];
  [v16 removeAllObjects];
}

- (void)performBlockOnTransportAvailability:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 138412546;
    long long v16 = self;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ pending block on transport availability: %@", buf, 0x16u);
  }
  uint64_t v7 = [(CSDRelayIDSDualSession *)self blocksPendingTransportAvailability];
  id v8 = objc_retainBlock(v4);
  [v7 addObject:v8];

  [(CSDRelayIDSDualSession *)self runBlocksPendingTransportAvailabilityIfNecessary:1];
  dispatch_time_t v9 = dispatch_time(0, 20000000000);
  __int16 v10 = +[TUCallCenter sharedInstance];
  unsigned int v11 = [v10 queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006C21C;
  v13[3] = &unk_100505C70;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_after(v9, v11, v13);
}

- (void)pendData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_time_t v9 = objc_alloc_init(CSDRelayIDSDualSessionData);
  [(CSDRelayIDSDualSessionData *)v9 setData:v7];

  [(CSDRelayIDSDualSessionData *)v9 setCompletion:v6];
  id v8 = [(CSDRelayIDSDualSession *)self pendingData];
  [v8 addObject:v9];
}

- (void)sendPendingData
{
  BOOL v3 = [(CSDRelayIDSDualSession *)self pendingData];
  id v4 = [v3 copy];

  id v5 = [(CSDRelayIDSDualSession *)self pendingData];
  [v5 removeAllObjects];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "data", (void)v14);
        unsigned int v13 = [v11 completion];
        [(CSDRelayIDSDualSession *)self sendData:v12 waitUntilConnected:1 completion:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)removePendingData
{
  BOOL v3 = [(CSDRelayIDSDualSession *)self pendingData];
  id v4 = [v3 copy];

  id v5 = [(CSDRelayIDSDualSession *)self pendingData];
  [v5 removeAllObjects];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "completion", (void)v14);

        if (v12)
        {
          unsigned int v13 = [v11 completion];
          v13[2](v13, 1);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)sendData:(id)a3 waitUntilConnected:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  __int16 v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sendData self: %@", (uint8_t *)&v17, 0xCu);
  }

  unsigned int v11 = [(CSDIDSDualSession *)self state];
  if (v11 - 1 < 2)
  {
    long long v14 = sub_100008DCC();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v15)
      {
        int v17 = 138412290;
        id v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Session %@ is not connected and waitUntilConnected is YES. Pending data", (uint8_t *)&v17, 0xCu);
      }

      [(CSDRelayIDSDualSession *)self pendData:v8 completion:v9];
      goto LABEL_24;
    }
    if (v15)
    {
      int v17 = 138412290;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Session %@ is not connected but waitUntilConnected is NO. Sending data", (uint8_t *)&v17, 0xCu);
    }

    goto LABEL_19;
  }
  if (v11 - 4 < 2)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Session %@ is ending/ended. Dropping data on the floor", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v13 = 1;
LABEL_20:

    if (!v9) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  if (v11 == 3)
  {
    long long v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Session %@ is connected. Sending data", (uint8_t *)&v17, 0xCu);
    }

LABEL_19:
    id v12 = [(CSDIDSDualSession *)self sessionProvider];
    [v12 sendData:v8];
    uint64_t v13 = 0;
    goto LABEL_20;
  }
  uint64_t v13 = 0;
  if (v9)
  {
LABEL_23:
    v9[2](v9, v13);
LABEL_24:
  }
LABEL_25:
}

- (void)sendData:(id)a3 toDestinations:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = (void (**)(id, uint64_t))a5;
  unsigned int v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    int v17 = self;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "self: %@ destinations: %@", (uint8_t *)&v16, 0x16u);
  }

  unsigned int v12 = [(CSDIDSDualSession *)self state];
  if (v12 - 2 >= 4)
  {
    if (v12 != 1)
    {
      uint64_t v14 = 0;
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    BOOL v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      int v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Session %@ is waiting. Sending data", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v13 = [(CSDIDSDualSession *)self sessionProvider];
    [v13 sendData:v8 toDestinations:v9];
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      int v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Session %@ is not waiting. Dropping data on the floor", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v14 = 1;
  }

  if (v10) {
LABEL_8:
  }
    v10[2](v10, v14);
LABEL_9:
}

- (void)sendDataAndSendInvitationIfNecessary:(id)a3 declineOnError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"non-nil";
    if (!v6) {
      CFStringRef v8 = @"nil";
    }
    int v9 = 138412546;
    __int16 v10 = self;
    __int16 v11 = 2112;
    CFStringRef v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v9, 0x16u);
  }

  [(CSDIDSDualSession *)self _sendInvitationWithData:v6 declineOnError:v4 alwaysSendData:0];
}

- (void)sendDataAndAcceptInvitationIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"non-nil";
    if (!v4) {
      CFStringRef v6 = @"nil";
    }
    int v7 = 138412546;
    CFStringRef v8 = self;
    __int16 v9 = 2112;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v7, 0x16u);
  }

  [(CSDIDSDualSession *)self _acceptInvitationWithData:v4 alwaysSendData:1];
}

- (void)sendDataAndCancelInvitationIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"non-nil";
    if (!v4) {
      CFStringRef v6 = @"nil";
    }
    int v7 = 138412546;
    CFStringRef v8 = self;
    __int16 v9 = 2112;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v7, 0x16u);
  }

  [(CSDIDSDualSession *)self _cancelInvitationWithData:v4 reason:0 alwaysSendData:1];
}

- (void)sendDataAndDeclineInvitationIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"non-nil";
    if (!v4) {
      CFStringRef v6 = @"nil";
    }
    int v7 = 138412546;
    CFStringRef v8 = self;
    __int16 v9 = 2112;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: %@ data: %@", (uint8_t *)&v7, 0x16u);
  }

  [(CSDIDSDualSession *)self _declineInvitationWithData:v4 alwaysSendData:1];
}

- (void)prepareToEnd
{
  unsigned int v3 = [(CSDIDSDualSession *)self state];
  id v4 = sub_100008DCC();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 3)
  {
    if (v5)
    {
      int v6 = 138412290;
      int v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting session %@ to ending for prepareToEnd", (uint8_t *)&v6, 0xCu);
    }

    [(CSDIDSDualSession *)self setState:4];
  }
  else
  {
    if (v5)
    {
      int v6 = 138412290;
      int v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not setting session %@ to ending for prepareToEnd because session is not connected", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)sessionProviderStarted:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSDRelayIDSDualSession;
  [(CSDIDSDualSession *)&v4 sessionProviderStarted:a3];
  [(CSDRelayIDSDualSession *)self sendPendingData];
  [(CSDRelayIDSDualSession *)self setHasStarted:1];
  [(CSDRelayIDSDualSession *)self runBlocksPendingTransportAvailabilityIfNecessary:1];
}

- (void)sessionProvider:(id)a3 endedWithReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  [(CSDRelayIDSDualSession *)self removePendingData];
  [(CSDRelayIDSDualSession *)self runBlocksPendingTransportAvailability:0];
  v10.receiver = self;
  v10.super_class = (Class)CSDRelayIDSDualSession;
  [(CSDIDSDualSession *)&v10 sessionProvider:v9 endedWithReason:v5 error:v8];
}

- (void)sessionProvider:(id)a3 receivedInvitationAcceptFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(CSDRelayIDSDualSession *)self setHasReceivedAccept:1];
  [(CSDRelayIDSDualSession *)self setAcceptPayloadData:v8];
  [(CSDRelayIDSDualSession *)self runBlocksPendingTransportAvailabilityIfNecessary:1];
  id v9 = [(CSDRelayIDSDualSession *)self delegate];
  objc_super v10 = +[IDSDestination destinationWithURI:v7];
  [(CSDRelayIDSDualSession *)self setRemoteDestination:v10];
  __int16 v11 = [v9 deviceForFromID:v7];
  [(CSDRelayIDSDualSession *)self setRemoteDevice:v11];
  CFStringRef v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413058;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    long long v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received invitation ACCEPT with data for session %@ from (fromID=%@) destination %@ device %@", (uint8_t *)&v13, 0x2Au);
  }

  [v9 session:self receivedInvitationAcceptWithData:v8 fromDestination:v10 device:v11];
}

- (void)sessionProvider:(id)a3 receivedInvitationCancelFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDRelayIDSDualSession *)self delegate];
  objc_super v10 = +[IDSDestination destinationWithURI:v7];
  __int16 v11 = [v9 deviceForFromID:v7];
  CFStringRef v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413058;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    long long v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received invitation CANCEL with data for session %@ from (fromID=%@) destination %@ device %@", (uint8_t *)&v13, 0x2Au);
  }

  [v9 session:self receivedInvitationCancelWithData:v8 fromDestination:v10 device:v11];
}

- (void)sessionProvider:(id)a3 receivedInvitationDeclineFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDRelayIDSDualSession *)self delegate];
  objc_super v10 = +[IDSDestination destinationWithURI:v7];
  __int16 v11 = [v9 deviceForFromID:v7];
  CFStringRef v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413058;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    long long v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received invitation DECLINE with data for session %@ from (fromID=%@) destination %@ device %@", (uint8_t *)&v13, 0x2Au);
  }

  [v9 session:self receivedInvitationDeclineWithData:v8 fromDestination:v10 device:v11];
}

- (void)sessionProvider:(id)a3 receivedSessionMessageFromID:(id)a4 withData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDRelayIDSDualSession *)self delegate];
  objc_super v10 = +[IDSDestination destinationWithURI:v7];
  __int16 v11 = [v9 deviceForFromID:v7];
  CFStringRef v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138413058;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    __int16 v18 = v10;
    __int16 v19 = 2112;
    long long v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received session MESSAGE for session %@ from (fromID=%@) destination %@ device %@", (uint8_t *)&v13, 0x2Au);
  }

  [v9 session:self receivedData:v8 fromDestination:v10 device:v11];
}

- (CSDRelayIDSDualSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDRelayIDSDualSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSDestination)remoteDestination
{
  return self->_remoteDestination;
}

- (void)setRemoteDestination:(id)a3
{
}

- (IDSDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (NSMutableArray)pendingData
{
  return self->_pendingData;
}

- (NSMutableSet)identifiers
{
  return self->_identifiers;
}

- (NSMutableArray)blocksPendingTransportAvailability
{
  return self->_blocksPendingTransportAvailability;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasReceivedAccept
{
  return self->_hasReceivedAccept;
}

- (void)setHasReceivedAccept:(BOOL)a3
{
  self->_hasReceivedAccept = a3;
}

- (NSData)acceptPayloadData
{
  return self->_acceptPayloadData;
}

- (void)setAcceptPayloadData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptPayloadData, 0);
  objc_storeStrong((id *)&self->_blocksPendingTransportAvailability, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_pendingData, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_remoteDestination, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end