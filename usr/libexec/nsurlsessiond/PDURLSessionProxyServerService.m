@interface PDURLSessionProxyServerService
+ (id)sharedService;
- (PDURLSessionProxyServerService)init;
- (id)_onqueue_loggableDescriptionForMessage:(id)a3;
- (id)_onqueue_sourceApplicationForMessage:(id)a3;
- (int64_t)_onqueue_IDSTimoutForMessage:(id)a3;
- (int64_t)_onqueue_priorityForMessage:(id)a3 ofType:(unsigned __int16)a4 isReply:(BOOL)a5;
- (void)_onqueue_devicesConnected;
- (void)_onqueue_handleFailedMessageSend:(id)a3 ofType:(unsigned __int16)a4;
- (void)_onqueue_handleReceivedMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5;
- (void)_onqueue_remoteDeviceStartedUp;
- (void)dealloc;
- (void)proxyServerBecameInvalid:(id)a3;
- (void)releaseBTLinkAssertion;
- (void)releaseInfraWiFi;
- (void)retainBTLinkAssertion;
- (void)retainInfraWiFi;
- (void)start;
@end

@implementation PDURLSessionProxyServerService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothCompanionLinkAssertion, 0);
  objc_storeStrong((id *)&self->_btLinkAssertionTimer, 0);
  objc_storeStrong((id *)&self->_infraWiFiTimer, 0);

  objc_storeStrong((id *)&self->_sessions, 0);
}

- (void)proxyServerBecameInvalid:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014B94;
  v5[3] = &unk_1000B63D0;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [(PDURLSessionProxyService *)self withWorkQueue:v5];
}

- (void)_onqueue_handleFailedMessageSend:(id)a3 ofType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v9 = a3;
  id v6 = [v9 _nsurlsessionproxy_sessionIdentifier];
  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v6];
    v8 = v7;
    if (v7) {
      [v7 handleFailedMessageSend:v9 ofType:v4];
    }
  }
  else
  {
    v8 = 0;
  }
}

- (void)_onqueue_handleReceivedMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  v31 = (void (**)(id, id))a5;
  id v9 = [v8 _nsurlsessionproxy_sessionIdentifier];
  v32 = [v8 _nsurlsessionproxy_sessionUUID];
  if (v9)
  {
    v10 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v9];
    v11 = v10;
    if (v6 == 1 && v10)
    {
      v12 = [(PDURLSessionProxyServer *)v10 uuidString];
      unsigned int v13 = [v12 isEqualToString:v32];

      if (v13)
      {
        v14 = qword_1000CB110;
        if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v34 = v9;
          *(_WORD *)&v34[8] = 2112;
          *(void *)&v34[10] = v32;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "PDURLSessionProxyServerService received CreateSession message for identifier %@ with existing UUID %@. Ignoring message.", buf, 0x16u);
        }
LABEL_41:

        goto LABEL_42;
      }
    }
    else if (v6 != 1)
    {
      v24 = qword_1000CB110;
      if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v34 = v6;
        *(_WORD *)&v34[4] = 2112;
        *(void *)&v34[6] = v9;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyServerService received message of type %u for session %@", buf, 0x12u);
      }
      if (v11)
      {
        [(PDURLSessionProxyServer *)v11 handleMessage:v8 ofType:v6 withReply:v31];
      }
      else
      {
        v25 = qword_1000CB110;
        if (v6 == 8)
        {
          if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v34 = v9;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyServerService received Invalidate message for unknown session identifier %@, replying with BecameInvalid message", buf, 0xCu);
          }
          v26 = objc_opt_new();
          v27 = objc_opt_new();
          [v27 setSessionIdentifier:v9];
          v28 = [v8 _nsurlsessionproxy_sessionUUID];
          [v27 setUuidString:v28];

          [v26 setSession:v27];
          v29 = +[PDURLSessionProxyServerService sharedService];
          [v29 sendProtobufMessage:v26 ofType:1008 withReply:0];
        }
        else if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v34 = v6;
          *(_WORD *)&v34[4] = 2112;
          *(void *)&v34[6] = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "NSURLSessionProxy message of type %u received for unknown session with identifier %@", buf, 0x12u);
        }
        v11 = 0;
      }
      goto LABEL_41;
    }
    id v16 = v8;
    v17 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v34 = v9;
      *(_WORD *)&v34[8] = 2112;
      *(void *)&v34[10] = v32;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyServerService received CreateSession message for identifier %@ with UUID %@", buf, 0x16u);
    }
    if (v11)
    {
      [(PDURLSessionProxyServer *)v11 obliterate];
      [(NSMutableDictionary *)self->_sessions removeObjectForKey:v9];
    }
    v30 = [v16 session];
    v18 = [v16 _actualConfiguration];
    unsigned int v19 = [v16 supportsRedirects];
    uint64_t v20 = v19;
    if (![v16 hasDelegateImplementsWillSendRequest]
      || [v16 delegateImplementsWillSendRequest])
    {
      uint64_t v20 = v19 | 2;
    }
    if (![v16 hasDelegateImplementsSessionAuthChallenge]
      || [v16 delegateImplementsSessionAuthChallenge])
    {
      v20 |= 4uLL;
    }
    if (![v16 hasDelegateImplementsTaskAuthChallenge]
      || [v16 delegateImplementsTaskAuthChallenge])
    {
      v20 |= 8uLL;
    }
    if (![v16 hasDelegateImplementsWillPerformRedirection]
      || [v16 delegateImplementsWillPerformRedirection])
    {
      v20 |= 0x10uLL;
    }
    if (![v16 hasDelegateImplementsDidReceiveResponse]
      || [v16 delegateImplementsDidReceiveResponse])
    {
      v20 |= 0x20uLL;
    }
    v21 = [PDURLSessionProxyServer alloc];
    v22 = [v30 uuidString];
    v23 = [(PDURLSessionProxyServer *)v21 initWithConfiguration:v18 uuidString:v22 options:v20 delegate:self];

    [(NSMutableDictionary *)self->_sessions setObject:v23 forKeyedSubscript:v9];
    v31[2](v31, v16);

    v11 = v23;
    goto LABEL_41;
  }
  v15 = qword_1000CB110;
  if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v34 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Received NSURLSessionProxy message of type %u without a session identifier", buf, 8u);
  }
LABEL_42:
}

- (id)_onqueue_loggableDescriptionForMessage:(id)a3
{
  id v4 = a3;
  v5 = [v4 _nsurlsessionproxy_sessionIdentifier];
  uint64_t v6 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v5];
  if (v6)
  {
    uint64_t v7 = [v6 messageLoggableDescriptionForTaskWithIdentifier:[v4 _nsurlsessionproxy_taskIdentifier]];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PDURLSessionProxyServerService;
    uint64_t v7 = [(PDURLSessionProxyService *)&v10 _onqueue_loggableDescriptionForMessage:v4];
  }
  id v8 = (void *)v7;

  return v8;
}

- (int64_t)_onqueue_IDSTimoutForMessage:(id)a3
{
  id v4 = a3;
  v5 = [v4 _nsurlsessionproxy_sessionIdentifier];
  uint64_t v6 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 IDSMessageTimeout];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PDURLSessionProxyServerService;
    id v8 = [(PDURLSessionProxyService *)&v11 _onqueue_IDSTimoutForMessage:v4];
  }
  int64_t v9 = (int64_t)v8;

  return v9;
}

- (id)_onqueue_sourceApplicationForMessage:(id)a3
{
  id v4 = [a3 _nsurlsessionproxy_sessionIdentifier];
  v5 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 sourceApplicationBundleIdentifier];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (int64_t)_onqueue_priorityForMessage:(id)a3 ofType:(unsigned __int16)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  int64_t v9 = [v8 _nsurlsessionproxy_sessionIdentifier];
  objc_super v10 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v9];
  if (v10)
  {
    id v11 = [v10 messagePriorityForTaskWithIdentifier:[v8 _nsurlsessionproxy_taskIdentifier] isReply:v5];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PDURLSessionProxyServerService;
    id v11 = [(PDURLSessionProxyService *)&v14 _onqueue_priorityForMessage:v8 ofType:v6 isReply:v5];
  }
  int64_t v12 = (int64_t)v11;

  return v12;
}

- (void)_onqueue_devicesConnected
{
}

- (void)_onqueue_remoteDeviceStartedUp
{
  [(NSMutableDictionary *)self->_sessions enumerateKeysAndObjectsUsingBlock:&stru_1000B5098];
  [(NSMutableDictionary *)self->_sessions removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)PDURLSessionProxyServerService;
  [(PDURLSessionProxyService *)&v3 _onqueue_remoteDeviceStartedUp];
}

- (void)releaseBTLinkAssertion
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100015758;
  v2[3] = &unk_1000B6380;
  v2[4] = self;
  [(PDURLSessionProxyService *)self withWorkQueue:v2];
}

- (void)retainBTLinkAssertion
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100015978;
  v2[3] = &unk_1000B6380;
  v2[4] = self;
  [(PDURLSessionProxyService *)self withWorkQueue:v2];
}

- (void)releaseInfraWiFi
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100016130;
  v2[3] = &unk_1000B6380;
  v2[4] = self;
  [(PDURLSessionProxyService *)self withWorkQueue:v2];
}

- (void)retainInfraWiFi
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100016320;
  v2[3] = &unk_1000B6380;
  v2[4] = self;
  [(PDURLSessionProxyService *)self withWorkQueue:v2];
}

- (void)start
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100016434;
  v2[3] = &unk_1000B6380;
  v2[4] = self;
  +[NSURLSession _obliterateAllBackgroundSessionsWithCompletionHandler:v2];
}

- (void)dealloc
{
  infraWiFiTimer = self->_infraWiFiTimer;
  if (infraWiFiTimer) {
    dispatch_source_cancel(infraWiFiTimer);
  }
  btLinkAssertionTimer = self->_btLinkAssertionTimer;
  if (btLinkAssertionTimer) {
    dispatch_source_cancel(btLinkAssertionTimer);
  }
  v5.receiver = self;
  v5.super_class = (Class)PDURLSessionProxyServerService;
  [(PDURLSessionProxyServerService *)&v5 dealloc];
}

- (PDURLSessionProxyServerService)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDURLSessionProxyServerService;
  v2 = [(PDURLSessionProxyService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    sessions = v2->_sessions;
    v2->_sessions = (NSMutableDictionary *)v3;

    v2->_infraWiFiRetainCount = 0;
    v2->_btLinkAssertionRetainCount = 0;
  }
  return v2;
}

+ (id)sharedService
{
  if (qword_1000CB040 != -1) {
    dispatch_once(&qword_1000CB040, &stru_1000B5058);
  }
  v2 = (void *)qword_1000CB038;

  return v2;
}

@end