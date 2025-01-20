@interface DataStream
+ (id)logCategory;
- (BOOL)firstMessageReceived;
- (BOOL)handleFirstMessageReceivedOnDataStream:(id)a3 payload:(id)a4;
- (BOOL)isActive;
- (DataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6;
- (DataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6 connectionTimer:(id)a7 helloMessageResponseTimer:(id)a8;
- (DataStreamControlProtocol)controlProtocol;
- (DataStreamDelegate)delegate;
- (DataStreamTransport)transport;
- (HAPSecuritySessionEncryption)sessionEncryption;
- (HMFTimer)connectionTimer;
- (HMFTimer)helloMessageResponseTimer;
- (NSMapTable)protocols;
- (NSMutableArray)pendingEvents;
- (NSMutableSet)pendingRequests;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)createRequestIdentifier;
- (id)protocolWithName:(id)a3;
- (unint64_t)nextRequestIdentifier;
- (void)_evaluateActiveStatusChange;
- (void)_failPendingMessagesWithError:(id)a3;
- (void)_handlePendingEvents;
- (void)_handlePendingRequests;
- (void)_sendMessageWithHeader:(id)a3 payload:(id)a4 completion:(id)a5;
- (void)addProtocol:(id)a3 name:(id)a4;
- (void)close;
- (void)connect;
- (void)fulfillPendingRequestWithResponseHeader:(id)a3 payload:(id)a4;
- (void)invalidate;
- (void)protocolDidUpdateActiveStatus:(id)a3;
- (void)sendEventForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6;
- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 identifier:(unint64_t)a5 payload:(id)a6 completion:(id)a7;
- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6;
- (void)sendResponseForRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5 completion:(id)a6;
- (void)setActive:(BOOL)a3;
- (void)setConnectionTimer:(id)a3;
- (void)setControlProtocol:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstMessageReceived:(BOOL)a3;
- (void)setHelloMessageResponseTimer:(id)a3;
- (void)setNextRequestIdentifier:(unint64_t)a3;
- (void)setProtocols:(id)a3;
- (void)setSessionEncryption:(id)a3;
- (void)setTrafficClass:(unint64_t)a3;
- (void)setTransport:(id)a3;
- (void)startConnectionTimer;
- (void)startHelloMessageResponseTimer;
- (void)timerDidFire:(id)a3;
- (void)transport:(id)a3 didFailWithError:(id)a4;
- (void)transport:(id)a3 didReceiveRawFrame:(id)a4;
- (void)transportDidClose:(id)a3;
- (void)transportDidOpen:(id)a3;
@end

@implementation DataStream

+ (id)logCategory
{
  if (qword_1002AD638 != -1) {
    dispatch_once(&qword_1002AD638, &stru_100273090);
  }
  v0 = (void *)qword_1002AD640;

  return v0;
}

- (DataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)HMFTimer) initWithTimeInterval:0 options:10.0];
  id v15 = [objc_alloc((Class)HMFTimer) initWithTimeInterval:0 options:10.0];
  v16 = [(DataStream *)self initWithTransport:v13 sessionEncryption:v12 workQueue:v11 logIdentifier:v10 connectionTimer:v14 helloMessageResponseTimer:v15];

  return v16;
}

- (DataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6 connectionTimer:(id)a7 helloMessageResponseTimer:(id)a8
{
  id v33 = a3;
  id v32 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)DataStream;
  v19 = [(DataStream *)&v34 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_transport, a3);
    objc_storeStrong((id *)&v20->_sessionEncryption, a4);
    objc_storeStrong((id *)&v20->_workQueue, a5);
    v21 = (NSString *)[v16 copyWithZone:v32];
    logIdentifier = v20->_logIdentifier;
    v20->_logIdentifier = v21;

    objc_storeStrong((id *)&v20->_connectionTimer, a7);
    objc_storeStrong((id *)&v20->_helloMessageResponseTimer, a8);
    uint64_t v23 = +[NSMapTable strongToStrongObjectsMapTable];
    protocols = v20->_protocols;
    v20->_protocols = (NSMapTable *)v23;

    v25 = [[DataStreamControlProtocol alloc] initWithLogIdentifier:v16];
    controlProtocol = v20->_controlProtocol;
    v20->_controlProtocol = v25;

    v27 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingRequests = v20->_pendingRequests;
    v20->_pendingRequests = v27;

    v29 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingEvents = v20->_pendingEvents;
    v20->_pendingEvents = v29;
  }
  return v20;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(DataStream *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_active != v3)
  {
    self->_active = v3;
    v6 = self;
    v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = sub_100083FD0(v6);
      v9 = HMFBooleanToString();
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream changes active to %@", (uint8_t *)&v11, 0x16u);
    }
    id v10 = [(DataStream *)v6 delegate];
    [v10 dataStreamDidUpdateActiveStatus:v6];
  }
}

- (void)connect
{
  v2 = self;
  BOOL v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = sub_100083FD0(v2);
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@DataStream connecting", (uint8_t *)&v6, 0xCu);
  }
  [(DataStream *)v2 startConnectionTimer];
  v5 = [(DataStream *)v2 transport];
  [v5 connect];
}

- (void)invalidate
{
  v2 = self;
  BOOL v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = sub_100083FD0(v2);
    *(_DWORD *)buf = 138543362;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@DataStream invalidated", buf, 0xCu);
  }
  v5 = [(DataStream *)v2 transport];
  [v5 invalidate];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v6 = [(DataStream *)v2 protocols];
  v7 = [v6 objectEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      int v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) dataStreamInitiatedClose:v2];
        int v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)close
{
  v2 = self;
  BOOL v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = sub_100083FD0(v2);
    *(_DWORD *)buf = 138543362;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@DataStream closing", buf, 0xCu);
  }
  v5 = [(DataStream *)v2 transport];
  [v5 close];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v6 = [(DataStream *)v2 protocols];
  v7 = [v6 objectEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      int v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) dataStreamInitiatedClose:v2];
        int v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)addProtocol:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DataStream *)self protocols];
  [v8 setObject:v7 forKey:v6];

  [(DataStream *)self _evaluateActiveStatusChange];
}

- (id)protocolWithName:(id)a3
{
  id v4 = a3;
  v5 = [(DataStream *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(DataStream *)self protocols];
  id v7 = [v6 objectForKey:v4];

  return v7;
}

- (id)createRequestIdentifier
{
  unint64_t v3 = [(DataStream *)self nextRequestIdentifier];
  [(DataStream *)self setNextRequestIdentifier:(char *)[(DataStream *)self nextRequestIdentifier] + 1];

  return +[NSNumber numberWithUnsignedLongLong:v3];
}

- (void)_sendMessageWithHeader:(id)a3 payload:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  int v11 = [(DataStream *)self sessionEncryption];

  if (v11)
  {
    long long v12 = [(DataStream *)self sessionEncryption];
    id v23 = 0;
    long long v13 = +[DataStreamMessageCoder encryptEncryptedOPACKHeader:v8 payload:v9 sessionEncryption:v12 error:&v23];
    id v14 = v23;
  }
  else
  {
    id v22 = 0;
    long long v13 = +[DataStreamMessageCoder buildUnencryptedOPACKHeader:v8 payload:v9 error:&v22];
    id v14 = v22;
  }
  long long v15 = self;
  id v16 = sub_100083F74();
  id v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v18 = sub_100083FD0(v15);
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@DataStream encoding message failed (%@)", buf, 0x16u);
    }
    v10[2](v10, v14);
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v19 = sub_100083FD0(v15);
      v20 = [(DataStream *)v15 pendingRequests];
      *(_DWORD *)buf = 138543874;
      v25 = v19;
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}@DataStream Sending Message: %@ --> %@", buf, 0x20u);
    }
    v21 = [(DataStream *)v15 transport];
    [v21 sendRawFrame:v13 completion:v10];
  }
}

- (void)sendEventForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = (void (**)(id, DataStreamPendingEvent *))a6;
  if ([(DataStream *)self firstMessageReceived])
  {
    long long v13 = [(DataStream *)self controlProtocol];
    unsigned __int8 v14 = [v13 helloMessageResponseReceived];

    if (v14)
    {
      long long v15 = +[DataStreamMessageCoder eventHeaderForProtocol:v17 topic:v10];
      [(DataStream *)self _sendMessageWithHeader:v15 payload:v11 completion:v12];
    }
    else
    {
      long long v15 = +[NSError errorWithDomain:@"DKErrorDomain" code:22 userInfo:0];
      v12[2](v12, v15);
    }
  }
  else
  {
    long long v15 = [[DataStreamPendingEvent alloc] initWithProtocol:v17 topic:v10 payload:v11 completion:v12];
    id v16 = [(DataStream *)self pendingEvents];
    [v16 addObject:v15];
  }
}

- (void)sendResponseForRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5 completion:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = +[DataStreamMessageCoder responseHeaderForRequestHeader:a3 status:v6];
  [(DataStream *)self _sendMessageWithHeader:v12 payload:v11 completion:v10];
}

- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 identifier:(unint64_t)a5 payload:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[NSNumber numberWithUnsignedInteger:a5];
  id v17 = +[DataStreamMessageCoder requestHeaderForProtocol:v15 topic:v14 identifier:v16];

  [(DataStream *)self _sendMessageWithHeader:v17 payload:v13 completion:v12];
}

- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(DataStream *)self createRequestIdentifier];
  if ([(DataStream *)self firstMessageReceived])
  {
    id v15 = [(DataStream *)self controlProtocol];
    unsigned __int8 v16 = [v15 helloMessageResponseReceived];

    if ((v16 & 1) == 0)
    {
      v19 = +[NSError errorWithDomain:@"DKErrorDomain" code:22 userInfo:0];
      (*((void (**)(id, void *, void, void))v13 + 2))(v13, v19, 0, 0);

      goto LABEL_7;
    }
    id v17 = +[DataStreamMessageCoder requestHeaderForProtocol:v10 topic:v11 identifier:v14];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000157B8;
    v20[3] = &unk_1002730B8;
    id v26 = v13;
    id v21 = v14;
    id v22 = v10;
    id v23 = v11;
    id v24 = v12;
    v25 = self;
    [(DataStream *)self _sendMessageWithHeader:v17 payload:v24 completion:v20];
  }
  else
  {
    id v17 = [[DataStreamPendingRequest alloc] initWithIdentifier:v14 protocol:v10 topic:v11 payload:v12 callback:v13];
    id v18 = [(DataStream *)self pendingRequests];
    [v18 addObject:v17];
  }
LABEL_7:
}

- (void)protocolDidUpdateActiveStatus:(id)a3
{
}

- (void)_evaluateActiveStatusChange
{
  unint64_t v3 = [(DataStream *)self workQueue];
  dispatch_assert_queue_V2(v3);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(DataStream *)self protocols];
  uint64_t v5 = (uint64_t)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [(DataStream *)self protocols];
        id v10 = [v9 objectForKey:v8];
        unsigned __int8 v11 = [v10 isActive];

        if (v11)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = (uint64_t)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [(DataStream *)self setActive:v5];
}

- (void)setTrafficClass:(unint64_t)a3
{
  id v4 = self;
  uint64_t v5 = sub_100083F74();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = sub_100083FD0(v4);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Setting traffic class %lu on transport", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(DataStream *)v4 transport];
  [v7 setTrafficClass:a3];
}

- (void)_failPendingMessagesWithError:(id)a3
{
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [(DataStream *)self pendingRequests];
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v9) callback];
        ((void (**)(void, id, void, void))v10)[2](v10, v4, 0, 0);

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  unint64_t v11 = [(DataStream *)self pendingRequests];
  [v11 removeAllObjects];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = [(DataStream *)self pendingEvents];
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      unsigned __int8 v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) completion];
        ((void (**)(void, id))v17)[2](v17, v4);

        unsigned __int8 v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  id v18 = [(DataStream *)self pendingEvents];
  [v18 removeAllObjects];
}

- (void)transport:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(DataStream *)self delegate];
  id v7 = self;
  uint64_t v8 = sub_100083F74();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = sub_100083FD0(v7);
      *(_DWORD *)buf = 138543618;
      long long v25 = v10;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Data stream failure (%@)", buf, 0x16u);
    }
    [v6 dataStream:v7 didFailWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v11 = sub_100083FD0(v7);
      *(_DWORD *)buf = 138543618;
      long long v25 = v11;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@Data stream failure (%@); but no delegate",
        buf,
        0x16u);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = [(DataStream *)v7 protocols];
  id v13 = [v12 objectEnumerator];

  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v17);
        if (v18) {
          [v18 dataStream:v7 didFailWithError:v5];
        }
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  [(DataStream *)v7 _failPendingMessagesWithError:v5];
}

- (void)transportDidClose:(id)a3
{
  id v4 = [(DataStream *)self delegate];
  id v5 = self;
  id v6 = sub_100083F74();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      uint64_t v8 = sub_100083FD0(v5);
      *(_DWORD *)buf = 138543362;
      long long v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Data stream closed", buf, 0xCu);
    }
    [v4 dataStreamDidClose:v5];
  }
  else
  {
    if (v7)
    {
      id v9 = sub_100083FD0(v5);
      *(_DWORD *)buf = 138543362;
      long long v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Data stream closed (but no delegate!)", buf, 0xCu);
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  __int16 v10 = [(DataStream *)v5 protocols];
  unint64_t v11 = [v10 objectEnumerator];

  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v15) dataStreamDidClose:v5];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  uint64_t v16 = +[NSError errorWithDomain:@"DKErrorDomain" code:39 userInfo:0];
  [(DataStream *)v5 _failPendingMessagesWithError:v16];
}

- (void)transportDidOpen:(id)a3
{
  [(DataStream *)self setConnectionTimer:0];
  id v4 = [(DataStream *)self delegate];
  id v5 = self;
  id v6 = sub_100083F74();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      uint64_t v8 = sub_100083FD0(v5);
      *(_DWORD *)buf = 138543362;
      long long v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Data stream OPEN!", buf, 0xCu);
    }
    [v4 dataStreamDidOpen:v5];
  }
  else
  {
    if (v7)
    {
      id v9 = sub_100083FD0(v5);
      *(_DWORD *)buf = 138543362;
      long long v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Data stream OPEN (but no delegate!)", buf, 0xCu);
    }
  }
  __int16 v10 = [(DataStream *)v5 controlProtocol];
  [v10 dataStreamDidOpen:v5];

  [(DataStream *)v5 startHelloMessageResponseTimer];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v11 = [(DataStream *)v5 protocols];
  id v12 = [v11 objectEnumerator];

  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v16);
        if (v17) {
          [v17 dataStreamDidOpen:v5];
        }
        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (BOOL)handleFirstMessageReceivedOnDataStream:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"protocol"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  __int16 v10 = v9;
  if (([(DataStream *)v10 isEqualToString:@"control"] & 1) == 0)
  {
    unint64_t v11 = self;
    id v13 = sub_100083F74();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      unsigned __int8 v16 = 0;
      goto LABEL_17;
    }
    sub_100083FD0(v11);
    long long v17 = (DataStream *)objc_claimAutoreleasedReturnValue();
    int v21 = 138543874;
    long long v22 = v17;
    __int16 v23 = 2112;
    CFStringRef v24 = @"control";
    __int16 v25 = 2112;
    __int16 v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Expected protocol name: %@ received: %@", (uint8_t *)&v21, 0x20u);
LABEL_15:

    goto LABEL_16;
  }
  unint64_t v11 = [v6 objectForKeyedSubscript:@"response"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;
  if (!v13)
  {
    long long v17 = self;
    long long v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      sub_100083FD0(v17);
      long long v19 = (DataStream *)objc_claimAutoreleasedReturnValue();
      int v21 = 138543874;
      long long v22 = v19;
      __int16 v23 = 2112;
      CFStringRef v24 = @"response";
      __int16 v25 = 2112;
      __int16 v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected %@ key value: %@", (uint8_t *)&v21, 0x20u);
    }
    goto LABEL_15;
  }
  id v14 = [(DataStream *)self controlProtocol];
  [v14 dataStream:self didReceiveResponse:v11 header:v6 payload:v7];

  uint64_t v15 = [(DataStream *)self controlProtocol];
  unsigned __int8 v16 = [v15 helloMessageResponseReceived];

LABEL_17:
  return v16;
}

- (void)_handlePendingRequests
{
  unint64_t v3 = [(DataStream *)self pendingRequests];
  id v4 = [v3 copy];

  id v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = sub_100083FD0(v5);
    uint64_t v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    *(_DWORD *)buf = 138543618;
    __int16 v26 = v7;
    __int16 v27 = 2112;
    __int16 v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Sending out all pending requests [%@]", buf, 0x16u);
  }
  id v9 = [(DataStream *)v5 pendingRequests];
  [v9 removeAllObjects];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned __int8 v16 = [v15 protocol:v20];
        long long v17 = [v15 topic];
        long long v18 = [v15 payload];
        long long v19 = [v15 callback];
        [(DataStream *)v5 sendRequestForProtocol:v16 topic:v17 payload:v18 completion:v19];
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)_handlePendingEvents
{
  unint64_t v3 = [(DataStream *)self pendingEvents];
  id v4 = [v3 copy];

  id v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = sub_100083FD0(v5);
    uint64_t v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    *(_DWORD *)buf = 138543618;
    __int16 v26 = v7;
    __int16 v27 = 2112;
    __int16 v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@Sending out all pending events [%@]", buf, 0x16u);
  }
  id v9 = [(DataStream *)v5 pendingEvents];
  [v9 removeAllObjects];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned __int8 v16 = [v15 protocol:v20];
        long long v17 = [v15 topic];
        long long v18 = [v15 payload];
        long long v19 = [v15 completion];
        [(DataStream *)v5 sendEventForProtocol:v16 topic:v17 payload:v18 completion:v19];
      }
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)transport:(id)a3 didReceiveRawFrame:(id)a4
{
  id v5 = a4;
  id v6 = [(DataStream *)self delegate];
  id v7 = self;
  uint64_t v8 = sub_100083F74();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v10 = sub_100083FD0(v7);
      *(_DWORD *)buf = 138543362;
      v63 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@Data stream received frame", buf, 0xCu);
    }
    [v6 dataStreamDidReceiveRawFrame:v7];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v11 = sub_100083FD0(v7);
      *(_DWORD *)buf = 138543362;
      v63 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@Data stream received frame; but no delegate",
        buf,
        0xCu);
    }
  }
  if ([v5 length])
  {
    id v12 = v5;
    int v13 = *(unsigned __int8 *)[v12 bytes];
    switch(v13)
    {
      case 0:
      case 2:
        id v14 = v7;
        uint64_t v15 = sub_100083F74();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v16 = sub_100083FD0(v14);
          *(_DWORD *)buf = 138543618;
          v63 = v16;
          __int16 v64 = 1024;
          LODWORD(v65) = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Data stream failed due to unrecognized frame type 0x%02x", buf, 0x12u);
        }
        goto LABEL_23;
      case 1:
        long long v20 = [(DataStream *)v7 sessionEncryption];

        if (v20)
        {
          long long v21 = [(DataStream *)v7 sessionEncryption];
          id v60 = 0;
          id v61 = 0;
          id v59 = 0;
          unsigned __int8 v22 = +[DataStreamMessageCoder decryptEncryptedOPACKFrame:v12 sessionEncryption:v21 receivedHeader:&v61 receivedPayload:&v60 error:&v59];
          long long v17 = (DataStream *)v61;
          long long v18 = v60;
          id v23 = v59;

          if (!v23) {
            goto LABEL_30;
          }
          goto LABEL_25;
        }
        __int16 v28 = v7;
        uint64_t v15 = sub_100083F74();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        __int16 v26 = sub_100083FD0(v28);
        *(_DWORD *)buf = 138543362;
        v63 = v26;
        __int16 v27 = "%{public}@Data stream failed due to receiving unencrypted frame";
        goto LABEL_22;
      case 3:
        CFStringRef v24 = [(DataStream *)v7 sessionEncryption];

        if (v24)
        {
          __int16 v25 = v7;
          uint64_t v15 = sub_100083F74();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            __int16 v26 = sub_100083FD0(v25);
            *(_DWORD *)buf = 138543362;
            v63 = v26;
            __int16 v27 = "%{public}@Data stream failed due to receiving encrypted frame";
LABEL_22:
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
          }
LABEL_23:

LABEL_24:
          long long v17 = 0;
          long long v18 = 0;
          id v23 = 0;
          goto LABEL_25;
        }
        id v57 = 0;
        id v58 = 0;
        id v56 = 0;
        unsigned __int8 v22 = +[DataStreamMessageCoder unpackUnencryptedOPACKFrame:v12 receivedHeader:&v58 receivedPayload:&v57 error:&v56];
        long long v17 = (DataStream *)v58;
        long long v18 = v57;
        id v23 = v56;
        if (v23) {
          goto LABEL_25;
        }
LABEL_30:
        if ((v22 & 1) == 0)
        {
LABEL_25:
          v29 = v7;
          v30 = sub_100083F74();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = sub_100083FD0(v29);
            *(_DWORD *)buf = 138543618;
            v63 = v31;
            __int16 v64 = 2112;
            id v65 = v23;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%{public}@DataStream dropping incoming message (%@)", buf, 0x16u);
          }
          break;
        }
        if ([(DataStream *)v7 firstMessageReceived])
        {
          id v32 = [(DataStream *)v17 objectForKeyedSubscript:@"response"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v33 = v32;
          }
          else {
            id v33 = 0;
          }
          id v34 = v33;

          if (v34)
          {
            [(DataStream *)v7 fulfillPendingRequestWithResponseHeader:v17 payload:v18];
LABEL_72:

            break;
          }
          v39 = [(DataStream *)v17 objectForKeyedSubscript:@"protocol"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v40 = v39;
          }
          else {
            v40 = 0;
          }
          id v41 = v40;

          if (v41)
          {
            if ([v41 isEqual:@"control"])
            {
              id v32 = [(DataStream *)v17 objectForKeyedSubscript:@"event"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v42 = v32;
              }
              else {
                v42 = 0;
              }
              id v43 = v42;

              if (v43)
              {
                v44 = [(DataStream *)v7 controlProtocol];
                v45 = v44;
LABEL_61:
                [(DataStream *)v44 dataStream:v7 didReceiveEvent:v43 header:v17 payload:v18];
LABEL_71:

                goto LABEL_72;
              }
              id v32 = [(DataStream *)v17 objectForKeyedSubscript:@"request"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v51 = v32;
              }
              else {
                v51 = 0;
              }
              id v52 = v51;

              if (v52)
              {
                v53 = [(DataStream *)v7 controlProtocol];
                v45 = v53;
LABEL_78:
                [(DataStream *)v53 dataStream:v7 didReceiveRequest:v52 header:v17 payload:v18];
                goto LABEL_71;
              }
            }
            else
            {
              v49 = [(DataStream *)v7 protocols];
              v45 = [v49 objectForKey:v41];

              if (!v45)
              {
                v46 = v7;
                v47 = sub_100083F74();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  v54 = sub_100083FD0(v46);
                  *(_DWORD *)buf = 138543618;
                  v63 = v54;
                  __int16 v64 = 2112;
                  id v65 = v41;
                  _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%{public}@DataStream dropping incoming message (no protocol named %@)", buf, 0x16u);
                }
                goto LABEL_69;
              }
              id v32 = [(DataStream *)v17 objectForKeyedSubscript:@"event"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v50 = v32;
              }
              else {
                v50 = 0;
              }
              id v43 = v50;

              if (v43)
              {
                v44 = v45;
                goto LABEL_61;
              }
              id v32 = [(DataStream *)v17 objectForKeyedSubscript:@"request"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v55 = v32;
              }
              else {
                v55 = 0;
              }
              id v52 = v55;

              if (v52)
              {
                v53 = v45;
                goto LABEL_78;
              }
            }
            v45 = v7;
            v46 = sub_100083F74();
            if (!os_log_type_enabled(v46, OS_LOG_TYPE_INFO)) {
              goto LABEL_70;
            }
            v47 = sub_100083FD0(v45);
            *(_DWORD *)buf = 138543362;
            v63 = v47;
            v48 = "%{public}@Message received but no protocol accepted it; dropped!";
          }
          else
          {
            v45 = v7;
            v46 = sub_100083F74();
            if (!os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
LABEL_70:

              id v32 = 0;
              goto LABEL_71;
            }
            v47 = sub_100083FD0(v45);
            *(_DWORD *)buf = 138543362;
            v63 = v47;
            v48 = "%{public}@DataStream dropping incoming message (header missing protocol)";
          }
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, v48, buf, 0xCu);
LABEL_69:

          goto LABEL_70;
        }
        if (![(DataStream *)v7 handleFirstMessageReceivedOnDataStream:v17 payload:v18])
        {
          v35 = v7;
          v36 = sub_100083F74();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v37 = sub_100083FD0(v35);
            *(_DWORD *)buf = 138543362;
            v63 = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected first message on the data stream", buf, 0xCu);
          }
          [(DataStream *)v35 close];
        }
        [(DataStream *)v7 setFirstMessageReceived:1];
        v38 = [(DataStream *)v7 helloMessageResponseTimer];
        [v38 suspend];

        [(DataStream *)v7 setHelloMessageResponseTimer:0];
        [(DataStream *)v7 _handlePendingRequests];
        [(DataStream *)v7 _handlePendingEvents];
        break;
      default:
        goto LABEL_24;
    }
  }
  else
  {
    long long v17 = v7;
    long long v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543362;
      v63 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@DataStream dropping truncated frame of zero-length", buf, 0xCu);
    }
  }
}

- (void)fulfillPendingRequestWithResponseHeader:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [(DataStream *)self pendingRequests];
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      int v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
      if ([v13 matchesResponseHeader:v6]) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v13;

    if (!v14) {
      goto LABEL_12;
    }
    uint64_t v15 = [(DataStream *)v14 callback];
    ((void (**)(void, void, id, id))v15)[2](v15, 0, v6, v7);

    unsigned __int8 v16 = [(DataStream *)self pendingRequests];
    [v16 removeObject:v14];
  }
  else
  {
LABEL_9:

LABEL_12:
    id v14 = self;
    unsigned __int8 v16 = sub_100083F74();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = sub_100083FD0(v14);
      long long v18 = [(DataStream *)v14 pendingRequests];
      *(_DWORD *)buf = 138543874;
      CFStringRef v24 = v17;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      __int16 v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@No pending request found for response with header: %@. Pending %@", buf, 0x20u);
    }
  }
}

- (void)startConnectionTimer
{
  unint64_t v3 = [(DataStream *)self connectionTimer];
  [v3 setDelegate:self];

  id v4 = [(DataStream *)self workQueue];
  id v5 = [(DataStream *)self connectionTimer];
  [v5 setDelegateQueue:v4];

  id v6 = [(DataStream *)self connectionTimer];
  [v6 resume];
}

- (void)startHelloMessageResponseTimer
{
  unint64_t v3 = [(DataStream *)self helloMessageResponseTimer];
  [v3 setDelegate:self];

  id v4 = [(DataStream *)self workQueue];
  id v5 = [(DataStream *)self helloMessageResponseTimer];
  [v5 setDelegateQueue:v4];

  id v6 = [(DataStream *)self helloMessageResponseTimer];
  [v6 resume];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(DataStream *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(DataStream *)self connectionTimer];

  if (v6 == v4)
  {
    uint64_t v12 = self;
    id v9 = sub_100083F74();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = sub_100083FD0(v12);
      int v13 = 138543362;
      id v14 = v10;
      uint64_t v11 = "%{public}@Data stream failed to connect in time; closing!";
      goto LABEL_7;
    }
LABEL_8:

    [(DataStream *)self close];
    goto LABEL_9;
  }
  id v7 = [(DataStream *)self helloMessageResponseTimer];

  if (v7 == v4)
  {
    uint64_t v8 = self;
    id v9 = sub_100083F74();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = sub_100083FD0(v8);
      int v13 = 138543362;
      id v14 = v10;
      uint64_t v11 = "%{public}@Data stream failed to receive first message in time; closing!";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (DataStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DataStreamDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (DataStreamTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (HAPSecuritySessionEncryption)sessionEncryption
{
  return self->_sessionEncryption;
}

- (void)setSessionEncryption:(id)a3
{
}

- (NSMapTable)protocols
{
  return self->_protocols;
}

- (void)setProtocols:(id)a3
{
}

- (DataStreamControlProtocol)controlProtocol
{
  return self->_controlProtocol;
}

- (void)setControlProtocol:(id)a3
{
}

- (BOOL)firstMessageReceived
{
  return self->_firstMessageReceived;
}

- (void)setFirstMessageReceived:(BOOL)a3
{
  self->_firstMessageReceived = a3;
}

- (HMFTimer)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
}

- (HMFTimer)helloMessageResponseTimer
{
  return self->_helloMessageResponseTimer;
}

- (void)setHelloMessageResponseTimer:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)nextRequestIdentifier
{
  return self->_nextRequestIdentifier;
}

- (void)setNextRequestIdentifier:(unint64_t)a3
{
  self->_nextRequestIdentifier = a3;
}

- (NSMutableSet)pendingRequests
{
  return self->_pendingRequests;
}

- (NSMutableArray)pendingEvents
{
  return self->_pendingEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_helloMessageResponseTimer, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_controlProtocol, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
  objc_storeStrong((id *)&self->_sessionEncryption, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end