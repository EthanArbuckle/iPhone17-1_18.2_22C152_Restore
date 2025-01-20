@interface PDURLSessionProxyService
- (BOOL)isConnected;
- (BOOL)verifyAndUpdateIncomingSequenceNumber:(unint64_t)a3 forPriority:(int64_t)a4;
- (NSString)launchUUID;
- (OS_dispatch_queue)queue;
- (PDURLSessionProxyService)init;
- (id)_onqueue_loggableDescriptionForMessage:(id)a3;
- (id)_onqueue_sourceApplicationForMessage:(id)a3;
- (id)defaultPairedDevice;
- (int64_t)_onqueue_IDSTimoutForMessage:(id)a3;
- (int64_t)_onqueue_priorityForMessage:(id)a3 ofType:(unsigned __int16)a4 isReply:(BOOL)a5;
- (unint64_t)bumpAndReturnOutgoingSequenceNumberForPriority:(int64_t)a3;
- (void)_onqueue_handleFailedMessageSend:(id)a3 ofType:(unsigned __int16)a4;
- (void)_onqueue_handleReceivedMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5;
- (void)_onqueue_handleReceivedReply:(id)a3 forIdentifier:(id)a4 ofType:(unsigned __int16)a5 withError:(id)a6;
- (void)_onqueue_messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5;
- (void)_onqueue_remoteDeviceStartedUp;
- (void)_onqueue_sendMessage:(id)a3 ofType:(unsigned __int16)a4 responseIdentifier:(id)a5 forSourceApplication:(id)a6 withUrgency:(BOOL)a7 withIDSMessageTimeout:(int64_t)a8 withReply:(id)a9;
- (void)_onqueue_sendStartupMessage;
- (void)_onqueue_setPrefersInfraWiFi:(BOOL)a3;
- (void)_onqueue_updateDeviceState;
- (void)devicesDidUnpair:(id)a3;
- (void)sendProtobufMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)setConnected:(BOOL)a3;
- (void)setLaunchUUID:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)withWorkQueue:(id)a3;
@end

@implementation PDURLSessionProxyService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRemoteLaunchUUID, 0);
  objc_storeStrong((id *)&self->_receivedLaunchUUIDs, 0);
  objc_storeStrong((id *)&self->_incomingSequenceNumbersByPriority, 0);
  objc_storeStrong((id *)&self->_outgoingSequenceNumbersByPriority, 0);
  objc_storeStrong((id *)&self->_startupMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_outstandingMessages, 0);
  objc_storeStrong((id *)&self->_outstandingReplies, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

- (void)setLaunchUUID:(id)a3
{
}

- (NSString)launchUUID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(void))a5;
  v11 = (id)qword_1000CB110;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    int v18 = 138412290;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: didSwitchActivePairedDevice", (uint8_t *)&v18, 0xCu);
  }
  currentRemoteLaunchUUID = self->_currentRemoteLaunchUUID;
  self->_currentRemoteLaunchUUID = 0;

  [(NSMutableSet *)self->_receivedLaunchUUIDs removeAllObjects];
  [(PDURLSessionProxyService *)self _onqueue_remoteDeviceStartedUp];
  v10[2](v10);
  v15 = +[NSUUID UUID];
  v16 = [v15 UUIDString];
  launchUUID = self->_launchUUID;
  self->_launchUUID = v16;

  self->_haveReceivedMessage = 0;
  [(PDURLSessionProxyService *)self _onqueue_sendStartupMessage];
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1000CB110;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    int v11 = 138412546;
    v12 = v10;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: activeAccountsChanged: %@", (uint8_t *)&v11, 0x16u);
  }
  if ([v7 count] && self->_startupMessageFailed) {
    [(PDURLSessionProxyService *)self _onqueue_sendStartupMessage];
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v17 = (id)qword_1000CB110;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = NSStringFromSelector(a2);
    id v21 = [v16 code];
    int v24 = 138413570;
    if (v8) {
      int v22 = 89;
    }
    else {
      int v22 = 78;
    }
    id v25 = v19;
    __int16 v26 = 2112;
    v27 = v20;
    __int16 v28 = 1024;
    int v29 = v22;
    __int16 v30 = 2114;
    id v31 = v15;
    __int16 v32 = 2112;
    id v33 = v16;
    __int16 v34 = 2048;
    id v35 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@::%@ success = %c, identifier = %{public}@, error = %@ [%ld]", (uint8_t *)&v24, 0x3Au);
  }
  if ([v15 isEqualToString:self->_startupMessageIdentifier])
  {
    if (!v8)
    {
      v23 = qword_1000CB110;
      if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        id v25 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to send PDURLSessionProxy startup message, error %@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
  else
  {
    [(PDURLSessionProxyService *)self _onqueue_messageWithIdentifier:v15 didSendWithSuccess:v8 error:v16];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v48 = a7;
  id v11 = [v10 type];
  v47 = [v10 data];
  v12 = (id)qword_1000CB110;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [v48 outgoingResponseIdentifier];
    unsigned int v17 = [v10 isResponse];
    id v18 = [v47 length];
    *(_DWORD *)buf = 138413570;
    if (v17) {
      int v19 = 89;
    }
    else {
      int v19 = 78;
    }
    id v54 = v14;
    __int16 v55 = 2112;
    *(void *)v56 = v15;
    *(_WORD *)&v56[8] = 2114;
    *(void *)v57 = v16;
    *(_WORD *)&v57[8] = 1024;
    *(_DWORD *)v58 = v11;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = v19;
    __int16 v59 = 2048;
    id v60 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@::%@ outgoingResponseIdentifier = %{public}@, type = %u, isResponse = %c, data length = %lu", buf, 0x36u);
  }
  v20 = +[PDURLSessionProxyCommon messageSubclassForMessageType:isReply:](PDURLSessionProxyCommon, "messageSubclassForMessageType:isReply:", v11, [v10 isResponse]);
  if ([(objc_class *)v20 isEqual:objc_opt_class()])
  {
    id v21 = (id)qword_1000CB110;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v43 = [v10 isResponse];
      id v44 = [v47 length];
      *(_DWORD *)buf = 138413058;
      if (v43) {
        int v45 = 89;
      }
      else {
        int v45 = 78;
      }
      id v54 = v42;
      __int16 v55 = 1024;
      *(_DWORD *)v56 = v11;
      *(_WORD *)&v56[4] = 1024;
      *(_DWORD *)&v56[6] = v45;
      *(_WORD *)v57 = 2048;
      *(void *)&v57[2] = v44;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@ received protobuf of type %u which could not be decoded! isResponse = %c, data length = %lu", buf, 0x22u);
    }
    id v22 = 0;
  }
  else
  {
    id v23 = [v20 alloc];
    id v21 = [v10 data];
    id v22 = [v23 initWithData:v21];
  }

  int v24 = [v22 _nsurlsessionproxy_launchUUID];
  if (!self->_haveReceivedMessage)
  {
    self->_haveReceivedMessage = 1;
    if (!self->_startupMessageIdentifier) {
      [(PDURLSessionProxyService *)self _onqueue_sendStartupMessage];
    }
  }
  if (!v24 || ([v10 isResponse] & 1) != 0)
  {
    if (v11 == 10000)
    {
      id v25 = qword_1000CB110;
      if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Received PDURLSessionProxy Startup message (without a launchUUID)", buf, 2u);
      }
      [(PDURLSessionProxyService *)self _onqueue_remoteDeviceStartedUp];
      self->_haveReceivedLegacyStartupMessage = 1;
      goto LABEL_47;
    }
    goto LABEL_21;
  }
  if (([(NSMutableSet *)self->_receivedLaunchUUIDs containsObject:v24] & 1) == 0)
  {
    v27 = qword_1000CB110;
    BOOL v28 = os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT);
    if (v11 == 10000)
    {
      if (!v28) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      id v54 = v24;
      int v29 = "Received PDURLSession Startup message with launchUUID %@";
    }
    else
    {
      if (!v28) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      id v54 = v24;
      int v29 = "Received PDURLSessionProxy message with new launchUUID %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
LABEL_28:
    BOOL v26 = v11 != 10000;
    if (self->_currentRemoteLaunchUUID || v11 == 10000 || self->_haveReceivedLegacyStartupMessage) {
      [(PDURLSessionProxyService *)self _onqueue_remoteDeviceStartedUp];
    }
    objc_storeStrong((id *)&self->_currentRemoteLaunchUUID, v24);
    [(NSMutableSet *)self->_receivedLaunchUUIDs addObject:v24];
    goto LABEL_31;
  }
  if ([(NSString *)self->_currentRemoteLaunchUUID isEqualToString:v24])
  {
LABEL_21:
    BOOL v26 = 1;
LABEL_31:
    if (v22 && v26)
    {
      v46 = [(PDURLSessionProxyService *)self _onqueue_loggableDescriptionForMessage:v22];
      __int16 v30 = (id)qword_1000CB110;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [v48 outgoingResponseIdentifier];
        unsigned int v32 = [v10 isResponse];
        id v33 = [v47 length];
        *(_DWORD *)buf = 138544386;
        if (v32) {
          int v34 = 89;
        }
        else {
          int v34 = 78;
        }
        id v54 = v46;
        __int16 v55 = 2114;
        *(void *)v56 = v31;
        *(_WORD *)&v56[8] = 1024;
        *(_DWORD *)v57 = v11;
        *(_WORD *)&v57[4] = 1024;
        *(_DWORD *)&v57[6] = v34;
        *(_WORD *)v58 = 2048;
        *(void *)&v58[2] = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving NSURLSession proxy message, identifier = %{public}@, type = %u, isReply = %c, data length = %lu", buf, 0x2Cu);
      }
      if ([v10 isResponse])
      {
        id v35 = [v48 incomingResponseIdentifier];
        [(PDURLSessionProxyService *)self _onqueue_handleReceivedReply:v22 forIdentifier:v35 ofType:v11 withError:0];
      }
      else
      {
        id v36 = [v22 _nsurlsessionproxy_sequenceNumber];
        id v37 = [v22 _nsurlsessionproxy_messagePriority];
        v38 = (id)qword_1000CB110;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = [v48 outgoingResponseIdentifier];
          *(_DWORD *)buf = 138543874;
          id v54 = v39;
          __int16 v55 = 2048;
          *(void *)v56 = v37;
          *(_WORD *)&v56[8] = 2048;
          *(void *)v57 = v36;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Incoming (non-reply) message with identifier %{public}@ has priority %lld and sequence number %llu", buf, 0x20u);
        }
        if ([(PDURLSessionProxyService *)self verifyAndUpdateIncomingSequenceNumber:v36 forPriority:v37])
        {
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_1000120E8;
          v49[3] = &unk_1000B5038;
          v49[4] = self;
          id v50 = v22;
          __int16 v52 = (__int16)v11;
          id v51 = v48;
          [(PDURLSessionProxyService *)self _onqueue_handleReceivedMessage:v50 ofType:v11 withReply:v49];
        }
      }
    }
    goto LABEL_47;
  }
  v40 = qword_1000CB110;
  if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v24;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Dropping NSURLSessionProxy message with old launchUUID %@", buf, 0xCu);
  }
LABEL_47:
}

- (void)_onqueue_messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (a4)
  {
    id v9 = [(NSMutableDictionary *)self->_outstandingReplies objectForKeyedSubscript:v13];

    if (v9) {
      goto LABEL_10;
    }
  }
  else
  {
    id v10 = [(NSMutableDictionary *)self->_outstandingMessages objectForKeyedSubscript:v13];
    id v11 = v8;
    if (!v8)
    {
      id v11 = +[NSError errorWithDomain:NSURLErrorDomain code:-1 userInfo:0];
    }
    [(PDURLSessionProxyService *)self _onqueue_handleReceivedReply:0 forIdentifier:v13 ofType:0 withError:v11];
    if (!v8) {

    }
    v12 = [v10 message];
    -[PDURLSessionProxyService _onqueue_handleFailedMessageSend:ofType:](self, "_onqueue_handleFailedMessageSend:ofType:", v12, [v10 type]);
  }
  [(NSMutableDictionary *)self->_outstandingMessages removeObjectForKey:v13];
LABEL_10:
}

- (void)_onqueue_handleReceivedReply:(id)a3 forIdentifier:(id)a4 ofType:(unsigned __int16)a5 withError:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(NSMutableDictionary *)self->_outstandingReplies objectForKeyedSubscript:v10];
  id v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v9, v11);
    [(NSMutableDictionary *)self->_outstandingReplies removeObjectForKey:v10];
    [(NSMutableDictionary *)self->_outstandingMessages removeObjectForKey:v10];
  }
  else
  {
    id v14 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Received a reply with identifier %@ but don't have a corresponding reply block", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_onqueue_handleFailedMessageSend:(id)a3 ofType:(unsigned __int16)a4
{
  id v4 = a3;
  v5 = qword_1000CB110;
  if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Subclass did not handle message send failure for message %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_onqueue_handleReceivedMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5
{
  int v5 = a4;
  id v6 = a3;
  id v7 = qword_1000CB110;
  if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Subclass did not handle message %@ of type %u", (uint8_t *)&v8, 0x12u);
  }
}

- (void)sendProtobufMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000127B0;
  v13[3] = &unk_1000B4FE8;
  v13[4] = self;
  id v14 = v8;
  unsigned __int16 v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)_onqueue_sendMessage:(id)a3 ofType:(unsigned __int16)a4 responseIdentifier:(id)a5 forSourceApplication:(id)a6 withUrgency:(BOOL)a7 withIDSMessageTimeout:(int64_t)a8 withReply:(id)a9
{
  unsigned int v68 = a4;
  id v15 = a3;
  id v69 = a5;
  unint64_t v66 = (unint64_t)a6;
  id v67 = a9;
  unsigned __int16 v16 = (id)qword_1000CB110;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    uint64_t v19 = NSStringFromSelector(a2);
    v20 = (void *)v19;
    if (self->_connected) {
      int v21 = 89;
    }
    else {
      int v21 = 78;
    }
    *(_DWORD *)buf = 138413826;
    if (v69) {
      int v22 = 89;
    }
    else {
      int v22 = 78;
    }
    *(void *)v78 = v18;
    *(_WORD *)&v78[8] = 2112;
    *(void *)&v78[10] = v19;
    *(_WORD *)&v78[18] = 1024;
    *(_DWORD *)&v78[20] = v68;
    __int16 v79 = 1024;
    int v80 = v21;
    __int16 v81 = 1024;
    *(_DWORD *)v82 = v22;
    *(_WORD *)&v82[4] = 2112;
    *(void *)&v82[6] = v66;
    __int16 v83 = 2048;
    int64_t v84 = a8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@::%@ type = %u, connected = %c, isReply = %c, sourceApplication = %@, msgTO = %ld", buf, 0x3Cu);
  }
  id v23 = +[NSMutableDictionary dictionary];
  [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
  int v24 = +[NSNumber numberWithInteger:a8];
  [v23 setObject:v24 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

  [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionNSURLSessionKey];
  [v23 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
  uint64_t v25 = [v15 _nsurlsessionproxy_sessionIdentifier];
  LODWORD(v24) = (v66 | v25) != 0;

  int64_t v26 = 2 * a8 + 5;
  if (v24)
  {
    v27 = [v15 _nsurlsessionproxy_sessionIdentifier];
    BOOL v28 = v27 == 0;

    if (v28)
    {
      id v30 = 0;
      id v31 = 0;
    }
    else
    {
      int v29 = [v15 _nsurlsessionproxy_sessionIdentifier];
      id v75 = 0;
      id v76 = 0;
      +[PDURLSessionProxyCommon getComponentsForFullIdentifier:v29 bundleIdentifier:&v76 sessionIdentifier:&v75];
      id v30 = v76;
      id v31 = v75;

      if (v30)
      {
        [v23 setObject:v30 forKeyedSubscript:@"NSURLSessionProxyClientBundleIdentifier"];
        if (([v30 isEqualToString:@"com.apple.cloudkit.cloudd"] & 1) != 0
          || [v30 isEqualToString:@"com.apple.cloudd"])
        {
          int64_t v26 = 3600;
        }
      }
    }
    id v32 = (id)v66;
    if (v66)
    {
      id v33 = v32;
    }
    else
    {
      v58 = [v15 _nsurlsessionproxy_sessionIdentifier];
      BOOL v59 = v58 == 0;

      if (v59)
      {
        id v33 = 0;
        goto LABEL_19;
      }
      uint64_t v60 = [(PDURLSessionProxyService *)self _onqueue_sourceApplicationForMessage:v15];
      v61 = (void *)v60;
      if (v60) {
        v62 = (void *)v60;
      }
      else {
        v62 = v30;
      }
      id v33 = v62;

      if (!v33) {
        goto LABEL_19;
      }
    }
    [v23 setObject:v33 forKeyedSubscript:@"IDSSendMessageOptionMetricReportIdentifier"];
LABEL_19:
  }
  int v34 = [v23 objectForKeyedSubscript:@"IDSSendMessageOptionMetricReportIdentifier"];
  BOOL v35 = v34 == 0;

  if (v35)
  {
    id v36 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Unable to determine source application for message", buf, 2u);
    }
  }
  if (v67) {
    [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
  }
  if (v69) {
    [v23 setObject:v69 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
  }
  if (a7) {
    int64_t v37 = 300;
  }
  else {
    int64_t v37 = [(PDURLSessionProxyService *)self _onqueue_priorityForMessage:v15 ofType:v68 isReply:v69 != 0];
  }
  if (!v69)
  {
    [v15 _nsurlsessionproxy_setSequenceNumber:-[PDURLSessionProxyService bumpAndReturnOutgoingSequenceNumberForPriority:](self, "bumpAndReturnOutgoingSequenceNumberForPriority:", v37)];
    [v15 _nsurlsessionproxy_setMessagePriority:v37];
    v38 = [(PDURLSessionProxyService *)self launchUUID];
    [v15 _nsurlsessionproxy_setLaunchUUID:v38];
  }
  id v39 = objc_alloc((Class)IDSProtobuf);
  v40 = [v15 data];
  id v64 = [v39 initWithProtobufData:v40 type:v68 isResponse:v69 != 0];

  idsService = self->_idsService;
  id v42 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v73 = 0;
  id v74 = 0;
  unsigned int v43 = [(IDSService *)idsService sendProtobuf:v64 toDestinations:v42 priority:v37 options:v23 identifier:&v74 error:&v73];
  id v44 = v74;
  id v45 = v73;

  if (v43)
  {
    v46 = [[PDURLSessionProxyMessageInfo alloc] initWithMessage:v15 type:v68];
    [(NSMutableDictionary *)self->_outstandingMessages setObject:v46 forKeyedSubscript:v44];
    if (v67)
    {
      id v47 = [v67 copy];
      [(NSMutableDictionary *)self->_outstandingReplies setObject:v47 forKeyedSubscript:v44];

      if (v68 != 3001)
      {
        dispatch_time_t v48 = dispatch_time(0, 1000000000 * v26);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000131E8;
        block[3] = &unk_1000B4FC0;
        block[4] = self;
        id v71 = v44;
        __int16 v72 = v68;
        dispatch_after(v48, queue, block);
      }
    }
  }
  else
  {
    id v50 = (id)qword_1000CB110;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      id v63 = [v45 code];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v78 = v68;
      *(_WORD *)&v78[4] = 2112;
      *(void *)&v78[6] = v45;
      *(_WORD *)&v78[14] = 2048;
      *(void *)&v78[16] = v63;
      _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to send message! Type = %u, error = %@ [%ld]", buf, 0x1Cu);
    }

    if (v67)
    {
      id v51 = v45;
      if (!v45)
      {
        id v51 = +[NSError errorWithDomain:NSURLErrorDomain code:-1 userInfo:0];
      }
      (*((void (**)(id, void, void *))v67 + 2))(v67, 0, v51);
      if (!v45) {
    }
      }
    -[PDURLSessionProxyService _onqueue_handleFailedMessageSend:ofType:](self, "_onqueue_handleFailedMessageSend:ofType:", v15, v68, v64);
  }
  __int16 v52 = -[PDURLSessionProxyService _onqueue_loggableDescriptionForMessage:](self, "_onqueue_loggableDescriptionForMessage:", v15, v64);
  v53 = (id)qword_1000CB110;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    if (v69) {
      int v54 = 89;
    }
    else {
      int v54 = 78;
    }
    __int16 v55 = [v15 data];
    id v56 = [v55 length];
    *(_DWORD *)buf = 138544642;
    if (v43) {
      int v57 = 89;
    }
    else {
      int v57 = 78;
    }
    *(void *)v78 = v52;
    *(_WORD *)&v78[8] = 2114;
    *(void *)&v78[10] = v44;
    *(_WORD *)&v78[18] = 1024;
    *(_DWORD *)&v78[20] = v68;
    __int16 v79 = 1024;
    int v80 = v54;
    __int16 v81 = 2048;
    *(void *)v82 = v56;
    *(_WORD *)&v82[8] = 1024;
    *(_DWORD *)&v82[10] = v57;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ sent NSURLSessionProxy message, identifier = %{public}@, type = %u, isReply = %c, data length = %lu, result = %c", buf, 0x32u);
  }
}

- (BOOL)verifyAndUpdateIncomingSequenceNumber:(unint64_t)a3 forPriority:(int64_t)a4
{
  incomingSequenceNumbersByPriority = self->_incomingSequenceNumbersByPriority;
  id v8 = +[NSNumber numberWithLongLong:a4];
  id v9 = [(NSMutableDictionary *)incomingSequenceNumbersByPriority objectForKeyedSubscript:v8];
  id v10 = [v9 unsignedLongLongValue];

  unint64_t v11 = a3 - 1;
  if (a3 - 1 < (unint64_t)v10)
  {
    id v15 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_ERROR))
    {
      int v17 = 134218496;
      int64_t v18 = a4;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      __int16 v21 = 2048;
      id v22 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Received a message of priority %ld with lower sequence number %llu than existing sequence number %llu. Dropping message.", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    id v12 = +[NSNumber numberWithUnsignedLongLong:a3];
    id v13 = self->_incomingSequenceNumbersByPriority;
    id v14 = +[NSNumber numberWithLongLong:a4];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
  }
  return v11 >= (unint64_t)v10;
}

- (unint64_t)bumpAndReturnOutgoingSequenceNumberForPriority:(int64_t)a3
{
  outgoingSequenceNumbersByPriority = self->_outgoingSequenceNumbersByPriority;
  id v6 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
  id v7 = [(NSMutableDictionary *)outgoingSequenceNumbersByPriority objectForKeyedSubscript:v6];
  id v8 = (char *)[v7 unsignedLongLongValue];

  unint64_t v9 = (unint64_t)(v8 + 1);
  id v10 = +[NSNumber numberWithUnsignedLongLong:v8 + 1];
  unint64_t v11 = self->_outgoingSequenceNumbersByPriority;
  id v12 = +[NSNumber numberWithLongLong:a3];
  [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

  return v9;
}

- (id)_onqueue_loggableDescriptionForMessage:(id)a3
{
  return 0;
}

- (int64_t)_onqueue_IDSTimoutForMessage:(id)a3
{
  return 50;
}

- (id)_onqueue_sourceApplicationForMessage:(id)a3
{
  return 0;
}

- (int64_t)_onqueue_priorityForMessage:(id)a3 ofType:(unsigned __int16)a4 isReply:(BOOL)a5
{
  return 200;
}

- (void)_onqueue_setPrefersInfraWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  CFBooleanRef v5 = (const __CFBoolean *)qword_1000CB078;
  if (!qword_1000CB078)
  {
    CFBooleanRef v6 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"DisableInfraWiFi", @"com.apple.nsurlsessiond");
    if (v6)
    {
      CFBooleanRef v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFBooleanGetTypeID())
      {
        int Value = CFBooleanGetValue(v7);
      }
      else
      {
        CFTypeID v10 = CFGetTypeID(v7);
        if (v10 != CFStringGetTypeID())
        {
          CFRelease(v7);
          goto LABEL_10;
        }
        int Value = CFEqual(v7, @"1");
      }
      int v11 = Value;
      CFRelease(v7);
      if (v11)
      {
        id v12 = &kCFBooleanTrue;
LABEL_11:
        CFBooleanRef v5 = *v12;
        qword_1000CB078 = (uint64_t)*v12;
        goto LABEL_12;
      }
    }
LABEL_10:
    id v12 = &kCFBooleanFalse;
    goto LABEL_11;
  }
LABEL_12:
  if (!CFBooleanGetValue(v5) && self->_prefersInfraWiFi != v3)
  {
    self->_prefersInfraWiFi = v3;
    id v13 = qword_1000CB110;
    if (os_log_type_enabled((os_log_t)qword_1000CB110, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        int v14 = 89;
      }
      else {
        int v14 = 78;
      }
      v15[0] = 67109120;
      v15[1] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyService setting preferInfraWiFi to %c", (uint8_t *)v15, 8u);
    }
    [(IDSService *)self->_idsService setPreferInfraWiFi:v3];
  }
}

- (void)_onqueue_remoteDeviceStartedUp
{
}

- (void)_onqueue_updateDeviceState
{
  BOOL connected = self->_connected;
  [(IDSService *)self->_idsService devices];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v20 != v6) {
        objc_enumerationMutation(v4);
      }
      CFTypeID v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
      if (objc_msgSend(v8, "isDefaultPairedDevice", (void)v19))
      {
        if ([v8 isNearby]) {
          break;
        }
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    if ((unint64_t)[v8 serviceMinCompatibilityVersion] < 8)
    {
      BOOL v9 = 1;
      goto LABEL_16;
    }
    CFTypeID v10 = (id)qword_1000CB110;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ Connected to post PDURL device - resetting state", buf, 0xCu);
    }
    self->_haveReceivedMessage = 0;
    [(PDURLSessionProxyService *)self _onqueue_remoteDeviceStartedUp];
  }
  else
  {
LABEL_10:
    BOOL v9 = 0;
LABEL_16:

    self->_BOOL connected = v9;
    id v13 = (id)qword_1000CB110;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      unsigned __int16 v16 = (void *)v15;
      if (self->_connected) {
        int v17 = 89;
      }
      else {
        int v17 = 78;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v15;
      __int16 v25 = 1024;
      int v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Updated device state BOOL connected = %c", buf, 0x12u);
    }
    if (!connected || v9)
    {
      char v18 = !v9;
      if (connected) {
        char v18 = 1;
      }
      if ((v18 & 1) == 0) {
        [(PDURLSessionProxyService *)self _onqueue_devicesConnected];
      }
    }
    else
    {
      [(PDURLSessionProxyService *)self _onqueue_devicesDisconnected];
    }
  }
}

- (id)defaultPairedDevice
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IDSService *)self->_idsService devices];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)withWorkQueue:(id)a3
{
}

- (void)_onqueue_sendStartupMessage
{
  if (self->_haveReceivedMessage)
  {
    id v3 = objc_opt_new();
    uint64_t v4 = [(PDURLSessionProxyService *)self launchUUID];
    [v3 setLaunchUUID:v4];

    id v5 = objc_alloc((Class)IDSProtobuf);
    uint64_t v6 = [v3 data];
    id v7 = [v5 initWithProtobufData:v6 type:10000 isResponse:0];

    long long v8 = +[NSMutableDictionary dictionary];
    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
    long long v9 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v8 setObject:v9 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionNSURLSessionKey];
    [v8 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    idsService = self->_idsService;
    long long v11 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v20 = 0;
    id v21 = 0;
    unsigned int v12 = [(IDSService *)idsService sendProtobuf:v7 toDestinations:v11 priority:200 options:v8 identifier:&v21 error:&v20];
    id v13 = v21;
    id v14 = v21;
    id v15 = v20;

    self->_startupMessageFailed = v12 ^ 1;
    if ((v12 ^ 1))
    {
      unsigned __int16 v16 = (id)qword_1000CB110;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v15 code];
        *(_DWORD *)buf = 138412546;
        id v23 = v15;
        __int16 v24 = 2048;
        id v25 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "sendProtobuf: returned NO for PDURLSessionProxy startup message, error %@ [%ld]", buf, 0x16u);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_startupMessageIdentifier, v13);
      unsigned __int16 v16 = (id)qword_1000CB110;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = (objc_class *)objc_opt_class();
        char v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138412546;
        id v23 = v18;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ sent startup message with identifier %@", buf, 0x16u);
      }
    }
  }
}

- (void)devicesDidUnpair:(id)a3
{
  id v4 = a3;
  id v5 = (id)qword_1000CB110;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412290;
    long long v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Devices unpaired", buf, 0xCu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014040;
  v8[3] = &unk_1000B6380;
  v8[4] = self;
  [(PDURLSessionProxyService *)self withWorkQueue:v8];
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000140F0;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(queue, block);
}

- (PDURLSessionProxyService)init
{
  v21.receiver = self;
  v21.super_class = (Class)PDURLSessionProxyService;
  v2 = [(PDURLSessionProxyService *)&v21 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    outstandingReplies = v2->_outstandingReplies;
    v2->_outstandingReplies = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    outstandingMessages = v2->_outstandingMessages;
    v2->_outstandingMessages = (NSMutableDictionary *)v5;

    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.nsurlsessiond.NSURLSessionProxyService-Queue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    outgoingSequenceNumbersByPriority = v2->_outgoingSequenceNumbersByPriority;
    v2->_outgoingSequenceNumbersByPriority = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    incomingSequenceNumbersByPriority = v2->_incomingSequenceNumbersByPriority;
    v2->_incomingSequenceNumbersByPriority = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    receivedLaunchUUIDs = v2->_receivedLaunchUUIDs;
    v2->_receivedLaunchUUIDs = (NSMutableSet *)v14;

    startupMessageIdentifier = v2->_startupMessageIdentifier;
    v2->_startupMessageIdentifier = 0;

    int v17 = +[NSUUID UUID];
    uint64_t v18 = [v17 UUIDString];
    launchUUID = v2->_launchUUID;
    v2->_launchUUID = (NSString *)v18;

    v2->_haveReceivedMessage = 0;
  }
  return v2;
}

@end