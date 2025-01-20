@interface DataStreamStreamProtocol
+ (id)protocolName;
- (BOOL)isActive;
- (DataStreamProtocolDelegate)dataStream;
- (DataStreamStreamProtocol)initWithDataStream:(id)a3;
- (NSMapTable)sockets;
- (void)_closeAllSocketsWithError:(id)a3;
- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3;
- (void)_reevaluateTrafficClassForDataStream;
- (void)dataStream:(id)a3 didFailWithError:(id)a4;
- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStreamDidClose:(id)a3;
- (void)dataStreamInitiatedClose:(id)a3;
- (void)registerSocket:(id)a3;
- (void)sendData:(id)a3 socket:(id)a4 completion:(id)a5;
- (void)unregisterSocket:(id)a3;
@end

@implementation DataStreamStreamProtocol

+ (id)protocolName
{
  return @"stream";
}

- (DataStreamStreamProtocol)initWithDataStream:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DataStreamStreamProtocol;
  v5 = [(DataStreamStreamProtocol *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSMapTable strongToWeakObjectsMapTable];
    sockets = v5->_sockets;
    v5->_sockets = (NSMapTable *)v6;

    objc_storeWeak((id *)&v5->_dataStream, v4);
  }

  return v5;
}

- (void)registerSocket:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DataStreamStreamProtocol *)self isActive];
  uint64_t v6 = [(DataStreamStreamProtocol *)self sockets];
  v7 = [v4 applicationProtocolName];
  id v11 = [v6 objectForKey:v7];

  v8 = +[NSError hmfErrorWithCode:12];
  [v11 closeWithError:v8];

  objc_super v9 = [(DataStreamStreamProtocol *)self sockets];
  v10 = [v4 applicationProtocolName];
  [v9 setObject:v4 forKey:v10];

  [(DataStreamStreamProtocol *)self _notifyActiveStatusChangedFromPreviousValue:v5];
}

- (void)unregisterSocket:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(DataStreamStreamProtocol *)self isActive];
  BOOL v5 = [(DataStreamStreamProtocol *)self sockets];
  uint64_t v6 = [v10 applicationProtocolName];
  id v7 = [v5 objectForKey:v6];

  if (v7 == v10)
  {
    v8 = [(DataStreamStreamProtocol *)self sockets];
    objc_super v9 = [v10 applicationProtocolName];
    [v8 removeObjectForKey:v9];

    [(DataStreamStreamProtocol *)self _notifyActiveStatusChangedFromPreviousValue:v4];
    [(DataStreamStreamProtocol *)self _reevaluateTrafficClassForDataStream];
  }
}

- (void)_reevaluateTrafficClassForDataStream
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = [(NSMapTable *)self->_sockets objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [v10 trafficClass];
        if ((unint64_t)v11 > v7)
        {
          unint64_t v12 = (unint64_t)v11;
          uint64_t v13 = [v10 applicationProtocolName];

          uint64_t v6 = (void *)v13;
          unint64_t v7 = v12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v5);

    if (v6)
    {
      v14 = self;
      v15 = sub_100083F74();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = sub_100083FD0(v14);
        *(_DWORD *)buf = 138543874;
        v25 = v16;
        __int16 v26 = 2048;
        unint64_t v27 = v7;
        __int16 v28 = 2112;
        v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Setting data stream's traffic class to %lu (requested by: '%@')", buf, 0x20u);
      }
      goto LABEL_17;
    }
  }
  else
  {

    unint64_t v7 = 0;
  }
  v17 = self;
  v15 = sub_100083F74();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v18 = sub_100083FD0(v17);
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    __int16 v26 = 2048;
    unint64_t v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Setting data stream's traffic class to %lu (reset)", buf, 0x16u);
  }
  uint64_t v6 = 0;
LABEL_17:

  v19 = [(DataStreamStreamProtocol *)self dataStream];
  [v19 setTrafficClass:v7];
}

- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3
{
  if ([(DataStreamStreamProtocol *)self isActive] != a3)
  {
    id v4 = self;
    id v5 = sub_100083F74();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = sub_100083FD0(v4);
      [(DataStreamStreamProtocol *)v4 isActive];
      unint64_t v7 = HMFBooleanToString();
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 2112;
      unint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Stream protocol changes active to %@", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v8 = [(DataStreamStreamProtocol *)v4 dataStream];
    [v8 protocolDidUpdateActiveStatus:v4];
  }
}

- (void)sendData:(id)a3 socket:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  __int16 v11 = [(DataStreamStreamProtocol *)self dataStream];
  unint64_t v12 = [v9 applicationProtocolName];

  CFStringRef v17 = @"data";
  id v18 = v10;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000339D8;
  v15[3] = &unk_100273460;
  id v16 = v8;
  id v14 = v8;
  [v11 sendEventForProtocol:@"stream" topic:v12 payload:v13 completion:v15];
}

- (BOOL)isActive
{
  v2 = [(DataStreamStreamProtocol *)self sockets];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)dataStreamInitiatedClose:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(DataStreamStreamProtocol *)self sockets];
  id v4 = [v3 objectEnumerator];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) closeInitiated];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dataStreamDidClose:(id)a3
{
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
}

- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  long long v10 = [(DataStreamStreamProtocol *)self sockets];
  long long v11 = [v10 objectForKey:v8];

  if (!v11)
  {
    uint64_t v13 = self;
    id v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = sub_100083FD0(v13);
      int v19 = 138543874;
      long long v20 = v15;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      id v16 = "%{public}@No active socket, dropping packet with topic=%@ payload=%@";
      CFStringRef v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v19, 0x20u);
    }
LABEL_9:

    goto LABEL_10;
  }
  long long v12 = [v9 objectForKeyedSubscript:@"data"];

  if (!v12)
  {
    uint64_t v13 = self;
    id v14 = sub_100083F74();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = sub_100083FD0(v13);
      int v19 = 138543874;
      long long v20 = v15;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      id v16 = "%{public}@No data field in payload, dropping packet with topic=%@ payload=%@";
      CFStringRef v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v13 = [v9 objectForKeyedSubscript:@"data"];
  [v11 handleIncomingData:v13];
LABEL_10:
}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = self;
  uint64_t v13 = sub_100083F74();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = sub_100083FD0(v12);
    int v15 = 138544130;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Stream protocol does not support request message with topic=%@, header=%@, payload=%@", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = self;
  uint64_t v13 = sub_100083F74();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = sub_100083FD0(v12);
    int v15 = 138544130;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Stream protocol does not support response message with topic=%@, header=%@, payload=%@", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)_closeAllSocketsWithError:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(DataStreamStreamProtocol *)self sockets];
  id v6 = [v5 objectEnumerator];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
        if (v11) {
          [v11 closeWithError:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  long long v12 = [(DataStreamStreamProtocol *)self sockets];
  [v12 removeAllObjects];
}

- (NSMapTable)sockets
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (DataStreamProtocolDelegate)dataStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStream);

  return (DataStreamProtocolDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataStream);

  objc_storeStrong((id *)&self->_sockets, 0);
}

@end