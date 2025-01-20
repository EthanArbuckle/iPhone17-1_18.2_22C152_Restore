@interface NBRemoteObject
+ (BOOL)messagesShouldHaveValidSender;
- (IDSService)service;
- (NBRemoteObject)initWithServiceName:(id)a3 andDelegate:(id)a4 andClientQueue:(id)a5;
- (NSDictionary)delayedRestoreMessages;
- (OS_dispatch_queue)clientQueue;
- (id)delegate;
- (void)_messageResponseTimeout:(id)a3;
- (void)_queueSendMessage:(id)a3 orPath:(id)a4 type:(unsigned __int16)a5 requestUUID:(id)a6 withTimeout:(id)a7 withResponseTimeout:(id)a8 withDescription:(id)a9 onlyOneFor:(id)a10 didSend:(id)a11 andResponse:(id)a12;
- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 didSend:(id)a10 andResponse:(id)a11;
- (void)_storeProtobufAction:(SEL)a3 messageType:(unsigned __int16)a4 messageSendType:(int64_t)a5;
- (void)handleIncomingMessage:(id)a3;
- (void)invalidate;
- (void)sendFileRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9 andResponse:(id)a10;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 didSend:(id)a6;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 didSend:(id)a7;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9 andResponse:(id)a10;
- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9;
- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)setClientQueue:(id)a3;
- (void)setDelayedRestoreMessages:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4;
- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4;
@end

@implementation NBRemoteObject

- (NBRemoteObject)initWithServiceName:(id)a3 andDelegate:(id)a4 andClientQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)NBRemoteObject;
  v11 = [(NBRemoteObject *)&v34 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    serviceName = v11->_serviceName;
    v11->_serviceName = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    idsSendIDToCompletionHandler = v11->_idsSendIDToCompletionHandler;
    v11->_idsSendIDToCompletionHandler = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    idsSendIDToResponseHandler = v11->_idsSendIDToResponseHandler;
    v11->_idsSendIDToResponseHandler = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    idsSendIDToTimer = v11->_idsSendIDToTimer;
    v11->_idsSendIDToTimer = v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v21 = v8;
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], v20);
    idsQueue = v11->_idsQueue;
    v11->_idsQueue = (OS_dispatch_queue *)v22;

    if (v10)
    {
      v24 = (OS_dispatch_queue *)v10;
      clientQueue = v11->_clientQueue;
      v11->_clientQueue = v24;
    }
    else
    {
      clientQueue = [v21 stringByAppendingString:@".client"];
      dispatch_queue_t v26 = dispatch_queue_create((const char *)[(OS_dispatch_queue *)clientQueue UTF8String], v20);
      v27 = v11->_clientQueue;
      v11->_clientQueue = (OS_dispatch_queue *)v26;
    }
    v28 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:v11->_serviceName];
    service = v11->_service;
    v11->_service = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    idsRequestMessageTypeToSelector = v11->_idsRequestMessageTypeToSelector;
    v11->_idsRequestMessageTypeToSelector = v30;

    [(NBRemoteObject *)v11 registerProtobufHandlers];
    [(IDSService *)v11->_service addDelegate:v11 queue:v11->_idsQueue];
    [(NBRemoteObject *)v11 setDelegate:v9];
    v32 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Created IDS service %@", buf, 0xCu);
    }
  }
  return v11;
}

- (void)invalidate
{
  v3 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138412290;
    id v10 = serviceName;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating NRRemoteObject service %@", buf, 0xCu);
  }
  idsQueue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011940;
  block[3] = &unk_10002C7F8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)idsQueue, block);
  v6 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_serviceName;
    *(_DWORD *)buf = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating NRRemoteObject service %@- complete", buf, 0xCu);
  }
}

+ (BOOL)messagesShouldHaveValidSender
{
  return 0;
}

- (void)handleIncomingMessage:(id)a3
{
  id v4 = a3;
  v5 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    serviceName = self->_serviceName;
    v7 = v5;
    unint64_t v8 = [v4 type];
    id v9 = [v4 data];
    id v10 = [v9 length];
    unsigned int v11 = [v4 isResponse];
    v12 = &__kCFBooleanFalse;
    if (v11) {
      v12 = &__kCFBooleanTrue;
    }
    *(_DWORD *)buf = 138413058;
    v56 = serviceName;
    __int16 v57 = 2048;
    unint64_t v58 = v8;
    __int16 v59 = 2048;
    unint64_t v60 = (unint64_t)v10;
    __int16 v61 = 2112;
    id v62 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%@): IDS message received type=%ld length=%ld response=%@", buf, 0x2Au);
  }
  v13 = [v4 context];
  v14 = [v13 incomingResponseIdentifier];

  if ([v4 isResponse] && v14)
  {
    v15 = [(NSMutableDictionary *)self->_idsSendIDToTimer objectForKeyedSubscript:v14];
    [v15 invalidate];
    [(NSMutableDictionary *)self->_idsSendIDToTimer removeObjectForKey:v14];
    v16 = [(NSMutableDictionary *)self->_idsSendIDToResponseHandler objectForKeyedSubscript:v14];
    v17 = nb_daemon_log;
    BOOL v18 = os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = self->_serviceName;
        *(_DWORD *)buf = 138412546;
        v56 = v19;
        __int16 v57 = 2114;
        unint64_t v58 = (unint64_t)v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "(%@): matched response %{public}@, executing block", buf, 0x16u);
      }
      [(NSMutableDictionary *)self->_idsSendIDToResponseHandler removeObjectForKey:v14];
      clientQueue = self->_clientQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012570;
      block[3] = &unk_10002CF28;
      id v54 = v16;
      id v53 = v4;
      dispatch_async((dispatch_queue_t)clientQueue, block);
    }
    else if (v18)
    {
      id v21 = self->_serviceName;
      *(_DWORD *)buf = 138412546;
      v56 = v21;
      __int16 v57 = 2114;
      unint64_t v58 = (unint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "(%@): no ack block found for response %{public}@, ignoring", buf, 0x16u);
    }
  }
  if ([v4 isResponse]) {
    uint64_t v22 = 0x10000;
  }
  else {
    uint64_t v22 = 0;
  }
  v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v22 | [v4 type]);
  v24 = [(NSMutableDictionary *)self->_idsRequestMessageTypeToSelector objectForKeyedSubscript:v23];
  v25 = v24;
  if (!v24)
  {
    objc_super v34 = (void *)nb_daemon_log;
    if (!os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    v35 = self->_serviceName;
    id v36 = v34;
    unint64_t v37 = [v4 type];
    v38 = [v4 data];
    id v39 = [v38 length];
    unsigned int v40 = [v4 isResponse];
    v41 = &__kCFBooleanFalse;
    if (v40) {
      v41 = &__kCFBooleanTrue;
    }
LABEL_32:
    *(_DWORD *)buf = 138413058;
    v56 = v35;
    __int16 v57 = 2048;
    unint64_t v58 = v37;
    __int16 v59 = 2048;
    unint64_t v60 = (unint64_t)v39;
    __int16 v61 = 2112;
    id v62 = v41;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "(%@): No selector found for type=%ld length=%ld response=%@", buf, 0x2Au);

    goto LABEL_33;
  }
  id v26 = [v24 method];
  v27 = (void *)nb_daemon_log;
  BOOL v28 = os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (!v26)
  {
    if (!v28) {
      goto LABEL_33;
    }
    v35 = self->_serviceName;
    id v36 = v27;
    unint64_t v37 = [v4 type];
    v38 = [v4 data];
    id v39 = [v38 length];
    unsigned int v42 = [v4 isResponse];
    v41 = &__kCFBooleanFalse;
    if (v42) {
      v41 = &__kCFBooleanTrue;
    }
    goto LABEL_32;
  }
  if (v28)
  {
    v45 = self->_serviceName;
    log = v27;
    v29 = NSStringFromSelector((SEL)[v25 selector]);
    unint64_t v44 = [v4 type];
    v46 = [v4 data];
    id v43 = [v46 length];
    if ([v4 isResponse]) {
      v30 = &__kCFBooleanTrue;
    }
    else {
      v30 = &__kCFBooleanFalse;
    }
    v31 = [v4 context];
    v32 = [v31 fromID];
    *(_DWORD *)buf = 138413570;
    v56 = v45;
    __int16 v57 = 2114;
    unint64_t v58 = (unint64_t)v29;
    __int16 v59 = 2048;
    unint64_t v60 = v44;
    __int16 v61 = 2048;
    id v62 = v43;
    __int16 v63 = 2112;
    v64 = v30;
    __int16 v65 = 2114;
    v66 = v32;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "(%@): Calling selector %{public}@ for type=%ld length=%ld response=%@ messageSource=%{public}@", buf, 0x3Eu);
  }
  v33 = self->_clientQueue;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100012584;
  v48[3] = &unk_10002CF50;
  id v51 = v26;
  v48[4] = self;
  id v49 = v25;
  id v50 = v4;
  dispatch_async((dispatch_queue_t)v33, v48);

LABEL_33:
}

- (void)_storeProtobufAction:(SEL)a3 messageType:(unsigned __int16)a4 messageSendType:(int64_t)a5
{
  unsigned int v6 = a4;
  id v10 = objc_alloc_init(NBPBSelectorItem);
  [(NBPBSelectorItem *)v10 setSelector:a3];
  if (a3) {
    [(NBPBSelectorItem *)v10 setMethod:[(NBRemoteObject *)self methodForSelector:a3]];
  }
  id v9 = +[NSNumber numberWithInteger:v6 | (unint64_t)(a5 << 16)];
  [(NSMutableDictionary *)self->_idsRequestMessageTypeToSelector setObject:v10 forKeyedSubscript:v9];
}

- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  [(NBRemoteObject *)self _storeProtobufAction:a3 messageType:a4 messageSendType:0];
  id v6 = [(NBRemoteObject *)self service];
  [v6 setProtobufAction:"handleIncomingMessage:" forIncomingRequestsOfType:v4];
}

- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  if (a3) {
    [(NBRemoteObject *)self _storeProtobufAction:a3 messageType:a4 messageSendType:1];
  }
  id v6 = [(NBRemoteObject *)self service];
  [v6 setProtobufAction:"handleIncomingMessage:" forIncomingResponsesOfType:v4];
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 didSend:(id)a6
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 didSend:(id)a7
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9 andResponse:(id)a10
{
}

- (void)sendFileRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9 andResponse:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  idsQueue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012A04;
  block[3] = &unk_10002CF78;
  void block[4] = self;
  id v32 = v15;
  unsigned __int16 v39 = a4;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v36 = v19;
  id v37 = v20;
  id v38 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  id v27 = v17;
  id v28 = v16;
  id v29 = v15;
  dispatch_async((dispatch_queue_t)idsQueue, block);
}

- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9
{
  uint64_t v13 = a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  id v22 = objc_alloc((Class)NSUUID);
  id v25 = [v20 context];

  id v23 = [v25 outgoingResponseIdentifier];
  id v24 = [v22 initWithUUIDString:v23];
  [(NBRemoteObject *)self _sendMessage:v21 type:v13 requestUUID:v24 withTimeout:v19 withResponseTimeout:0 withDescription:v18 onlyOneFor:v17 didSend:v16 andResponse:0];
}

- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 didSend:(id)a9
{
}

- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 didSend:(id)a10 andResponse:(id)a11
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_idsQueue);
  idsQueue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012D74;
  block[3] = &unk_10002CFA0;
  void block[4] = self;
  id v35 = v16;
  unsigned __int16 v43 = a4;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  id v39 = v20;
  id v40 = v21;
  id v41 = v22;
  id v42 = v23;
  id v25 = v23;
  id v26 = v22;
  id v27 = v21;
  id v28 = v20;
  id v29 = v19;
  id v30 = v18;
  id v31 = v17;
  id v32 = v16;
  dispatch_async((dispatch_queue_t)idsQueue, block);
}

- (void)_messageResponseTimeout:(id)a3
{
  id v4 = a3;
  idsQueue = self->_idsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012E54;
  v7[3] = &unk_10002C790;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)idsQueue, v7);
}

- (void)_queueSendMessage:(id)a3 orPath:(id)a4 type:(unsigned __int16)a5 requestUUID:(id)a6 withTimeout:(id)a7 withResponseTimeout:(id)a8 withDescription:(id)a9 onlyOneFor:(id)a10 didSend:(id)a11 andResponse:(id)a12
{
  uint64_t v15 = a5;
  id v18 = a3;
  id v71 = a4;
  id v19 = a6;
  id v20 = a7;
  id v67 = a8;
  id v21 = a9;
  id v74 = a11;
  id v73 = a12;
  id v22 = "request";
  if (v19) {
    id v22 = "response";
  }
  v70 = v22;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  id v23 = +[NSMutableDictionary dictionary];
  id v24 = v23;
  if (!v20)
  {
    id v26 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v24 setObject:v26 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

LABEL_8:
    int v65 = 0;
    if (!v19) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  [v23 setObject:v20 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
  [v20 doubleValue];
  if (v25 + -10.0 >= 0.00000011920929) {
    goto LABEL_8;
  }
  [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
  int v65 = 1;
  if (v19)
  {
LABEL_9:
    id v27 = [v19 UUIDString];
    [v24 setObject:v27 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
  }
LABEL_10:
  id v72 = v20;
  v69 = v19;
  id v66 = v21;
  if (v18)
  {
    BOOL v28 = v19 != 0;
    id v29 = objc_alloc((Class)IDSProtobuf);
    id v30 = [v18 data];
    id v31 = [v29 initWithProtobufData:v30 type:v15 isResponse:v28];

    id v32 = [(IDSService *)self->_service nb_defaultPairedDeviceIDIncludingTinkerDevices];
    if (v32)
    {
      id v33 = [(NBRemoteObject *)self service];
      id v34 = +[NSSet setWithObject:v32];
      id v82 = 0;
      id v83 = 0;
      unsigned int v35 = [v33 sendProtobuf:v31 toDestinations:v34 priority:200 options:v24 identifier:&v83 error:&v82];
      id v36 = v83;
      id v37 = v82;
    }
    else
    {
      id v37 = +[NSError errorWithDomain:@"NBErrorDomain" code:3 userInfo:0];
      id v42 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "No default paired device. Unable to send message", buf, 2u);
      }
      unsigned int v35 = 0;
      id v36 = 0;
    }
  }
  else
  {
    id v31 = [(NBRemoteObject *)self service];
    id v32 = +[NSURL fileURLWithPath:v71];
    CFStringRef v94 = @"MessageType";
    id v38 = +[NSNumber numberWithInt:v15];
    v95 = v38;
    id v39 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    [(IDSService *)self->_service nb_defaultPairedDeviceIDIncludingTinkerDevices];
    id v40 = v64 = self;
    id v41 = +[NSSet setWithObject:v40];
    id v81 = 0;
    id v80 = 0;
    unsigned int v35 = [v31 sendResourceAtURL:v32 metadata:v39 toDestinations:v41 priority:200 options:v24 identifier:&v81 error:&v80];
    id v36 = v81;
    id v37 = v80;

    id v18 = 0;
    self = v64;
  }
  v68 = v24;
  if (!v35 || v37)
  {
    if (v37) {
      char v52 = 1;
    }
    else {
      char v52 = v35;
    }
    unsigned __int16 v43 = v72;
    unint64_t v44 = v67;
    if ((v52 & 1) == 0)
    {
      id v37 = +[NSError errorWithDomain:@"com.apple.nanobackup.remoteobject" code:1 userInfo:0];
    }
    id v53 = (objc_class *)objc_opt_class();
    id v54 = NSStringFromClass(v53);
    id v49 = +[NSString stringWithFormat:@"Error sending %s %@ - %@", v70, v54, v37];

    v55 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v85 = v49;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    v46 = v66;
    if (v74)
    {
      clientQueue = self->_clientQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000137F4;
      block[3] = &unk_10002CF28;
      id v79 = v74;
      id v78 = v37;
      dispatch_async((dispatch_queue_t)clientQueue, block);
    }
    if (!v73) {
      goto LABEL_36;
    }
    __int16 v57 = self->_clientQueue;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100013808;
    v75[3] = &unk_10002CF00;
    id v76 = v73;
    dispatch_async((dispatch_queue_t)v57, v75);
    id v51 = v76;
LABEL_35:

LABEL_36:
    goto LABEL_38;
  }
  unsigned __int16 v43 = v72;
  unint64_t v44 = v67;
  if (v74)
  {
    id v45 = objc_retainBlock(v74);
    [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler setObject:v45 forKeyedSubscript:v36];
  }
  v46 = v66;
  if (v73)
  {
    id v47 = objc_retainBlock(v73);
    [(NSMutableDictionary *)self->_idsSendIDToResponseHandler setObject:v47 forKeyedSubscript:v36];

    if (v67)
    {
      v48 = +[NSString stringWithFormat:@"com.apple.%s.%@", v70, v36];
      id v49 = [v48 stringByReplacingOccurrencesOfString:@" " withString:@"-"];

      id v50 = objc_alloc((Class)PCPersistentTimer);
      [v67 doubleValue];
      id v51 = objc_msgSend(v50, "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", v49, self, "_messageResponseTimeout:", v36);
      [v51 setMinimumEarlyFireProportion:1.0];
      [v51 scheduleInQueue:self->_idsQueue];
      [(NSMutableDictionary *)self->_idsSendIDToTimer setObject:v51 forKeyedSubscript:v36];
      id v37 = 0;
      goto LABEL_35;
    }
  }
  id v37 = 0;
LABEL_38:
  unint64_t v58 = nb_daemon_log;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v59 = v46;
    if (!v46)
    {
      unint64_t v60 = (objc_class *)objc_opt_class();
      __int16 v59 = NSStringFromClass(v60);
    }
    __int16 v61 = [v18 data];
    id v62 = [v61 length];
    *(_DWORD *)buf = 136316162;
    __int16 v63 = (const char *)&unk_10002A019;
    v85 = v70;
    __int16 v86 = 2114;
    if (v65) {
      __int16 v63 = "fireAndForget is ON";
    }
    v87 = v59;
    __int16 v88 = 2048;
    id v89 = v62;
    __int16 v90 = 2114;
    id v91 = v36;
    __int16 v92 = 2080;
    v93 = v63;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Sent IDS %s %{public}@ bytes=%ld got identifier: %{public}@ %s", buf, 0x34u);

    if (!v46) {
    unsigned __int16 v43 = v72;
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  v12 = [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler objectForKeyedSubscript:v10];
  if (v12)
  {
    [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler removeObjectForKey:v10];
    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013B34;
    block[3] = &unk_10002CF28;
    id v32 = v12;
    id v31 = v11;
    dispatch_async((dispatch_queue_t)clientQueue, block);
  }
  if (!v11 && a6)
  {
    v14 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "IDS success sending request: %{public}@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  uint64_t v15 = (void *)IDSErrorDomain;
  id v16 = [v11 domain];
  if ([v15 isEqual:v16])
  {
    id v17 = [v11 code];

    if (v17 == (id)24)
    {
      id v18 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v34 = v10;
        id v19 = "IDS message %{public}@ was replaced by another message";
        id v20 = v18;
        uint32_t v21 = 12;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v22 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v34 = v11;
    __int16 v35 = 2114;
    id v36 = v10;
    id v19 = "IDS error sending request: %{public}@ %{public}@";
    id v20 = v22;
    uint32_t v21 = 22;
    goto LABEL_14;
  }
LABEL_15:
  id v23 = [(NSMutableDictionary *)self->_idsSendIDToResponseHandler objectForKeyedSubscript:v10];
  id v24 = v23;
  if (v23)
  {
    idsSendIDToResponseHandler = self->_idsSendIDToResponseHandler;
    id v26 = objc_retainBlock(v23);
    [(NSMutableDictionary *)idsSendIDToResponseHandler removeObjectForKey:v26];

    id v27 = self->_clientQueue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100013B48;
    v28[3] = &unk_10002CF00;
    id v29 = v24;
    dispatch_async((dispatch_queue_t)v27, v28);
  }
LABEL_18:
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v46 = a3;
  id v45 = a4;
  id v48 = a5;
  id v14 = a6;
  id v47 = a7;
  id v42 = a8;
  uint64_t v15 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "incomingResourceAtURL called", buf, 2u);
  }
  unint64_t v44 = v14;
  id v16 = objc_msgSend(v14, "objectForKeyedSubscript:", @"MessageType", v42);
  unsigned __int16 v17 = (unsigned __int16)[v16 shortValue];

  id v18 = NSTemporaryDirectory();
  id v19 = +[NSUUID UUID];
  id v20 = [v19 UUIDString];
  uint32_t v21 = [v18 stringByAppendingPathComponent:v20];
  id v22 = +[NSURL fileURLWithPath:v21];

  id v23 = +[NSFileManager defaultManager];
  id v54 = 0;
  id v24 = v48;
  [v23 linkItemAtURL:v48 toURL:v22 error:&v54];
  double v25 = (NSString *)v54;

  if (v25)
  {
    id v26 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to hardlink url, this will cause a failure eventually: %@", buf, 0xCu);
    }
  }
  id v27 = +[NSNumber numberWithInteger:8];
  BOOL v28 = [(NSMutableDictionary *)self->_idsRequestMessageTypeToSelector objectForKeyedSubscript:v27];
  id v29 = v28;
  if (!v28)
  {
    id v38 = nb_daemon_log;
    id v37 = v43;
    if (!os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    serviceName = self->_serviceName;
    *(_DWORD *)buf = 138412802;
    v56 = serviceName;
    __int16 v57 = 2048;
    unint64_t v58 = v17;
    __int16 v59 = 2112;
    unint64_t v60 = (unint64_t)v22;
    id v40 = v38;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "(%@): No selector found for type=%ld length=%@", buf, 0x20u);
    goto LABEL_16;
  }
  id v30 = [v28 method];
  id v31 = nb_daemon_log;
  BOOL v32 = os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (!v30)
  {
    id v37 = v43;
    if (!v32) {
      goto LABEL_16;
    }
    id v41 = self->_serviceName;
    *(_DWORD *)buf = 138412802;
    v56 = v41;
    __int16 v57 = 2048;
    unint64_t v58 = v17;
    __int16 v59 = 2112;
    unint64_t v60 = (unint64_t)v22;
    id v40 = v31;
    goto LABEL_15;
  }
  if (v32)
  {
    id v33 = self->_serviceName;
    id v34 = v31;
    __int16 v35 = NSStringFromSelector((SEL)[v29 selector]);
    *(_DWORD *)buf = 138413314;
    v56 = v33;
    __int16 v57 = 2114;
    unint64_t v58 = (unint64_t)v35;
    __int16 v59 = 2048;
    unint64_t v60 = v17;
    __int16 v61 = 2112;
    id v62 = v22;
    __int16 v63 = 2114;
    id v24 = v48;
    id v64 = v47;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "(%@): Calling selector %{public}@ for type=%ld url=%@ messageSource=%{public}@", buf, 0x34u);
  }
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013FE4;
  block[3] = &unk_10002CFC8;
  id v53 = v30;
  void block[4] = self;
  id v50 = v29;
  id v51 = v22;
  id v37 = v43;
  id v52 = v43;
  dispatch_async((dispatch_queue_t)clientQueue, block);

LABEL_16:
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8 = (IDSService *)a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (self->_service == v8)
  {
    id v11 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "executing IDS acknowledgementBlock", v12, 2u);
    }
    v10[2](v10);
  }
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)delayedRestoreMessages
{
  return self->_delayedRestoreMessages;
}

- (void)setDelayedRestoreMessages:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_delayedRestoreMessages, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_idsRequestMessageTypeToSelector, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_idsSendIDToTimer, 0);
  objc_storeStrong((id *)&self->_idsSendIDToResponseHandler, 0);

  objc_storeStrong((id *)&self->_idsSendIDToCompletionHandler, 0);
}

@end