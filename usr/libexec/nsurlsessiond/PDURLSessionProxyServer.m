@interface PDURLSessionProxyServer
+ (void)initialize;
- (BOOL)shouldRetainBTLinkAssertion;
- (BOOL)shouldRetainInfraWiFi;
- (NSString)identifier;
- (NSString)uuidString;
- (PDURLSessionProxyServer)initWithConfiguration:(id)a3 uuidString:(id)a4 options:(unint64_t)a5 delegate:(id)a6;
- (PDURLSessionProxyServerDelegate)delegate;
- (id)baseMessage;
- (id)descriptionForTaskWithIdentifier:(unint64_t)a3;
- (id)getTaskInformation;
- (id)messageLoggableDescriptionForTaskWithIdentifier:(unint64_t)a3;
- (id)sourceApplicationBundleIdentifier;
- (id)taskMessageForIdentifier:(unint64_t)a3;
- (int64_t)IDSMessageTimeout;
- (int64_t)messagePriorityForTaskWithIdentifier:(unint64_t)a3 isReply:(BOOL)a4;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_URLSession:(id)a3 connectionEstablishedForStreamTask:(id)a4;
- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6;
- (void)devicesConnected;
- (void)handleCancelTaskMessage:(id)a3 forTaskIdentifier:(unint64_t)a4;
- (void)handleDataTaskWithRequestMessage:(id)a3 forTaskIdentifier:(unint64_t)a4 withReply:(id)a5;
- (void)handleFailedMessageSend:(id)a3 ofType:(unsigned __int16)a4;
- (void)handleInvalidateMessage:(id)a3;
- (void)handleMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5;
- (void)handleOpenSocketMessage:(id)a3 withReply:(id)a4;
- (void)handleResumeTaskMessage:(id)a3 forTaskIdentifier:(unint64_t)a4 withReply:(id)a5;
- (void)handleSetDescriptionMessage:(id)a3 forTaskIdentifier:(unint64_t)a4;
- (void)handleSetPriorityMessage:(id)a3 forTaskIdentifier:(unint64_t)a4;
- (void)handleSuspendTaskMessage:(id)a3 forTaskIdentifier:(unint64_t)a4;
- (void)handleUploadBodyDataMessage:(id)a3 forTaskIdentifier:(unint64_t)a4 withReply:(id)a5;
- (void)obliterate;
- (void)performForwardingFromStreamTask:(id)a3 toTCPConnection:(id)a4;
- (void)performForwardingFromTCPConnection:(id)a3 toStreamTask:(id)a4;
- (void)releaseBTLinkAssertionIfNecessary:(unint64_t)a3;
- (void)releaseInfraWiFiForTaskIfNecessary:(unint64_t)a3;
- (void)resendPendingMessage:(id)a3;
- (void)retainBTLinkAssertionWithIdentifier:(unint64_t)a3;
- (void)retainInfraWiFiForTaskWithIdentifier:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setUuidString:(id)a3;
@end

@implementation PDURLSessionProxyServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messagesToReSend, 0);
  objc_storeStrong((id *)&self->_deviceConnections, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersRetainingBTLinkAssertion, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersRetainingInfraWiFi, 0);
  objc_storeStrong((id *)&self->_streamTasksToOpenSocketReplies, 0);
  objc_storeStrong((id *)&self->_streamTasksToIDSTCPConnections, 0);
  objc_storeStrong((id *)&self->_streamTasksToDeviceConnections, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToPendingDataCompletion, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToPendingDataBytes, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToWaitingReasons, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToInitialBodyInputStreams, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToBodyStreams, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToSequenceNumbers, 0);
  objc_storeStrong((id *)&self->_tasksToIdentifiers, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (PDURLSessionProxyServerDelegate)delegate
{
  return (PDURLSessionProxyServerDelegate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setUuidString:(id)a3
{
}

- (NSString)uuidString
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v9];
  id v13 = [v12 unsignedIntegerValue];

  v14 = (id)qword_1000CB110;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v13];
    *(_DWORD *)buf = 138543618;
    v24 = v15;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ getAuthHeadersForResponse %@", buf, 0x16u);
  }
  v16 = objc_opt_new();
  id v17 = [[PDURLSessionProxyResponse alloc] _initWithActualResponse:v10];
  [v16 setResponse:v17];
  v18 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v13];
  [v16 setTask:v18];

  v19 = +[PDURLSessionProxyServerService sharedService];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100052170;
  v21[3] = &unk_1000B5D80;
  id v20 = v11;
  id v22 = v20;
  [v19 sendProtobufMessage:v16 ofType:1010 withReply:v21];
}

- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5
{
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
  id v9 = [v8 unsignedIntegerValue];

  id v10 = (id)qword_1000CB110;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v9];
    int v18 = 138543618;
    v19 = v11;
    __int16 v20 = 2048;
    int64_t v21 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ is waiting for connection with reason: %lld", (uint8_t *)&v18, 0x16u);
  }
  v12 = +[NSNumber numberWithLongLong:a5];
  taskIdentifiersToWaitingReasons = self->_taskIdentifiersToWaitingReasons;
  v14 = +[NSNumber numberWithUnsignedInteger:v9];
  [(NSMutableDictionary *)taskIdentifiersToWaitingReasons setObject:v12 forKeyedSubscript:v14];

  v15 = objc_opt_new();
  [v15 setReason:a5];
  v16 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v9];
  [v15 setTask:v16];

  id v17 = +[PDURLSessionProxyServerService sharedService];
  [v17 sendProtobufMessage:v15 ofType:1009 withReply:0];
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
  id v10 = [v9 unsignedIntegerValue];

  id v11 = (id)qword_1000CB110;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v10];
    int v17 = 138543618;
    int v18 = v12;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will be retried - error: %@", (uint8_t *)&v17, 0x16u);
  }
  id v13 = objc_opt_new();
  if (v8)
  {
    id v14 = [[PDURLSessionProxyError alloc] _initWithActualError:v8];
    [v13 setError:v14];
  }
  v15 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v10];
  [v13 setTask:v15];

  v16 = +[PDURLSessionProxyServerService sharedService];
  [v16 sendProtobufMessage:v13 ofType:1007 withReply:0];

  [(PDURLSessionProxyServer *)self releaseInfraWiFiForTaskIfNecessary:v10];
  [(PDURLSessionProxyServer *)self releaseBTLinkAssertionIfNecessary:v10];
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4
{
  id v5 = a4;
  v6 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v5];
  id v7 = [v6 unsignedIntegerValue];

  id v8 = (id)qword_1000CB110;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v7];
    int v13 = 138543362;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will be retried", (uint8_t *)&v13, 0xCu);
  }
  id v10 = objc_opt_new();
  id v11 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v7];
  [v10 setTask:v11];

  v12 = +[PDURLSessionProxyServerService sharedService];
  [v12 sendProtobufMessage:v10 ofType:1007 withReply:0];

  [(PDURLSessionProxyServer *)self releaseInfraWiFiForTaskIfNecessary:v7];
  [(PDURLSessionProxyServer *)self releaseBTLinkAssertionIfNecessary:v7];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  id v43 = a3;
  id v10 = a4;
  id v44 = a5;
  id v11 = (void (**)(void))a6;
  v12 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v10];
  id v13 = [v12 unsignedIntegerValue];

  id v14 = [v10 _nsurlsessionproxy_error];

  v15 = (id)qword_1000CB110;
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      int v17 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v13];
      *(_DWORD *)buf = 138543618;
      v52 = v17;
      __int16 v53 = 2048;
      id v54 = [v44 length];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring data of length %lu since we've already failed that task", buf, 0x16u);
    }
    v11[2](v11);
  }
  else
  {
    if (v16)
    {
      int v18 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v13];
      *(_DWORD *)buf = 138543618;
      v52 = v18;
      __int16 v53 = 2048;
      id v54 = [v44 length];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ did receive data with length %lu", buf, 0x16u);
    }
    v42 = objc_opt_new();
    [v42 setReceivedData:v44];
    __int16 v19 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v13];
    [v42 setTask:v19];

    id v20 = +[PDURLSessionProxyServerService sharedService];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100052EF0;
    v45[3] = &unk_1000B5D58;
    id v46 = v10;
    v47 = self;
    int64_t v21 = v11;
    id v49 = v21;
    id v50 = v13;
    id v22 = v44;
    id v48 = v22;
    [v20 sendProtobufMessage:v42 ofType:1006 withReply:v45];

    if ([(NSURLSessionConfiguration *)self->_sessionConfiguration _requiresSustainedDataDelivery])
    {
      taskIdentifiersToPendingDataBytes = self->_taskIdentifiersToPendingDataBytes;
      v24 = +[NSNumber numberWithUnsignedInteger:v13];
      __int16 v25 = [(NSMutableDictionary *)taskIdentifiersToPendingDataBytes objectForKeyedSubscript:v24];
      id v26 = (char *)[v25 unsignedIntegerValue];

      unint64_t v27 = (unint64_t)&v26[(void)[v22 length]];
      v28 = +[NSNumber numberWithUnsignedInteger:v27];
      v29 = self->_taskIdentifiersToPendingDataBytes;
      v30 = +[NSNumber numberWithUnsignedInteger:v13];
      [(NSMutableDictionary *)v29 setObject:v28 forKeyedSubscript:v30];

      v31 = (id)qword_1000CB110;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v13];
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        __int16 v53 = 2048;
        id v54 = (id)v27;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ data pending, now has %lu bytes pending acknowledgement", buf, 0x16u);
      }
      v33 = (id)qword_1000CB110;
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      if (v27 >> 19)
      {
        if (v34)
        {
          v36 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v13];
          *(_DWORD *)buf = 138543362;
          v52 = v36;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ will wait to acknowledge data", buf, 0xCu);
        }
        taskIdentifiersToPendingDataCompletion = self->_taskIdentifiersToPendingDataCompletion;
        v38 = +[NSNumber numberWithUnsignedInteger:v13];
        [(NSMutableDictionary *)taskIdentifiersToPendingDataCompletion objectForKeyedSubscript:v38];
        if (objc_claimAutoreleasedReturnValue()) {
          __assert_rtn("-[PDURLSessionProxyServer URLSession:dataTask:_didReceiveData:completionHandler:]", "PDURLSessionProxyServer.mm", 893, "!_taskIdentifiersToPendingDataCompletion[@(taskIdentifier)]");
        }

        v39 = objc_retainBlock(v21);
        v40 = self->_taskIdentifiersToPendingDataCompletion;
        v41 = +[NSNumber numberWithUnsignedInteger:v13];
        [(NSMutableDictionary *)v40 setObject:v39 forKeyedSubscript:v41];
      }
      else
      {
        if (v34)
        {
          v35 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v13];
          *(_DWORD *)buf = 138543362;
          v52 = v35;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ immediately acknowledging data", buf, 0xCu);
        }
        v21[2](v21);
      }
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v9];
  id v13 = [v12 unsignedIntegerValue];

  id v14 = (id)qword_1000CB110;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v13];
    *(_DWORD *)buf = 138543618;
    v30 = v15;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ didReceiveResponse: %@", buf, 0x16u);
  }
  BOOL v16 = objc_opt_new();
  id v17 = [[PDURLSessionProxyResponse alloc] _initWithActualResponse:v10];
  [v16 setResponse:v17];
  int v18 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v13];
  [v16 setTask:v18];

  if (self->_implementsDidReceiveResponse
    && ([v9 _taskGroup],
        __int16 v19 = objc_claimAutoreleasedReturnValue(),
        [v19 _groupConfiguration],
        id v20 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v21 = [v20 _ignoreDidReceiveResponseDisposition],
        v20,
        v19,
        (v21 & 1) == 0))
  {
    v23 = +[PDURLSessionProxyServerService sharedService];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100053614;
    v24[3] = &unk_1000B5D30;
    id v25 = v9;
    id v26 = self;
    id v28 = v13;
    id v27 = v11;
    [v23 sendProtobufMessage:v16 ofType:1003 withReply:v24];
  }
  else
  {
    id v22 = +[PDURLSessionProxyServerService sharedService];
    [v22 sendProtobufMessage:v16 ofType:1003 withReply:0];

    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v11];
  id v16 = [v15 unsignedIntegerValue];

  id v17 = (id)qword_1000CB110;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v16];
    *(_DWORD *)buf = 138543874;
    __int16 v31 = v18;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ willPerformHTTPRedirection, response: %@, new request: %@", buf, 0x20u);
  }
  if (self->_supportsRedirects && self->_implementsWillPerformRedirection)
  {
    __int16 v19 = objc_opt_new();
    id v20 = [[PDURLSessionProxyResponse alloc] _initWithActualResponse:v12];
    id v21 = [[PDURLSessionProxyRequest alloc] _initWithActualRequest:v13];
    [v19 setResponse:v20];
    [v19 setRequest:v21];
    id v22 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v16];
    [v19 setTask:v22];

    v23 = +[PDURLSessionProxyServerService sharedService];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100053B28;
    v24[3] = &unk_1000B5D58;
    id v25 = v11;
    id v28 = v14;
    id v26 = v13;
    id v27 = self;
    id v29 = v16;
    [v23 sendProtobufMessage:v19 ofType:1012 withReply:v24];
  }
  else
  {
    (*((void (**)(id, id))v14 + 2))(v14, v13);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];

  if (v9)
  {
    uint64_t v10 = [v7 _nsurlsessionproxy_error];
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (void *)v10;
    }
    else {
      id v12 = v8;
    }
    id v13 = v12;

    id v14 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
    id v15 = [v14 unsignedIntegerValue];

    id v16 = (id)qword_1000CB110;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v15];
      int v45 = 138543874;
      id v46 = v17;
      __int16 v47 = 2112;
      id v48 = v13;
      __int16 v49 = 2048;
      id v50 = [v13 code];
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ completed with error %@ [%ld]", (uint8_t *)&v45, 0x20u);
    }
    int v18 = objc_opt_new();
    if (v13)
    {
      id v19 = [[PDURLSessionProxyError alloc] _initWithActualError:v13];
      [v18 setError:v19];
    }
    id v20 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
    id v21 = [v7 _uniqueIdentifier];
    uint64_t v22 = [(PDURLSessionProxyServer *)self identifier];
    id v23 = [v20 initWithDataTask:v7 uniqueIdentifier:v21 bundleID:0 sessionID:v22];

    [v23 setCountOfBytesSent:[v7 countOfBytesSent]];
    [v23 setCountOfBytesReceived:[v7 countOfBytesReceived]];
    [v23 setCountOfBytesExpectedToSend:[v7 countOfBytesExpectedToSend]];
    [v23 setCountOfBytesExpectedToReceive:[v7 countOfBytesExpectedToReceive]];
    [v18 _setActualTaskInfo:v23];
    v24 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v15];
    [v18 setTask:v24];

    id v25 = +[PDURLSessionProxyServerService sharedService];
    [v25 sendProtobufMessage:v18 ofType:1005 withReply:0];

    id v26 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v7];
    id v27 = [(NSMutableDictionary *)self->_taskIdentifiersToBodyStreams objectForKeyedSubscript:v26];
    LOBYTE(v22) = v27 == 0;

    if ((v22 & 1) == 0)
    {
      id v28 = [(NSMutableDictionary *)self->_taskIdentifiersToBodyStreams objectForKeyedSubscript:v26];
      [v28 close];
      [(NSMutableDictionary *)self->_taskIdentifiersToBodyStreams removeObjectForKey:v26];
      id v29 = [(NSMutableDictionary *)self->_taskIdentifiersToInitialBodyInputStreams objectForKeyedSubscript:v26];
      [(NSMutableDictionary *)self->_taskIdentifiersToInitialBodyInputStreams removeObjectForKey:v26];
      if (![v29 streamStatus]) {
        [v29 open];
      }
      if ((unint64_t)[v29 streamStatus] <= 5) {
        [v29 close];
      }
    }
    if (v26)
    {
      [(NSMutableDictionary *)self->_tasks removeObjectForKey:v26];
      [(NSMutableDictionary *)self->_tasksToIdentifiers removeObjectForKey:v7];
      [(NSMutableDictionary *)self->_taskIdentifiersToSequenceNumbers removeObjectForKey:v26];
    }
    [(PDURLSessionProxyServer *)self releaseInfraWiFiForTaskIfNecessary:v15];
    [(PDURLSessionProxyServer *)self releaseBTLinkAssertionIfNecessary:v15];
  }
  else
  {
    v30 = [(NSMutableDictionary *)self->_streamTasksToDeviceConnections objectForKeyedSubscript:v7];

    int v18 = (id)qword_1000CB110;
    BOOL v31 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (v31)
      {
        __int16 v32 = [v7 _loggableDescription];
        int v45 = 138544130;
        id v46 = v32;
        __int16 v47 = 2112;
        id v48 = v7;
        __int16 v49 = 2112;
        id v50 = v8;
        __int16 v51 = 2048;
        id v52 = [v8 code];
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamTask %@ completed with error %@ [%ld]", (uint8_t *)&v45, 0x2Au);
      }
      id v33 = [(NSMutableDictionary *)self->_streamTasksToOpenSocketReplies objectForKeyedSubscript:v7];
      BOOL v34 = v33 == 0;

      if (!v34)
      {
        id v35 = [(NSMutableDictionary *)self->_streamTasksToOpenSocketReplies objectForKeyedSubscript:v7];
        v36 = objc_opt_new();
        v37 = [v8 userInfo];
        v38 = [v37 objectForKeyedSubscript:_kCFStreamErrorCodeKey];
        [v36 setStreamErrorCode:[v38 intValue]];

        v39 = [v8 userInfo];
        v40 = [v39 objectForKeyedSubscript:_kCFStreamErrorDomainKey];
        [v36 setStreamErrorDomain:[v40 intValue]];

        ((void (**)(void, void *))v35)[2](v35, v36);
        [(NSMutableDictionary *)self->_streamTasksToOpenSocketReplies removeObjectForKey:v7];
      }
      int v18 = [(NSMutableDictionary *)self->_streamTasksToIDSTCPConnections objectForKeyedSubscript:v7];
      if (v18)
      {
        tcp_connection_cancel();
        [(NSMutableDictionary *)self->_streamTasksToIDSTCPConnections removeObjectForKey:v7];
      }
      v41 = [(NSMutableDictionary *)self->_streamTasksToDeviceConnections objectForKeyedSubscript:v7];
      [v41 close];

      [(NSMutableDictionary *)self->_streamTasksToDeviceConnections removeObjectForKey:v7];
    }
    else if (v31)
    {
      v42 = [v7 _loggableDescription];
      id v43 = [v8 code];
      identifier = self->_identifier;
      int v45 = 138544386;
      id v46 = v42;
      __int16 v47 = 2112;
      id v48 = v7;
      __int16 v49 = 2112;
      id v50 = v8;
      __int16 v51 = 2048;
      id v52 = v43;
      __int16 v53 = 2112;
      id v54 = identifier;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring task completion for task %@ with error %@ [%ld] in session %@ since we do not have an associated client taskIdentifier", (uint8_t *)&v45, 0x34u);
    }
    id v13 = v8;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v14 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:a4];
  id v11 = [v14 unsignedIntegerValue];

  id v15 = (id)objc_opt_new();
  [v15 setBytesSent:a5];
  [v15 setTotalBytesSent:a6];
  [v15 setTotalBytesExpectedToSend:a7];
  id v12 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v11];
  [v15 setTask:v12];

  id v13 = +[PDURLSessionProxyServerService sharedService];
  [v13 sendProtobufMessage:v15 ofType:1004 withReply:0];
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  id v8 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:a4];
  id v9 = [v8 unsignedIntegerValue];

  id v28 = 0;
  id v29 = 0;
  +[NSStream getBoundStreamsWithBufferSize:0x20000 inputStream:&v29 outputStream:&v28];
  id v10 = v29;
  id v11 = v28;
  taskIdentifiersToBodyStreams = self->_taskIdentifiersToBodyStreams;
  id v13 = +[NSNumber numberWithUnsignedInteger:v9];
  id v14 = [(NSMutableDictionary *)taskIdentifiersToBodyStreams objectForKeyedSubscript:v13];

  if (v14)
  {
    id v15 = self->_taskIdentifiersToBodyStreams;
    id v16 = +[NSNumber numberWithUnsignedInteger:v9];
    id v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];
    [v17 close];

    taskIdentifiersToInitialBodyInputStreams = self->_taskIdentifiersToInitialBodyInputStreams;
    id v19 = +[NSNumber numberWithUnsignedInteger:v9];
    id v20 = [(NSMutableDictionary *)taskIdentifiersToInitialBodyInputStreams objectForKeyedSubscript:v19];
    [v20 close];
  }
  id v21 = self->_taskIdentifiersToBodyStreams;
  uint64_t v22 = +[NSNumber numberWithUnsignedInteger:v9];
  [(NSMutableDictionary *)v21 setObject:v11 forKeyedSubscript:v22];

  id v23 = self->_taskIdentifiersToInitialBodyInputStreams;
  v24 = +[NSNumber numberWithUnsignedInteger:v9];
  [(NSMutableDictionary *)v23 setObject:v10 forKeyedSubscript:v24];

  [v11 open];
  v7[2](v7, v10);
  id v25 = objc_opt_new();
  id v26 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v9];
  [v25 setTask:v26];

  id v27 = +[PDURLSessionProxyServerService sharedService];
  [v27 sendProtobufMessage:v25 ofType:1011 withReply:0];
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v9];
  id v13 = [v12 unsignedIntegerValue];

  id v14 = (id)qword_1000CB110;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v13];
    *(_DWORD *)buf = 138543362;
    id v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ _willSendRequestForEstablishedConnection", buf, 0xCu);
  }
  if (self->_implementsWillSendRequest)
  {
    id v16 = (id)objc_opt_new();
    id v17 = [[PDURLSessionProxyRequest alloc] _initWithActualRequest:v10];
    [v16 setRequest:v17];
    int v18 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v13];
    [v16 setTask:v18];

    id v19 = +[PDURLSessionProxyServerService sharedService];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100054C64;
    v27[3] = &unk_1000B5D30;
    id v28 = v9;
    id v29 = self;
    id v31 = v13;
    id v30 = v11;
    [v19 sendProtobufMessage:v16 ofType:1002 withReply:v27];
  }
  else
  {
    id v16 = v10;
    taskIdentifiersToInitialBodyInputStreams = self->_taskIdentifiersToInitialBodyInputStreams;
    id v21 = +[NSNumber numberWithUnsignedInteger:v13];
    uint64_t v22 = [(NSMutableDictionary *)taskIdentifiersToInitialBodyInputStreams objectForKeyedSubscript:v21];
    LOBYTE(taskIdentifiersToInitialBodyInputStreams) = v22 == 0;

    if ((taskIdentifiersToInitialBodyInputStreams & 1) == 0)
    {
      id v23 = [v16 mutableCopy];
      v24 = self->_taskIdentifiersToInitialBodyInputStreams;
      id v25 = +[NSNumber numberWithUnsignedInteger:v13];
      id v26 = [(NSMutableDictionary *)v24 objectForKeyedSubscript:v25];
      [v23 setHTTPBodyStream:v26];

      id v16 = v23;
    }
    if (v16)
    {
      if ([(PDURLSessionProxyServer *)self shouldRetainInfraWiFi]) {
        [(PDURLSessionProxyServer *)self retainInfraWiFiForTaskWithIdentifier:v13];
      }
      if ([(PDURLSessionProxyServer *)self shouldRetainBTLinkAssertion]) {
        [(PDURLSessionProxyServer *)self retainBTLinkAssertionWithIdentifier:v13];
      }
    }
    (*((void (**)(id, id))v11 + 2))(v11, v16);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(NSMutableDictionary *)self->_tasksToIdentifiers objectForKeyedSubscript:v9];
  id v13 = [v12 unsignedIntegerValue];

  id v14 = (id)qword_1000CB110;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v13];
    id v16 = [v10 protectionSpace];
    *(_DWORD *)buf = 138543874;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    id v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ didReceiveChallenge: %@, protection space: %@", buf, 0x20u);
  }
  if (self->_implementsSessionAuthChallenge || self->_implementsTaskAuthChallenge)
  {
    id v17 = objc_opt_new();
    id v18 = [[PDURLSessionProxyAuthChallenge alloc] _initWithActualAuthChallenge:v10];
    [v17 setChallenge:v18];
    id v19 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:v13];
    [v17 setTask:v19];

    id v20 = +[PDURLSessionProxyServerService sharedService];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100055260;
    v21[3] = &unk_1000B5D08;
    id v23 = v11;
    id v22 = v9;
    [v20 sendProtobufMessage:v17 ofType:1001 withReply:v21];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
  }
}

- (void)_URLSession:(id)a3 connectionEstablishedForStreamTask:(id)a4
{
  id v8 = a4;
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_streamTasksToOpenSocketReplies, "objectForKeyedSubscript:");

  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_streamTasksToOpenSocketReplies objectForKeyedSubscript:v8];
    id v7 = objc_opt_new();
    ((void (**)(void, void *))v6)[2](v6, v7);
    [(NSMutableDictionary *)self->_streamTasksToOpenSocketReplies removeObjectForKey:v8];
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1000CB110;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 configuration];
    id v10 = [v9 identifier];
    *(_DWORD *)buf = 138412802;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2048;
    id v29 = [v7 code];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Session %@ became invalid with error %@ [%ld]", buf, 0x20u);
  }
  if (!self->_skipInvalidateMessage)
  {
    id v11 = objc_opt_new();
    id v12 = [[PDURLSessionProxyError alloc] _initWithActualError:v7];
    [v11 setError:v12];

    id v13 = [(PDURLSessionProxyServer *)self baseMessage];
    [v11 setSession:v13];

    id v14 = +[PDURLSessionProxyServerService sharedService];
    [v14 sendProtobufMessage:v11 ofType:1008 withReply:0];
  }
  [(PDURLSessionProxyServerDelegate *)self->_delegate proxyServerBecameInvalid:self];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v15 = self->_deviceConnections;
  id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) close:v19];
      }
      id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }

  [(NSMutableSet *)self->_deviceConnections removeAllObjects];
}

- (void)performForwardingFromStreamTask:(id)a3 toTCPConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 _taskGroup];
  id v9 = [v8 _groupConfiguration];
  [v9 timeoutIntervalForRequest];
  double v11 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100055908;
  v14[3] = &unk_1000B5CE0;
  v14[4] = self;
  id v12 = v7;
  id v15 = v12;
  id v13 = v6;
  id v16 = v13;
  [v13 readDataOfMinLength:1 maxLength:0x40000 timeout:v14 completionHandler:v11];
}

- (void)performForwardingFromTCPConnection:(id)a3 toStreamTask:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  tcp_connection_read();
}

- (void)handleOpenSocketMessage:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  id v7 = [v6 socketUUID];
  id v8 = (id)qword_1000CB110;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 host];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v24) = [v6 port];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Open IDS Socket with UUID %@ to host %@ port %d", buf, 0x1Cu);
  }
  v27[0] = IDSOpenSocketOptionPriorityKey;
  v27[1] = IDSOpenSocketOptionStreamNameKey;
  v28[0] = &off_1000B8A28;
  v28[1] = v7;
  v27[2] = IDSOpenSocketOptionTransportKey;
  v28[2] = &off_1000B8A40;
  double v10 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v24 = sub_1000563FC;
  id v25 = sub_10005640C;
  id v26 = 0;
  id v11 = objc_alloc((Class)IDSDeviceConnection);
  id v12 = +[PDURLSessionProxyServerService sharedService];
  id v13 = [v12 defaultPairedDevice];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100056414;
  v19[3] = &unk_1000B5C18;
  v19[4] = self;
  id v14 = v6;
  id v20 = v14;
  long long v22 = buf;
  id v15 = v18;
  id v21 = v15;
  id v16 = [v11 initSocketWithDevice:v13 options:v10 completionHandler:v19 queue:self->_queue];
  uint64_t v17 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v16;

  [(NSMutableSet *)self->_deviceConnections addObject:*(void *)(*(void *)&buf[8] + 40)];
  _Block_object_dispose(buf, 8);
}

- (void)handleUploadBodyDataMessage:(id)a3 forTaskIdentifier:(unint64_t)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = objc_opt_new();
  taskIdentifiersToBodyStreams = self->_taskIdentifiersToBodyStreams;
  id v12 = +[NSNumber numberWithUnsignedInteger:a4];
  id v13 = [(NSMutableDictionary *)taskIdentifiersToBodyStreams objectForKeyedSubscript:v12];

  if (v13)
  {
    tasks = self->_tasks;
    id v15 = +[NSNumber numberWithUnsignedInteger:a4];
    id v16 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v15];

    uint64_t v17 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000568EC;
    block[3] = &unk_1000B5BC8;
    id v20 = v8;
    id v21 = v13;
    long long v22 = self;
    unint64_t v26 = a4;
    id v23 = v16;
    id v25 = v9;
    id v24 = v10;
    id v18 = v16;
    dispatch_async(v17, block);
  }
}

- (void)handleInvalidateMessage:(id)a3
{
  id v4 = a3;
  self->_isInvalid = 1;
  id v7 = v4;
  unsigned int v5 = [v4 shouldCancel];
  session = self->_session;
  if (v5) {
    [(NSURLSession *)session invalidateAndCancel];
  }
  else {
    [(NSURLSession *)session finishTasksAndInvalidate];
  }
}

- (void)handleSetPriorityMessage:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 priority];
  id v8 = (id)qword_1000CB110;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
    int v13 = 138543618;
    id v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving set priority message, priority = %lld", (uint8_t *)&v13, 0x16u);
  }
  tasks = self->_tasks;
  id v11 = +[NSNumber numberWithUnsignedInteger:a4];
  id v12 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v11];

  [v12 set_priority:v7];
}

- (void)handleSetDescriptionMessage:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 taskDescription];
  id v8 = (id)qword_1000CB110;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
    int v13 = 138543618;
    id v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving set description message, description = %@", (uint8_t *)&v13, 0x16u);
  }
  tasks = self->_tasks;
  id v11 = +[NSNumber numberWithUnsignedInteger:a4];
  id v12 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v11];

  [v12 setTaskDescription:v7];
}

- (void)handleResumeTaskMessage:(id)a3 forTaskIdentifier:(unint64_t)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  double v10 = [v8 _actualAdditionalProperties];
  id v11 = (id)qword_1000CB110;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
    int v20 = 138543618;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving resume task message, props %@", (uint8_t *)&v20, 0x16u);
  }
  tasks = self->_tasks;
  uint64_t v14 = +[NSNumber numberWithUnsignedInteger:a4];
  __int16 v15 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v14];

  uint64_t v16 = [v10 objectForKeyedSubscript:@"effectiveConfig"];
  LOBYTE(v14) = v16 == 0;

  if ((v14 & 1) == 0)
  {
    uint64_t v17 = (id)qword_1000CB110;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      long long v19 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
      int v20 = 138543362;
      id v21 = v19;
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%{public}@ dropping effective configuration", (uint8_t *)&v20, 0xCu);
    }
    id v18 = [v10 mutableCopy];
    [v18 setObject:0 forKeyedSubscript:@"effectiveConfig"];

    double v10 = v18;
  }
  sub_100066720(v15, v10);
  [v15 resume];
  v9[2](v9, v8);
}

- (void)handleSuspendTaskMessage:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (id)qword_1000CB110;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
    int v12 = 138543362;
    int v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving suspend task message", (uint8_t *)&v12, 0xCu);
  }
  tasks = self->_tasks;
  double v10 = +[NSNumber numberWithUnsignedInteger:a4];
  id v11 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v10];

  [v11 suspend];
}

- (void)handleCancelTaskMessage:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (id)qword_1000CB110;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
    int v12 = 138543362;
    int v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving cancel task message", (uint8_t *)&v12, 0xCu);
  }
  tasks = self->_tasks;
  double v10 = +[NSNumber numberWithUnsignedInteger:a4];
  id v11 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v10];

  [v11 cancel];
}

- (void)handleDataTaskWithRequestMessage:(id)a3 forTaskIdentifier:(unint64_t)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  double v10 = [v8 currentRequest];
  id v11 = [v10 _actualRequest];

  int v12 = qword_1000CB110;
  if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 134218498;
    unint64_t v63 = a4;
    __int16 v64 = 2112;
    v65 = identifier;
    __int16 v66 = 2112;
    v67 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "dataTaskWithRequest message forTaskIdentifier %lu in session %@, currentRequest = %@", buf, 0x20u);
  }
  uint64_t v14 = objc_opt_new();
  tasks = self->_tasks;
  v61 = (void *)v14;
  uint64_t v16 = +[NSNumber numberWithUnsignedInteger:a4];
  uint64_t v17 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v16];
  LOBYTE(tasks) = v17 == 0;

  if ((tasks & 1) == 0)
  {
    id v18 = self->_tasks;
    long long v19 = +[NSNumber numberWithUnsignedInteger:a4];
    int v20 = [(NSMutableDictionary *)v18 objectForKeyedSubscript:v19];

    id v21 = (NSString *)[v8 taskSequenceNumber];
    taskIdentifiersToSequenceNumbers = self->_taskIdentifiersToSequenceNumbers;
    id v23 = +[NSNumber numberWithUnsignedInteger:a4];
    id v24 = [(NSMutableDictionary *)taskIdentifiersToSequenceNumbers objectForKeyedSubscript:v23];
    id v25 = (NSString *)[v24 unsignedIntegerValue];

    unint64_t v26 = (id)qword_1000CB110;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
      *(_DWORD *)buf = 138543874;
      unint64_t v63 = (unint64_t)v27;
      __int16 v64 = 2048;
      v65 = v21;
      __int16 v66 = 2048;
      v67 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ received task creation message and that task already exists. Sequence number: %llu, existing sequence number: %llu", buf, 0x20u);
    }
    __int16 v28 = (id)qword_1000CB110;
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v21 <= v25)
    {
      if (v29)
      {
        v41 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
        *(_DWORD *)buf = 138543362;
        unint64_t v63 = (unint64_t)v41;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ received duplicate task creation message. Dropping message", buf, 0xCu);
      }
      if (!self->_isInvalid) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    if (v29)
    {
      id v30 = [(PDURLSessionProxyServer *)self taskMessageForIdentifier:a4];
      *(_DWORD *)buf = 138543362;
      unint64_t v63 = (unint64_t)v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ canceling exisitng task since we received a new request for that task with a higher sequence number", buf, 0xCu);
    }
    id v31 = self->_tasks;
    __int16 v32 = +[NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v31 removeObjectForKey:v32];

    [(NSMutableDictionary *)self->_tasksToIdentifiers removeObjectForKey:v20];
    id v33 = self->_taskIdentifiersToSequenceNumbers;
    BOOL v34 = +[NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v33 removeObjectForKey:v34];

    [(PDURLSessionProxyServer *)self releaseInfraWiFiForTaskIfNecessary:a4];
    [(PDURLSessionProxyServer *)self releaseBTLinkAssertionIfNecessary:a4];
    [v20 cancel];
  }
  if (self->_isInvalid)
  {
LABEL_17:
    v42 = (id)qword_1000CB110;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
      *(_DWORD *)buf = 138543362;
      unint64_t v63 = (unint64_t)v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ received task creation message for invalidated session. Dropping message", buf, 0xCu);
    }
    goto LABEL_20;
  }
  id v35 = v61;
  if ([(NSString *)v11 _nsurlsessionproxy_isSafeRequest])
  {
    v36 = +[NSURLProtocol propertyForKey:@"_kCFNetworkProxySessionNeedsNewBodyStreamSignal" inRequest:v11];
    unsigned int v37 = [v36 BOOLValue];

    if (v37)
    {
      v38 = (NSString *)[(NSString *)v11 mutableCopy];
      v39 = +[NSData data];
      v40 = +[NSInputStream inputStreamWithData:v39];

      [v40 open];
      [v40 close];
      [(NSString *)v38 setHTTPBodyStream:v40];
    }
    else
    {
      v38 = v11;
    }
    int v45 = [(NSURLSession *)self->_session dataTaskWithRequest:v38];
    id v46 = self->_tasks;
    __int16 v47 = +[NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v46 setObject:v45 forKeyedSubscript:v47];

    id v48 = +[NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)self->_tasksToIdentifiers setObject:v48 forKeyedSubscript:v45];

    if ([v45 taskIdentifier] != (id)a4)
    {
      __int16 v49 = (id)qword_1000CB110;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        id v50 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
        __int16 v51 = (NSString *)[v45 taskIdentifier];
        *(_DWORD *)buf = 138543618;
        unint64_t v63 = (unint64_t)v50;
        __int16 v64 = 2048;
        v65 = v51;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ using local task identifier %lu", buf, 0x16u);
      }
    }
    if ([v8 taskSequenceNumber])
    {
      id v52 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 taskSequenceNumber]);
      __int16 v53 = self->_taskIdentifiersToSequenceNumbers;
      id v54 = +[NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)v53 setObject:v52 forKeyedSubscript:v54];
    }
    id v55 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
    v56 = [v45 _uniqueIdentifier];
    v57 = [(PDURLSessionProxyServer *)self identifier];
    id v58 = [v55 initWithDataTask:v45 uniqueIdentifier:v56 bundleID:0 sessionID:v57];

    v59 = (id)qword_1000CB110;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:a4];
      *(_DWORD *)buf = 138543362;
      unint64_t v63 = (unint64_t)v60;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ acknowledging dataTaskWithRequest message", buf, 0xCu);
    }
    [v61 _setActualTaskInfo:v58];

    id v11 = v38;
LABEL_20:
    id v35 = v61;
    goto LABEL_21;
  }
  id v44 = qword_1000CB110;
  if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v63 = (unint64_t)v11;
    _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Received proxy request %@ with non-http URL. Dropping request.", buf, 0xCu);
  }
LABEL_21:
  v9[2](v9, v35);
}

- (void)handleFailedMessageSend:(id)a3 ofType:(unsigned __int16)a4
{
  int v4 = a4;
  id v6 = a3;
  if (objc_msgSend(v6, "_nsurlsessionproxy_taskIdentifier"))
  {
    id v7 = [v6 _nsurlsessionproxy_taskIdentifier];
    if (v4 == 1009)
    {
      taskIdentifiersToWaitingReasons = self->_taskIdentifiersToWaitingReasons;
      __int16 v15 = +[NSNumber numberWithUnsignedInteger:v7];
      [(NSMutableDictionary *)taskIdentifiersToWaitingReasons removeObjectForKey:v15];
    }
    else if (v4 == 1005)
    {
      id v8 = (id)qword_1000CB110;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v23 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v7];
        *(_DWORD *)buf = 138543362;
        id v30 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@ didCompleteWithError message failed to send, so re-sending when devices are connected", buf, 0xCu);
      }
      v27[0] = @"message";
      v27[1] = @"type";
      v28[0] = v6;
      id v9 = +[NSNumber numberWithUnsignedShort:1005];
      v28[1] = v9;
      double v10 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

      [(NSMutableArray *)self->_messagesToReSend addObject:v10];
      dispatch_time_t v11 = dispatch_time(0, 10000000000);
      queue = self->_queue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000581C4;
      v25[3] = &unk_1000B63D0;
      v25[4] = self;
      id v26 = v10;
      id v13 = v10;
      dispatch_after(v11, queue, v25);
    }
    else
    {
      tasks = self->_tasks;
      uint64_t v17 = +[NSNumber numberWithUnsignedInteger:v7];
      id v18 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v17];

      if (v18)
      {
        long long v19 = (id)qword_1000CB110;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v24 = [(PDURLSessionProxyServer *)self descriptionForTaskWithIdentifier:v7];
          *(_DWORD *)buf = 138543362;
          id v30 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@ message failed to send, so canceling task", buf, 0xCu);
        }
        int v20 = [v18 currentRequest];
        id v21 = [v20 URL];
        __int16 v22 = +[NSError _web_errorWithDomain:NSURLErrorDomain code:-997 URL:v21];

        [v18 _nsurlsessionproxy_cancelWithError:v22];
      }
    }
  }
}

- (void)handleMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = [v8 _nsurlsessionproxy_sessionUUID];
  id v11 = [v8 _nsurlsessionproxy_taskIdentifier];
  if (v10 && ([v10 isEqualToString:self->_uuidString] & 1) == 0)
  {
    int v12 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      int v14 = 138412290;
      __int16 v15 = identifier;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyClient Session %@ received message with non-matching session UUID; dropping message",
        (uint8_t *)&v14,
        0xCu);
    }
  }
  else
  {
    switch(v6)
    {
      case 2:
        [(PDURLSessionProxyServer *)self handleDataTaskWithRequestMessage:v8 forTaskIdentifier:v11 withReply:v9];
        break;
      case 3:
        [(PDURLSessionProxyServer *)self handleCancelTaskMessage:v8 forTaskIdentifier:v11];
        break;
      case 4:
        [(PDURLSessionProxyServer *)self handleSuspendTaskMessage:v8 forTaskIdentifier:v11];
        break;
      case 5:
        [(PDURLSessionProxyServer *)self handleResumeTaskMessage:v8 forTaskIdentifier:v11 withReply:v9];
        break;
      case 6:
        [(PDURLSessionProxyServer *)self handleSetDescriptionMessage:v8 forTaskIdentifier:v11];
        break;
      case 7:
        [(PDURLSessionProxyServer *)self handleSetPriorityMessage:v8 forTaskIdentifier:v11];
        break;
      case 8:
        [(PDURLSessionProxyServer *)self handleInvalidateMessage:v8];
        break;
      default:
        if (v6 == 2001)
        {
          [(PDURLSessionProxyServer *)self handleUploadBodyDataMessage:v8 forTaskIdentifier:v11 withReply:v9];
        }
        else if (v6 == 3001)
        {
          [(PDURLSessionProxyServer *)self handleOpenSocketMessage:v8 withReply:v9];
        }
        break;
    }
  }
}

- (id)descriptionForTaskWithIdentifier:(unint64_t)a3
{
  tasks = self->_tasks;
  unsigned int v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  int v6 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v5];

  if (v6) {
    [v6 _loggableDescription];
  }
  else {
  id v7 = +[NSString stringWithFormat:@"Task <?>.<%lu>", a3];
  }

  return v7;
}

- (id)taskMessageForIdentifier:(unint64_t)a3
{
  unsigned int v5 = objc_opt_new();
  int v6 = [(PDURLSessionProxyServer *)self baseMessage];
  [v5 setSession:v6];

  [v5 setTaskIdentifier:a3];

  return v5;
}

- (id)baseMessage
{
  v3 = objc_opt_new();
  [v3 setSessionIdentifier:self->_identifier];
  [v3 setUuidString:self->_uuidString];

  return v3;
}

- (void)resendPendingMessage:(id)a3
{
  id v7 = a3;
  v3 = [v7 objectForKeyedSubscript:@"message"];
  int v4 = [v7 objectForKeyedSubscript:@"type"];
  unsigned __int16 v5 = (unsigned __int16)[v4 unsignedIntegerValue];

  int v6 = +[PDURLSessionProxyServerService sharedService];
  [v6 sendProtobufMessage:v3 ofType:v5 withReply:0];
}

- (void)devicesConnected
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_messagesToReSend;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      int v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[PDURLSessionProxyServer resendPendingMessage:](self, "resendPendingMessage:", *(void *)(*((void *)&v7 + 1) + 8 * (void)v6), (void)v7);
        int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  [(NSMutableArray *)self->_messagesToReSend removeAllObjects];
}

- (void)obliterate
{
  self->_skipInvalidateMessage = 1;
  self->_isInvalid = 1;
  [(NSURLSession *)self->_session invalidateAndCancel];
}

- (void)releaseBTLinkAssertionIfNecessary:(unint64_t)a3
{
  taskIdentifiersRetainingBTLinkAssertion = self->_taskIdentifiersRetainingBTLinkAssertion;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(taskIdentifiersRetainingBTLinkAssertion) = -[NSMutableSet containsObject:](taskIdentifiersRetainingBTLinkAssertion, "containsObject:");

  if (taskIdentifiersRetainingBTLinkAssertion)
  {
    int v6 = self->_taskIdentifiersRetainingBTLinkAssertion;
    id v8 = +[NSNumber numberWithUnsignedInteger:a3];
    -[NSMutableSet removeObject:](v6, "removeObject:");

    id v9 = +[PDURLSessionProxyServerService sharedService];
    [v9 releaseBTLinkAssertion];
  }
}

- (void)retainBTLinkAssertionWithIdentifier:(unint64_t)a3
{
  taskIdentifiersRetainingBTLinkAssertion = self->_taskIdentifiersRetainingBTLinkAssertion;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(taskIdentifiersRetainingBTLinkAssertion) = -[NSMutableSet containsObject:](taskIdentifiersRetainingBTLinkAssertion, "containsObject:");

  if ((taskIdentifiersRetainingBTLinkAssertion & 1) == 0)
  {
    int v6 = self->_taskIdentifiersRetainingBTLinkAssertion;
    id v8 = +[NSNumber numberWithUnsignedInteger:a3];
    -[NSMutableSet addObject:](v6, "addObject:");

    id v9 = +[PDURLSessionProxyServerService sharedService];
    [v9 retainBTLinkAssertion];
  }
}

- (BOOL)shouldRetainBTLinkAssertion
{
  if (qword_1000CB088 != -1) {
    dispatch_once(&qword_1000CB088, &stru_1000B57E0);
  }
  if (!byte_1000CB080) {
    return 0;
  }
  sessionConfiguration = self->_sessionConfiguration;

  return [(NSURLSessionConfiguration *)sessionConfiguration _requiresSustainedDataDelivery];
}

- (void)releaseInfraWiFiForTaskIfNecessary:(unint64_t)a3
{
  taskIdentifiersRetainingInfraWiFi = self->_taskIdentifiersRetainingInfraWiFi;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(taskIdentifiersRetainingInfraWiFi) = -[NSMutableSet containsObject:](taskIdentifiersRetainingInfraWiFi, "containsObject:");

  if (taskIdentifiersRetainingInfraWiFi)
  {
    int v6 = self->_taskIdentifiersRetainingInfraWiFi;
    id v8 = +[NSNumber numberWithUnsignedInteger:a3];
    -[NSMutableSet removeObject:](v6, "removeObject:");

    id v9 = +[PDURLSessionProxyServerService sharedService];
    [v9 releaseInfraWiFi];
  }
}

- (void)retainInfraWiFiForTaskWithIdentifier:(unint64_t)a3
{
  taskIdentifiersRetainingInfraWiFi = self->_taskIdentifiersRetainingInfraWiFi;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(taskIdentifiersRetainingInfraWiFi) = -[NSMutableSet containsObject:](taskIdentifiersRetainingInfraWiFi, "containsObject:");

  if ((taskIdentifiersRetainingInfraWiFi & 1) == 0)
  {
    int v6 = self->_taskIdentifiersRetainingInfraWiFi;
    id v8 = +[NSNumber numberWithUnsignedInteger:a3];
    -[NSMutableSet addObject:](v6, "addObject:");

    id v9 = +[PDURLSessionProxyServerService sharedService];
    [v9 retainInfraWiFi];
  }
}

- (BOOL)shouldRetainInfraWiFi
{
  unsigned int v3 = [(NSURLSessionConfiguration *)self->_sessionConfiguration _prefersInfraWiFi];
  if (v3) {
    LOBYTE(v3) = ![(NSURLSessionConfiguration *)self->_sessionConfiguration isDiscretionary];
  }
  return v3;
}

- (id)messageLoggableDescriptionForTaskWithIdentifier:(unint64_t)a3
{
  if (a3) {
    -[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:");
  }
  else {
  unsigned int v3 = +[NSString stringWithFormat:@"Session <%@>", self->_uuidString];
  }

  return v3;
}

- (int64_t)IDSMessageTimeout
{
  return (int64_t)[(NSURLSessionConfiguration *)self->_sessionConfiguration _IDSMessageTimeout];
}

- (id)sourceApplicationBundleIdentifier
{
  return [(NSURLSessionConfiguration *)self->_sessionConfiguration _sourceApplicationBundleIdentifier];
}

- (int64_t)messagePriorityForTaskWithIdentifier:(unint64_t)a3 isReply:(BOOL)a4
{
  unsigned int v7 = [(NSURLSessionConfiguration *)self->_sessionConfiguration _requiresSustainedDataDelivery];
  if (v7) {
    int64_t v8 = 300;
  }
  else {
    int64_t v8 = 200;
  }
  if ((v7 & 1) == 0 && !a4)
  {
    tasks = self->_tasks;
    long long v10 = +[NSNumber numberWithUnsignedInteger:a3];
    id v11 = [(NSMutableDictionary *)tasks objectForKeyedSubscript:v10];

    sessionConfiguration = self->_sessionConfiguration;
    if (v11)
    {
      if ([(NSURLSessionConfiguration *)sessionConfiguration isDiscretionary])
      {
        int64_t v8 = 100;
      }
      else if ((uint64_t)[v11 _priority] <= 399)
      {
        int64_t v8 = 200;
      }
      else
      {
        int64_t v8 = 100;
      }
    }
    else if ([(NSURLSessionConfiguration *)sessionConfiguration isDiscretionary])
    {
      int64_t v8 = 100;
    }
    else
    {
      int64_t v8 = 200;
    }
  }
  return v8;
}

- (id)getTaskInformation
{
  unsigned int v3 = [(PDURLSessionProxyServer *)self identifier];
  id v4 = +[NSMutableDictionary dictionary];
  tasks = self->_tasks;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100058F58;
  v11[3] = &unk_1000B5BA0;
  id v6 = v3;
  id v12 = v6;
  id v7 = v4;
  id v13 = v7;
  [(NSMutableDictionary *)tasks enumerateKeysAndObjectsUsingBlock:v11];
  int64_t v8 = v13;
  id v9 = v7;

  return v9;
}

- (PDURLSessionProxyServer)initWithConfiguration:(id)a3 uuidString:(id)a4 options:(unint64_t)a5 delegate:(id)a6
{
  unsigned int v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v65.receiver = self;
  v65.super_class = (Class)PDURLSessionProxyServer;
  int v14 = [(PDURLSessionProxyServer *)&v65 init];
  __int16 v15 = v14;
  if (v14)
  {
    p_sessionConfiguration = (id *)&v14->_sessionConfiguration;
    objc_storeStrong((id *)&v14->_sessionConfiguration, a3);
    objc_storeStrong((id *)&v15->_uuidString, a4);
    objc_storeStrong((id *)&v15->_delegate, a6);
    uint64_t v17 = [*p_sessionConfiguration identifier];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v17;

    v15->_supportsRedirects = v7 & 1;
    v19.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(v7) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)&v15->_implementsWillSendRequest = vmovn_s16(v19).u32[0];
    v15->_implementsDidReceiveResponse = (v7 & 0x20) != 0;
    int v20 = [(NSString *)v15->_identifier stringByAppendingFormat:@" uuid:%@", v15->_uuidString];
    [v11 setIdentifier:v20];
    if (objc_msgSend(v11, "_nsurlsessionproxy_requiresBackgroundSession"))
    {
      [*p_sessionConfiguration setDisposition:@"BackgroundDisposition"];
      [*p_sessionConfiguration set_connectionPoolName:@"com.apple.nsurlsessiond.NSURLSessionProxyPool"];
    }
    id v21 = [v11 _companionAppBundleIdentifier];
    BOOL v22 = v21 == 0;

    if (!v22)
    {
      id v23 = [*p_sessionConfiguration _companionAppBundleIdentifier];
      [*p_sessionConfiguration set_sourceApplicationBundleIdentifier:v23];
    }
    [*p_sessionConfiguration setURLCache:0];
    [*p_sessionConfiguration setHTTPCookieStorage:0];
    [*p_sessionConfiguration set_onBehalfOfPairedDevice:1];
    id v24 = [*p_sessionConfiguration _sourceApplicationAuditTokenData];
    BOOL v25 = v24 == 0;

    if (!v25)
    {
      id v26 = (id)qword_1000CB110;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        unint64_t v63 = v15->_identifier;
        __int16 v64 = [(NSURLSessionConfiguration *)v15->_sessionConfiguration _sourceApplicationAuditTokenData];
        *(_DWORD *)buf = 138412546;
        v67 = v63;
        __int16 v68 = 2112;
        v69 = v64;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "PDURLSessionProxyServer Session %@ had _sourceApplicationAuditTokenData [%@]- discarding", buf, 0x16u);
      }
      [*p_sessionConfiguration set_sourceApplicationAuditTokenData:0];
    }
    id v27 = +[PDURLSessionProxyServerService sharedService];
    uint64_t v28 = [v27 queue];
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v28;

    uint64_t v30 = objc_opt_new();
    tasks = v15->_tasks;
    v15->_tasks = (NSMutableDictionary *)v30;

    uint64_t v32 = objc_opt_new();
    tasksToIdentifiers = v15->_tasksToIdentifiers;
    v15->_tasksToIdentifiers = (NSMutableDictionary *)v32;

    uint64_t v34 = objc_opt_new();
    taskIdentifiersRetainingInfraWiFi = v15->_taskIdentifiersRetainingInfraWiFi;
    v15->_taskIdentifiersRetainingInfraWiFi = (NSMutableSet *)v34;

    uint64_t v36 = objc_opt_new();
    taskIdentifiersRetainingBTLinkAssertion = v15->_taskIdentifiersRetainingBTLinkAssertion;
    v15->_taskIdentifiersRetainingBTLinkAssertion = (NSMutableSet *)v36;

    uint64_t v38 = objc_opt_new();
    taskIdentifiersToSequenceNumbers = v15->_taskIdentifiersToSequenceNumbers;
    v15->_taskIdentifiersToSequenceNumbers = (NSMutableDictionary *)v38;

    uint64_t v40 = objc_opt_new();
    taskIdentifiersToBodyStreams = v15->_taskIdentifiersToBodyStreams;
    v15->_taskIdentifiersToBodyStreams = (NSMutableDictionary *)v40;

    uint64_t v42 = objc_opt_new();
    taskIdentifiersToInitialBodyInputStreams = v15->_taskIdentifiersToInitialBodyInputStreams;
    v15->_taskIdentifiersToInitialBodyInputStreams = (NSMutableDictionary *)v42;

    uint64_t v44 = objc_opt_new();
    taskIdentifiersToWaitingReasons = v15->_taskIdentifiersToWaitingReasons;
    v15->_taskIdentifiersToWaitingReasons = (NSMutableDictionary *)v44;

    uint64_t v46 = objc_opt_new();
    taskIdentifiersToPendingDataBytes = v15->_taskIdentifiersToPendingDataBytes;
    v15->_taskIdentifiersToPendingDataBytes = (NSMutableDictionary *)v46;

    uint64_t v48 = objc_opt_new();
    taskIdentifiersToPendingDataCompletion = v15->_taskIdentifiersToPendingDataCompletion;
    v15->_taskIdentifiersToPendingDataCompletion = (NSMutableDictionary *)v48;

    uint64_t v50 = objc_opt_new();
    streamTasksToOpenSocketReplies = v15->_streamTasksToOpenSocketReplies;
    v15->_streamTasksToOpenSocketReplies = (NSMutableDictionary *)v50;

    uint64_t v52 = objc_opt_new();
    streamTasksToDeviceConnections = v15->_streamTasksToDeviceConnections;
    v15->_streamTasksToDeviceConnections = (NSMutableDictionary *)v52;

    uint64_t v54 = objc_opt_new();
    streamTasksToIDSTCPConnections = v15->_streamTasksToIDSTCPConnections;
    v15->_streamTasksToIDSTCPConnections = (NSMutableDictionary *)v54;

    uint64_t v56 = objc_opt_new();
    messagesToReSend = v15->_messagesToReSend;
    v15->_messagesToReSend = (NSMutableArray *)v56;

    uint64_t v58 = objc_opt_new();
    deviceConnections = v15->_deviceConnections;
    v15->_deviceConnections = (NSMutableSet *)v58;

    uint64_t v60 = +[NSURLSession _sessionWithConfiguration:v15->_sessionConfiguration delegate:v15 delegateDispatchQueue:v15->_queue];
    session = v15->_session;
    v15->_session = (NSURLSession *)v60;

    v15->_isInvalid = 0;
  }

  return v15;
}

+ (void)initialize
{
  if (qword_1000CB108 != -1) {
    dispatch_once(&qword_1000CB108, &stru_1000B5B78);
  }
}

@end