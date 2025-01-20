@interface DataStreamBulkSendProtocol
+ (id)protocolName;
- (BOOL)isActive;
- (BOOL)isConnected;
- (DataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5;
- (DataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5 bulkSendSessionContextFactory:(id)a6;
- (DataStreamProtocolDelegate)dataStream;
- (NSMapTable)activeBulkSendSessions;
- (NSMapTable)listeners;
- (NSMutableDictionary)pendingBulkSendSessionContextBySessionIdentifier;
- (NSString)logIdentifier;
- (OS_dispatch_queue)queue;
- (id)_createSessionCandidateWithRequestHeader:(id)a3 metadata:(id)a4;
- (id)_createSessionFromCandidate:(id)a3 queue:(id)a4;
- (id)_createSessionIdentifier;
- (id)_getBulkSendSessionForSessionIdentifier:(id)a3;
- (id)accessory;
- (id)bulkSendSessionContextFactory;
- (unsigned)nextSessionIdentifier;
- (void)_cancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5 completion:(id)a6;
- (void)_closeAllSessionsWithError:(id)a3;
- (void)_handleCloseMessage:(id)a3;
- (void)_handleDataMessage:(id)a3;
- (void)_handleOpenWithRequestHeader:(id)a3 payload:(id)a4;
- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3;
- (void)_openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7;
- (void)_pumpMessage:(id)a3 session:(id)a4;
- (void)_pumpReceiveFailure:(id)a3 session:(id)a4;
- (void)_rejectSessionCandidate:(id)a3 status:(unsigned __int16)a4;
- (void)_removeBulkSendSessionForSessionIdentifier:(id)a3;
- (void)_sendAckMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)_sendCloseMessageWithIdentifier:(id)a3 reason:(unsigned __int16)a4 completion:(id)a5;
- (void)_sendOpenResponseWithRequestHeader:(id)a3 bulkSendStatus:(unsigned __int16)a4;
- (void)_sendOpenResponseWithRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5;
- (void)_sendOpenResponseWithRequestHeader:(id)a3 status:(unsigned __int16)a4;
- (void)_sendOpenResponseWithRequestHeader:(id)a3 streamIdentifier:(id)a4;
- (void)_startSessionCandidate:(id)a3 queue:(id)a4 callback:(id)a5;
- (void)addListener:(id)a3 fileType:(id)a4;
- (void)asyncBulkSendSessionCandidate:(id)a3 didAcceptOnQueue:(id)a4 callback:(id)a5;
- (void)asyncBulkSendSessionCandidate:(id)a3 didRejectWithStatus:(unsigned __int16)a4;
- (void)asyncBulkSendSessionDidCancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5 completion:(id)a6;
- (void)dataStream:(id)a3 didFailWithError:(id)a4;
- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStreamDidClose:(id)a3;
- (void)dataStreamDidOpen:(id)a3;
- (void)dataStreamInitiatedClose:(id)a3;
- (void)openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7;
- (void)removeListener:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setDataStream:(id)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setListeners:(id)a3;
- (void)setNextSessionIdentifier:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation DataStreamBulkSendProtocol

- (DataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5
{
  return [(DataStreamBulkSendProtocol *)self initWithQueue:a3 accessory:a4 logIdentifier:a5 bulkSendSessionContextFactory:&stru_100273750];
}

- (DataStreamBulkSendProtocol)initWithQueue:(id)a3 accessory:(id)a4 logIdentifier:(id)a5 bulkSendSessionContextFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)DataStreamBulkSendProtocol;
  v15 = [(DataStreamBulkSendProtocol *)&v28 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeWeak(&v16->_accessory, v12);
    uint64_t v17 = +[NSMapTable strongToWeakObjectsMapTable];
    listeners = v16->_listeners;
    v16->_listeners = (NSMapTable *)v17;

    uint64_t v19 = +[NSMapTable strongToWeakObjectsMapTable];
    activeBulkSendSessions = v16->_activeBulkSendSessions;
    v16->_activeBulkSendSessions = (NSMapTable *)v19;

    v16->_isConnected = 0;
    v16->_nextSessionIdentifier = 1;
    id v21 = objc_retainBlock(v14);
    id bulkSendSessionContextFactory = v16->_bulkSendSessionContextFactory;
    v16->_id bulkSendSessionContextFactory = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingBulkSendSessionContextBySessionIdentifier = v16->_pendingBulkSendSessionContextBySessionIdentifier;
    v16->_pendingBulkSendSessionContextBySessionIdentifier = v23;

    v25 = (NSString *)[v13 copy];
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = v25;
  }
  return v16;
}

+ (id)protocolName
{
  return @"dataSend";
}

- (void)addListener:(id)a3 fileType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(DataStreamBulkSendProtocol *)self isActive];
  v9 = [(DataStreamBulkSendProtocol *)self listeners];
  v10 = [v9 objectForKey:v7];

  id v11 = [(DataStreamBulkSendProtocol *)self accessory];
  if (v10)
  {
    id v12 = self;
    id v13 = sub_100083F74();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = sub_100083FD0(v12);
      int v16 = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Rejecting BulkSend registration for file type %@; handler already exists",
        (uint8_t *)&v16,
        0x16u);
    }
    [v6 accessoryDidCloseDataStream:v11];
  }
  else
  {
    v15 = [(DataStreamBulkSendProtocol *)self listeners];
    [v15 setObject:v6 forKey:v7];

    if ([(DataStreamBulkSendProtocol *)self isConnected]) {
      [v6 accessoryDidStartListening:v11];
    }
    [(DataStreamBulkSendProtocol *)self _notifyActiveStatusChangedFromPreviousValue:v8];
  }
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DataStreamBulkSendProtocol *)self isActive];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(DataStreamBulkSendProtocol *)self listeners];
  id v7 = [v6 keyEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [(DataStreamBulkSendProtocol *)self listeners];
        id v14 = [v13 objectForKey:v12];

        if (v14 == v4)
        {
          v15 = [(DataStreamBulkSendProtocol *)self listeners];
          [v15 removeObjectForKey:v12];

          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  int v16 = [(DataStreamBulkSendProtocol *)self accessory];
  [v4 accessoryDidCloseDataStream:v16];

  [(DataStreamBulkSendProtocol *)self _notifyActiveStatusChangedFromPreviousValue:v5];
}

- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3
{
  if ([(DataStreamBulkSendProtocol *)self isActive] != a3)
  {
    id v4 = self;
    BOOL v5 = sub_100083F74();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = sub_100083FD0(v4);
      [(DataStreamBulkSendProtocol *)v4 isActive];
      id v7 = HMFBooleanToString();
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@BulkSend protocol changes active to %@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = [(DataStreamBulkSendProtocol *)v4 dataStream];
    [v8 protocolDidUpdateActiveStatus:v4];
  }
}

- (void)_closeAllSessionsWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = sub_100083FD0(v5);
    id v8 = [(DataStreamBulkSendProtocol *)v5 listeners];
    id v9 = [v8 count];
    uint64_t v10 = [(DataStreamBulkSendProtocol *)v5 activeBulkSendSessions];
    *(_DWORD *)buf = 138543874;
    v43 = v7;
    __int16 v44 = 2048;
    id v45 = v9;
    __int16 v46 = 2048;
    id v47 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Session closed; removing %lu listeners and closing %lu sessions",
      buf,
      0x20u);
  }
  [(DataStreamBulkSendProtocol *)v5 setIsConnected:0];
  if (v4)
  {
    NSErrorUserInfoKey v40 = NSUnderlyingErrorKey;
    id v41 = v4;
    __int16 v11 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  }
  else
  {
    __int16 v11 = 0;
  }
  uint64_t v12 = +[NSError errorWithDomain:NSURLErrorDomain code:-1005 userInfo:v11];
  id v13 = [(DataStreamBulkSendProtocol *)v5 accessory];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = [(DataStreamBulkSendProtocol *)v5 activeBulkSendSessions];
  v15 = [v14 objectEnumerator];

  id v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      long long v19 = 0;
      do
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v19);
        if (v20) {
          [v20 asyncHandleRemoteCloseWithError:v12];
        }
        long long v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v17);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = [(DataStreamBulkSendProtocol *)v5 listeners];
  v22 = [v21 objectEnumerator];

  id v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v26);
        if (v27) {
          [v27 accessoryDidCloseDataStream:v13];
        }
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v24);
  }

  objc_super v28 = [(DataStreamBulkSendProtocol *)v5 listeners];
  [v28 removeAllObjects];

  v29 = [(DataStreamBulkSendProtocol *)v5 activeBulkSendSessions];
  [v29 removeAllObjects];
}

- (BOOL)isActive
{
  v2 = [(DataStreamBulkSendProtocol *)self listeners];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = self;
  id v7 = sub_100083F74();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = sub_100083FD0(v6);
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream failed with error; cleaning up. (%@)",
      (uint8_t *)&v9,
      0x16u);
  }
  [(DataStreamBulkSendProtocol *)v6 _closeAllSessionsWithError:v5];
}

- (void)dataStreamInitiatedClose:(id)a3
{
  BOOL v3 = self;
  id v4 = sub_100083F74();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = sub_100083FD0(v3);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@DataStream initiated closing...", (uint8_t *)&v6, 0xCu);
  }
}

- (void)dataStreamDidClose:(id)a3
{
  BOOL v3 = self;
  id v4 = sub_100083F74();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = sub_100083FD0(v3);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@DataStream closed; cleaning up",
      (uint8_t *)&v6,
      0xCu);
  }
  [(DataStreamBulkSendProtocol *)v3 _closeAllSessionsWithError:0];
}

- (void)dataStreamDidOpen:(id)a3
{
  BOOL v3 = self;
  id v4 = sub_100083F74();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = sub_100083FD0(v3);
    *(_DWORD *)buf = 138543362;
    long long v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}@DataStream did open; connected.",
      buf,
      0xCu);
  }
  [(DataStreamBulkSendProtocol *)v3 setIsConnected:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v6 = [(DataStreamBulkSendProtocol *)v3 listeners];
  id v7 = [v6 objectEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      __int16 v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v11);
        if (v12)
        {
          id v13 = [(DataStreamBulkSendProtocol *)v3 accessory];
          [v12 accessoryDidStartListening:v13];
        }
        __int16 v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  if (![(DataStreamBulkSendProtocol *)self isConnected])
  {
    uint64_t v10 = self;
    __int16 v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = sub_100083FD0(v10);
      int v16 = 138543618;
      long long v17 = v12;
      __int16 v18 = 2112;
      id v19 = v8;
      id v13 = "%{public}@BulkSend dropping message because it is not running (topic=%@).";
      long long v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v16, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (![v8 isEqualToString:@"data"])
  {
    if ([v8 isEqualToString:@"close"])
    {
      [(DataStreamBulkSendProtocol *)self _handleCloseMessage:v9];
      goto LABEL_12;
    }
    uint64_t v10 = self;
    __int16 v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = sub_100083FD0(v10);
      int v16 = 138543618;
      long long v17 = v12;
      __int16 v18 = 2112;
      id v19 = v8;
      id v13 = "%{public}@DataSend received unexpected event '%@'";
      long long v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  [(DataStreamBulkSendProtocol *)self _handleDataMessage:v9];
LABEL_12:
}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(DataStreamBulkSendProtocol *)self isConnected])
  {
    if ([v9 isEqualToString:@"open"])
    {
      [(DataStreamBulkSendProtocol *)self _handleOpenWithRequestHeader:v10 payload:v11];
    }
    else
    {
      id v12 = self;
      id v13 = sub_100083F74();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v14 = sub_100083FD0(v12);
        int v15 = 138543618;
        int v16 = v14;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@DataSend received unexpected request '%@'", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (void)asyncBulkSendSessionCandidate:(id)a3 didAcceptOnQueue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DataStreamBulkSendProtocol *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100049ED0;
  v15[3] = &unk_100273778;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)asyncBulkSendSessionCandidate:(id)a3 didRejectWithStatus:(unsigned __int16)a4
{
  id v6 = a3;
  id v7 = [(DataStreamBulkSendProtocol *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049F9C;
  block[3] = &unk_1002737A0;
  block[4] = self;
  id v10 = v6;
  unsigned __int16 v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)asyncBulkSendSessionDidCancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(DataStreamBulkSendProtocol *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004A09C;
  v15[3] = &unk_1002737C8;
  v15[4] = self;
  id v16 = v10;
  unsigned __int16 v18 = a4;
  BOOL v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

- (id)_createSessionCandidateWithRequestHeader:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  id v9 = sub_100083F74();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = sub_100083FD0(v7);
    int v13 = 138543618;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@Creating new receive candidate session (header %@)", (uint8_t *)&v13, 0x16u);
  }
  id v11 = [[DataStreamBulkSendSessionCandidate alloc] initWithProtocol:v7 requestHeader:v6 metadata:v8];

  return v11;
}

- (id)_createSessionFromCandidate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DataStreamBulkSendProtocol *)self _createSessionIdentifier];
  id v9 = [DataStreamBulkSendSession alloc];
  id v10 = [(DataStreamBulkSendProtocol *)self logIdentifier];
  id v11 = [(DataStreamBulkSendSession *)v9 initWithProtocol:self sessionIdentifier:v8 queue:v6 logIdentifier:v10];

  id v12 = self;
  int v13 = sub_100083F74();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = sub_100083FD0(v12);
    int v18 = 138543618;
    BOOL v19 = v14;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@Creating new receive session with streamIdentifier=%@", (uint8_t *)&v18, 0x16u);
  }
  __int16 v15 = [(DataStreamBulkSendProtocol *)v12 activeBulkSendSessions];
  [v15 setObject:v11 forKey:v8];

  id v16 = [v7 requestHeader];

  [(DataStreamBulkSendProtocol *)v12 _sendOpenResponseWithRequestHeader:v16 streamIdentifier:v8];

  return v11;
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 streamIdentifier:(id)a4
{
  CFStringRef v9 = @"streamId";
  id v10 = a4;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  [(DataStreamBulkSendProtocol *)self _sendOpenResponseWithRequestHeader:v7 payload:v8 status:0];
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 bulkSendStatus:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  CFStringRef v9 = @"status";
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedShort:v4];
  id v10 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  [(DataStreamBulkSendProtocol *)self _sendOpenResponseWithRequestHeader:v6 payload:v8 status:6];
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(DataStreamBulkSendProtocol *)self dataStream];
  if (v10)
  {
    id v11 = self;
    id v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = sub_100083FD0(v11);
      id v14 = sub_1000413A4(v5);
      *(_DWORD *)buf = 138543874;
      id v17 = v13;
      __int16 v18 = 2112;
      BOOL v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Sending open response with status %@ (%ld)", buf, 0x20u);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004A6D0;
    v15[3] = &unk_1002736C0;
    v15[4] = v11;
    [v10 sendResponseForRequestHeader:v8 payload:v9 status:v5 completion:v15];
  }
}

- (void)_sendOpenResponseWithRequestHeader:(id)a3 status:(unsigned __int16)a4
{
}

- (id)_createSessionIdentifier
{
  uint64_t v3 = [(DataStreamBulkSendProtocol *)self nextSessionIdentifier];
  [(DataStreamBulkSendProtocol *)self setNextSessionIdentifier:(v3 + 1)];

  return +[NSNumber numberWithUnsignedInt:v3];
}

- (void)_startSessionCandidate:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DataStreamBulkSendProtocol *)self _createSessionFromCandidate:v8 queue:v9];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = [v8 pendingReads];
  id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        [(DataStreamBulkSendProtocol *)self _pumpMessage:*(void *)(*((void *)&v24 + 1) + 8 * (void)v16) session:v11];
        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  id v17 = [v8 receivedFailure];

  if (v17)
  {
    __int16 v18 = [v8 receivedFailure];
    [(DataStreamBulkSendProtocol *)self _pumpReceiveFailure:v18 session:v11];
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004AA7C;
  v21[3] = &unk_1002733F0;
  id v22 = v11;
  id v23 = v10;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v9, v21);
}

- (void)_rejectSessionCandidate:(id)a3 status:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [a3 requestHeader];
  [(DataStreamBulkSendProtocol *)self _sendOpenResponseWithRequestHeader:v6 bulkSendStatus:v4];
}

- (id)_getBulkSendSessionForSessionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DataStreamBulkSendProtocol *)self activeBulkSendSessions];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)_removeBulkSendSessionForSessionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DataStreamBulkSendProtocol *)self activeBulkSendSessions];
  [v5 removeObjectForKey:v4];
}

- (void)_handleOpenWithRequestHeader:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [v7 objectForKeyedSubscript:@"target"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  id v14 = [v7 objectForKeyedSubscript:@"metadata"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  if (v10) {
    BOOL v17 = v13 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    __int16 v18 = self;
    id v19 = sub_100083F74();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = sub_100083FD0(v18);
      int v30 = 138543874;
      long long v31 = v20;
      __int16 v32 = 2112;
      id v33 = v10;
      __int16 v34 = 2112;
      id v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@Dropping 'open' because it is missing required keys (type=%@, target=%@)", (uint8_t *)&v30, 0x20u);
    }
    [(DataStreamBulkSendProtocol *)v18 _sendOpenResponseWithRequestHeader:v6 status:4];
  }
  else
  {
    uint64_t v21 = [(DataStreamBulkSendProtocol *)self listeners];
    id v22 = [v21 objectForKey:v10];

    id v23 = self;
    long long v24 = sub_100083F74();
    long long v25 = v24;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        long long v26 = sub_100083FD0(v23);
        int v30 = 138543618;
        long long v31 = v26;
        __int16 v32 = 2112;
        id v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@Received 'open' with type=%@; passing to listener",
          (uint8_t *)&v30,
          0x16u);
      }
      long long v27 = [(DataStreamBulkSendProtocol *)v23 _createSessionCandidateWithRequestHeader:v6 metadata:v16];
      objc_super v28 = [(DataStreamBulkSendProtocol *)v23 accessory];
      [v22 accessory:v28 didReceiveBulkSessionCandidate:v27];
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v29 = sub_100083FD0(v23);
        int v30 = 138543618;
        long long v31 = v29;
        __int16 v32 = 2112;
        id v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}@Received 'open' for type=%@ but no active listener accepted it", (uint8_t *)&v30, 0x16u);
      }
      [(DataStreamBulkSendProtocol *)v23 _maybeSubmitMetricForDroppedOpenRequestOfType:v10];
      [(DataStreamBulkSendProtocol *)v23 _sendOpenResponseWithRequestHeader:v6 bulkSendStatus:1];
    }
  }
}

- (void)_handleCloseMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"streamId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v4 objectForKeyedSubscript:@"reason"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (!v7)
  {
    id v12 = self;
    id v13 = sub_100083F74();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    sub_100083FD0(v12);
    id v14 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue();
    int v19 = 138543362;
    id v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Close dropped because streamIdentifier was not included", (uint8_t *)&v19, 0xCu);
LABEL_20:

    goto LABEL_21;
  }
  if (v10) {
    id v10 = (_UNKNOWN **)v8;
  }
  else {
    id v10 = &off_100281658;
  }
  CFStringRef v23 = @"reason";
  long long v24 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  id v12 = +[NSError errorWithDomain:@"DKErrorDomain" code:28 userInfo:v11];

  id v13 = [(DataStreamBulkSendProtocol *)self _getBulkSendSessionForSessionIdentifier:v7];
  id v14 = self;
  uint64_t v15 = sub_100083F74();
  id v16 = v15;
  if (!v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      sub_100083FD0(v14);
      __int16 v18 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue();
      int v19 = 138543618;
      id v20 = v18;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}@Close packet for streamIdentifier=%@ dropped because no session is active", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    sub_100083FD0(v14);
    BOOL v17 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue();
    int v19 = 138543618;
    id v20 = v17;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Received close packet for stream identifier: %@", (uint8_t *)&v19, 0x16u);
  }
  [(DataStreamBulkSendProtocol *)v14 _pumpReceiveFailure:v12 session:v13];
LABEL_21:
}

- (void)_handleDataMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"streamId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    id v8 = self;
    sub_100083F74();
    id v9 = (DataStreamBulkSendProtocol *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_13;
    }
    id v10 = sub_100083FD0(v8);
    int v12 = 138543362;
    id v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, &v9->super, OS_LOG_TYPE_ERROR, "%{public}@Data packet dropped because no session identifier was present", (uint8_t *)&v12, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  id v8 = [(DataStreamBulkSendProtocol *)self _getBulkSendSessionForSessionIdentifier:v7];
  if (!v8)
  {
    id v9 = self;
    id v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = sub_100083FD0(v9);
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Data packet for streamIdentifier=%@ dropped because no session is active", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_11;
  }
  [(DataStreamBulkSendProtocol *)self _pumpMessage:v4 session:v8];
LABEL_13:
}

- (void)_pumpMessage:(id)a3 session:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectForKeyedSubscript:@"packets"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = [v7 objectForKeyedSubscript:@"endOfStream"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  if (!v13)
  {
    if (!v10) {
      goto LABEL_15;
    }
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  id v14 = [v13 BOOLValue];
  uint64_t v15 = (uint64_t)v14;
  if (v10)
  {
LABEL_13:
    id v16 = [v10 count];
    if ((v15 & 1) != 0 || v16) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (v14)
  {
    uint64_t v15 = 1;
LABEL_18:
    [v6 asyncHandleIncomingPackets:v10 isEof:v15];
    goto LABEL_19;
  }
LABEL_15:
  BOOL v17 = self;
  __int16 v18 = sub_100083F74();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = sub_100083FD0(v17);
    int v20 = 138543362;
    __int16 v21 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@Received message with no packets", (uint8_t *)&v20, 0xCu);
  }
LABEL_19:
}

- (void)_pumpReceiveFailure:(id)a3 session:(id)a4
{
  id v6 = a4;
  [v6 asyncHandleRemoteCloseWithError:a3];
  id v7 = [v6 sessionIdentifier];

  [(DataStreamBulkSendProtocol *)self _removeBulkSendSessionForSessionIdentifier:v7];
}

- (void)_cancelSessionWithIdentifier:(id)a3 reason:(unsigned __int16)a4 hadReceivedEof:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  uint64_t v7 = a4;
  id v10 = a6;
  id v11 = a3;
  -[DataStreamBulkSendProtocol _removeBulkSendSessionForSessionIdentifier:](self, "_removeBulkSendSessionForSessionIdentifier:");
  if (v7 || !v6) {
    [(DataStreamBulkSendProtocol *)self _sendCloseMessageWithIdentifier:v11 reason:v7 completion:v10];
  }
  else {
    [(DataStreamBulkSendProtocol *)self _sendAckMessageWithIdentifier:v11 completion:v10];
  }
}

- (void)_sendCloseMessageWithIdentifier:(id)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  id v10 = [(DataStreamBulkSendProtocol *)self dataStream];
  if (v10)
  {
    v25[0] = @"streamId";
    v25[1] = @"reason";
    v26[0] = v8;
    id v11 = +[NSNumber numberWithUnsignedShort:v6];
    v26[1] = v11;
    int v12 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

    id v13 = self;
    id v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = sub_100083FD0(v13);
      int v19 = 138543874;
      int v20 = v15;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 1024;
      int v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@Sending 'close' for sid=%@ with reason %d", (uint8_t *)&v19, 0x1Cu);
    }
    [v10 sendEventForProtocol:@"dataSend" topic:@"close" payload:v12 completion:v9];
  }
  else
  {
    id v16 = self;
    BOOL v17 = sub_100083F74();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = sub_100083FD0(v16);
      int v19 = 138543362;
      int v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@No data stream found", (uint8_t *)&v19, 0xCu);
    }
    int v12 = +[NSError errorWithDomain:@"DKErrorDomain" code:1 userInfo:0];
    v9[2](v9, v12);
  }
}

- (void)_sendAckMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = [(DataStreamBulkSendProtocol *)self dataStream];
  if (v8)
  {
    v20[0] = @"streamId";
    v20[1] = @"endOfStream";
    v21[0] = v6;
    v21[1] = &__kCFBooleanTrue;
    id v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v10 = self;
    id v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = sub_100083FD0(v10);
      int v16 = 138543618;
      BOOL v17 = v12;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Sending 'ack' for sid=%@", (uint8_t *)&v16, 0x16u);
    }
    [v8 sendEventForProtocol:@"dataSend" topic:@"ack" payload:v9 completion:v7];
  }
  else
  {
    id v13 = self;
    id v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = sub_100083FD0(v13);
      int v16 = 138543362;
      BOOL v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@No data stream found", (uint8_t *)&v16, 0xCu);
    }
    id v9 = +[NSError errorWithDomain:@"DKErrorDomain" code:1 userInfo:0];
    v7[2](v7, v9);
  }
}

- (void)openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = [(DataStreamBulkSendProtocol *)self queue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10004BCF4;
  v23[3] = &unk_1002737F0;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, v23);
}

- (void)_openSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = [(DataStreamBulkSendProtocol *)self queue];
  dispatch_assert_queue_V2(v17);

  id v18 = [(DataStreamBulkSendProtocol *)self _createSessionIdentifier];
  v50[0] = @"type";
  v50[1] = @"streamId";
  v50[2] = @"target";
  v50[3] = @"reason";
  v39 = v12;
  v51[0] = v12;
  v51[1] = v18;
  v51[2] = @"controller";
  v51[3] = v13;
  id v19 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:4];
  id v20 = [v19 mutableCopy];

  if (v14 && [v14 count]) {
    [v20 setObject:v14 forKeyedSubscript:@"metadata"];
  }
  id v21 = [(DataStreamBulkSendProtocol *)self bulkSendSessionContextFactory];
  id v22 = ((void (**)(void, id))v21)[2](v21, v16);

  __int16 v23 = [(DataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
  [v23 setObject:v22 forKeyedSubscript:v18];

  id v24 = [v22 handleOpenRequestResponseTimer];
  [v24 setDelegate:self];

  id v25 = [(DataStreamBulkSendProtocol *)self queue];
  id v26 = [v22 handleOpenRequestResponseTimer];
  [v26 setDelegateQueue:v25];

  id v27 = [v22 handleOpenRequestResponseTimer];
  [v27 resume];

  id v28 = [v22 sendCloseEventTimer];
  [v28 setDelegate:self];

  v29 = [(DataStreamBulkSendProtocol *)self queue];
  int v30 = [v22 sendCloseEventTimer];
  [v30 setDelegateQueue:v29];

  long long v31 = [v22 sendCloseEventTimer];
  [v31 resume];

  __int16 v32 = self;
  id v33 = sub_100083F74();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    __int16 v34 = sub_100083FD0(v32);
    *(_DWORD *)buf = 138543874;
    id v45 = v34;
    __int16 v46 = 2112;
    id v47 = v18;
    __int16 v48 = 2112;
    id v49 = v14;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%{public}@Starting bulk session with identifier: %@ and metadata: %@", buf, 0x20u);
  }
  id v35 = [(DataStreamBulkSendProtocol *)v32 dataStream];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10004C100;
  v40[3] = &unk_100273858;
  v40[4] = v32;
  id v41 = v18;
  id v42 = v15;
  id v43 = v16;
  id v36 = v15;
  id v37 = v16;
  id v38 = v18;
  [v35 sendRequestForProtocol:@"dataSend" topic:@"open" payload:v20 completion:v40];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(DataStreamBulkSendProtocol *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [(DataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
  id v7 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (!v7) {
    goto LABEL_10;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v30;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(DataStreamBulkSendProtocol **)(*((void *)&v29 + 1) + 8 * i);
      id v12 = [(DataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
      id v13 = [v12 objectForKey:v11];

      id v14 = [v13 handleOpenRequestResponseTimer];

      if (v14 == v4)
      {
        [v13 setHandleOpenRequestResponseTimer:0];
        id v16 = v11;
        BOOL v17 = self;
        id v18 = sub_100083F74();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        id v19 = sub_100083FD0(v17);
        *(_DWORD *)buf = 138543618;
        __int16 v34 = v19;
        __int16 v35 = 2112;
        id v36 = v16;
        id v20 = "%{public}@Session with identifier: %@ open request response timer has expired";
        goto LABEL_15;
      }
      id v15 = [v13 sendCloseEventTimer];

      if (v15 == v4)
      {
        [v13 setSendCloseEventTimer:0];
        id v21 = v11;
        id v22 = self;
        id v18 = sub_100083F74();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        id v19 = sub_100083FD0(v22);
        *(_DWORD *)buf = 138543618;
        __int16 v34 = v19;
        __int16 v35 = 2112;
        id v36 = v21;
        id v20 = "%{public}@Session with identifier: %@ send event close timer has expired";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v20, buf, 0x16u);

LABEL_16:
        if (!v11) {
          goto LABEL_20;
        }
        __int16 v23 = [(DataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
        id v24 = [v23 objectForKeyedSubscript:v11];

        if ([v24 shouldCloseSessionWithTimeoutReason])
        {
          id v25 = self;
          id v26 = sub_100083F74();
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
LABEL_24:

            goto LABEL_25;
          }
          id v27 = sub_100083FD0(v25);
          *(_DWORD *)buf = 138543362;
          __int16 v34 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping invoking the session start callback since handle response timer hasn't expired", buf, 0xCu);
        }
        else
        {
          id v25 = [v24 sessionStartCallback];
          id v26 = +[NSError errorWithDomain:@"DKErrorDomain" code:12 userInfo:0];
          ((void (*)(DataStreamBulkSendProtocol *, void, NSObject *))v25->_dataStream)(v25, 0, v26);
          id v27 = [(DataStreamBulkSendProtocol *)self pendingBulkSendSessionContextBySessionIdentifier];
          [v27 setObject:0 forKeyedSubscript:v11];
        }

        goto LABEL_24;
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_10:

LABEL_20:
  id v11 = self;
  id v24 = sub_100083F74();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v28 = sub_100083FD0(v11);
    *(_DWORD *)buf = 138543618;
    __int16 v34 = v28;
    __int16 v35 = 2112;
    id v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{public}@Could not find expired timer for session with identifier: %@", buf, 0x16u);
  }
LABEL_25:
}

- (DataStreamProtocolDelegate)dataStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStream);

  return (DataStreamProtocolDelegate *)WeakRetained;
}

- (void)setDataStream:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)accessory
{
  id WeakRetained = objc_loadWeakRetained(&self->_accessory);

  return WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (NSMapTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (unsigned)nextSessionIdentifier
{
  return self->_nextSessionIdentifier;
}

- (void)setNextSessionIdentifier:(unsigned int)a3
{
  self->_nextSessionIdentifier = a3;
}

- (NSMapTable)activeBulkSendSessions
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)pendingBulkSendSessionContextBySessionIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (id)bulkSendSessionContextFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bulkSendSessionContextFactory, 0);
  objc_storeStrong((id *)&self->_pendingBulkSendSessionContextBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activeBulkSendSessions, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_destroyWeak(&self->_accessory);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_dataStream);
}

@end