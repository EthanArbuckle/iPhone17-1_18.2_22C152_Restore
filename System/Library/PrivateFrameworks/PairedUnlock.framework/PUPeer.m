@interface PUPeer
- (BOOL)isUnlockEnabled;
- (NSMutableDictionary)errorHandlers;
- (NSMutableDictionary)responseHandlers;
- (OS_dispatch_queue)handlerManagementQueue;
- (PUKeyStore)keyStore;
- (PUPeer)init;
- (PUPeerDelegate)delegate;
- (id)_convertRemotePasscodeStateToRemoteDeviceState:(id)a3;
- (id)_convertToRemoteDeviceState:(id)a3;
- (id)_createAndStoreNewPasscodeWithCurrentPasscode:(id)a3;
- (id)_passcodeStringFromPasscodeData:(id)a3;
- (id)_retrieveUnlockOnlyPasscode;
- (id)_sendProtobuf:(id)a3 reliably:(BOOL)a4 expectsResponse:(BOOL)a5 responseIdentifier:(id)a6 error:(id *)a7;
- (id)_sendRequest:(unsigned __int16)a3 data:(id)a4 reliably:(BOOL)a5 expectResponse:(BOOL)a6 handler:(id)a7 error:(id *)a8;
- (id)errorHandlerForRequest:(id)a3;
- (id)responseHandlerForRequestMessageID:(id)a3;
- (unsigned)pairedDeviceVersion;
- (void)_logProtobuf:(id)a3;
- (void)_logResponse:(id)a3;
- (void)_notifyCurrentStateReliably:(BOOL)a3 completionHandler:(id)a4;
- (void)_notifyPairResult:(BOOL)a3 error:(id)a4 handler:(id)a5;
- (void)_sendResponse:(unsigned __int16)a3 toRequestID:(id)a4 data:(id)a5 error:(id *)a6;
- (void)_sendResultOfMessage:(unsigned __int16)a3 requestID:(id)a4 success:(BOOL)a5 error:(id)a6;
- (void)completeEnableOnlyRemoteUnlockWithPasscode:(id)a3 completionHandler:(id)a4;
- (void)didCompleteRequest:(id)a3;
- (void)didGetPasscodeState:(id)a3;
- (void)didUnlock:(id)a3;
- (void)disableOnlyRemoteUnlock:(id)a3;
- (void)disableOnlyRemoteUnlockWithCompletionHandler:(id)a3;
- (void)enableOnlyRemoteUnlockWithPasscode:(id)a3 completionHandler:(id)a4;
- (void)enableWristDetectBeforeEnableOnlyRemoteUnlockWithPasscode:(id)a3 completionHandler:(id)a4;
- (void)getPasscodeState:(id)a3;
- (void)notifyCurrentState;
- (void)notifyThisDeviceDidUnlock;
- (void)pairForUnlockWithPasscode:(id)a3 completionHandler:(id)a4;
- (void)queryRemoteDeviceState:(id)a3;
- (void)removeErrorHandlerForRequest:(id)a3;
- (void)removeLockout:(id)a3;
- (void)removeResponseHandlerForRequestMessageID:(id)a3;
- (void)requestDeviceSetWristDetectionDisabled:(BOOL)a3 completion:(id)a4;
- (void)requestRemoteDeviceDisableOnlyRemoteUnlock;
- (void)requestRemoteDeviceRemoteAction:(int64_t)a3 type:(int64_t)a4 completionHandler:(id)a5;
- (void)requestRemoteDeviceRemoveLockout:(id)a3;
- (void)requestRemoteDeviceUnlockNotification;
- (void)resetDeviceWristDetectionSetting:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setErrorHandler:(id)a3 forRequest:(id)a4;
- (void)setErrorHandlers:(id)a3;
- (void)setHandlerManagementQueue:(id)a3;
- (void)setKeyStore:(id)a3;
- (void)setPairedDeviceVersion:(unsigned int)a3;
- (void)setResponseHandler:(id)a3 forRequestMessageID:(id)a4;
- (void)setResponseHandlers:(id)a3;
- (void)setShouldNotifyNextUnlock:(id)a3;
- (void)setUnlockEnabled:(BOOL)a3;
- (void)startRemoteAction:(id)a3;
- (void)unpairForUnlockWithCompletionHandler:(id)a3;
@end

@implementation PUPeer

- (PUPeer)init
{
  v20.receiver = self;
  v20.super_class = (Class)PUPeer;
  v2 = [(PUPeer *)&v20 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.pairedunlock.handlermanagement", 0);
    handlerManagementQueue = v2->_handlerManagementQueue;
    v2->_handlerManagementQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    responseHandlers = v2->_responseHandlers;
    v2->_responseHandlers = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    errorHandlers = v2->_errorHandlers;
    v2->_errorHandlers = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.pairedunlock.ids", 0);
    idsQueue = v2->_idsQueue;
    v2->_idsQueue = (OS_dispatch_queue *)v9;

    v11 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.pairedunlock"];
    service = v2->_service;
    v2->_service = v11;

    v13 = [(IDSService *)v2->_service defaultPairedDevice];
    v14 = [v13 productVersion];
    v2->_pairedDeviceVersion = NRRawVersionFromString();
    v15 = pu_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = +[NSNumber numberWithUnsignedInt:v2->_pairedDeviceVersion];
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      __int16 v23 = 2114;
      v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "paired device version = %{public}@, %{public}@", buf, 0x16u);
    }
    [(IDSService *)v2->_service setProtobufAction:"didCompleteRequest:" forIncomingRequestsOfType:203];
    [(IDSService *)v2->_service setProtobufAction:"didCompleteRequest:" forIncomingResponsesOfType:203];
    [(IDSService *)v2->_service setProtobufAction:"getPasscodeState:" forIncomingRequestsOfType:201];
    [(IDSService *)v2->_service setProtobufAction:"didGetPasscodeState:" forIncomingRequestsOfType:202];
    [(IDSService *)v2->_service setProtobufAction:"didGetPasscodeState:" forIncomingResponsesOfType:202];
    [(IDSService *)v2->_service setProtobufAction:"didUnlock:" forIncomingRequestsOfType:200];
    [(IDSService *)v2->_service setProtobufAction:"startRemoteAction:" forIncomingRequestsOfType:100];
    [(IDSService *)v2->_service setProtobufAction:"disableOnlyRemoteUnlock:" forIncomingRequestsOfType:101];
    [(IDSService *)v2->_service setProtobufAction:"removeLockout:" forIncomingRequestsOfType:102];
    [(IDSService *)v2->_service setProtobufAction:"setShouldNotifyNextUnlock:" forIncomingRequestsOfType:1];
    [(IDSService *)v2->_service addDelegate:v2 queue:v2->_idsQueue];
    v17 = objc_alloc_init(PUKeyStore);
    keyStore = v2->_keyStore;
    v2->_keyStore = v17;

    v2->_unlockEnabled = 1;
  }
  return v2;
}

- (unsigned)pairedDeviceVersion
{
  return self->_pairedDeviceVersion;
}

- (void)setPairedDeviceVersion:(unsigned int)a3
{
  self->_pairedDeviceVersion = a3;
}

- (id)responseHandlerForRequestMessageID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100005730;
  v16 = sub_10000575C;
  id v17 = 0;
  handlerManagementQueue = self->_handlerManagementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005764;
  block[3] = &unk_1000185A8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(handlerManagementQueue, block);
  id v7 = objc_retainBlock((id)v13[5]);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setResponseHandler:(id)a3 forRequestMessageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerManagementQueue = self->_handlerManagementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000587C;
  block[3] = &unk_1000185D0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_sync(handlerManagementQueue, block);
}

- (void)removeResponseHandlerForRequestMessageID:(id)a3
{
  id v4 = a3;
  handlerManagementQueue = self->_handlerManagementQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005924;
  v7[3] = &unk_1000185F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(handlerManagementQueue, v7);
}

- (id)errorHandlerForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100005730;
  v16 = sub_10000575C;
  id v17 = 0;
  handlerManagementQueue = self->_handlerManagementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005A40;
  block[3] = &unk_1000185A8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(handlerManagementQueue, block);
  id v7 = objc_retainBlock((id)v13[5]);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setErrorHandler:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  handlerManagementQueue = self->_handlerManagementQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005B58;
  block[3] = &unk_100018620;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_sync(handlerManagementQueue, block);
}

- (void)removeErrorHandlerForRequest:(id)a3
{
  id v4 = a3;
  handlerManagementQueue = self->_handlerManagementQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005C48;
  v7[3] = &unk_1000185F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(handlerManagementQueue, v7);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7 = a5;
  id v8 = pu_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Incoming unhandled protobuf: <%@>", (uint8_t *)&v9, 0xCu);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  if (!a6)
  {
    id v12 = pu_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100010200();
    }

    uint64_t v13 = [(PUPeer *)self errorHandlerForRequest:v10];
    uint64_t v14 = (void *)v13;
    if (v13) {
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v11);
    }
  }
  [(PUPeer *)self removeErrorHandlerForRequest:v10];
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v4 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isDefaultPairedDevice]) {
          v7 |= [v10 isConnected];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  id v11 = pu_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    if (v7) {
      CFStringRef v12 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v18 = v12;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Connected devices changed, connected = %@, devices = %@", buf, 0x16u);
  }
}

- (void)_sendResultOfMessage:(unsigned __int16)a3 requestID:(id)a4 success:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a6;
  CFStringRef v12 = objc_alloc_init(PUProtoRequestCompleted);
  long long v13 = +[PUPasscodeState toProtobuf];
  [(PUProtoRequestCompleted *)v12 setPasscodeState:v13];

  [(PUProtoRequestCompleted *)v12 setMessageID:v8];
  [(PUProtoRequestCompleted *)v12 setSuccess:v7];
  if (v11)
  {
    id v14 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v14 encodeObject:v11 forKey:@"error"];
    long long v15 = [v14 encodedData];
    [(PUProtoRequestCompleted *)v12 setErrorData:v15];
  }
  long long v16 = pu_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v17)
    {
      CFStringRef v18 = @"NO";
      if (v7) {
        CFStringRef v18 = @"YES";
      }
      int v22 = 67109378;
      int v23 = v8;
      __int16 v24 = 2112;
      CFStringRef v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending result of message %i (%@) as RESPONSE", (uint8_t *)&v22, 0x12u);
    }

    __int16 v19 = [(PUProtoRequestCompleted *)v12 data];
    [(PUPeer *)self _sendResponse:203 toRequestID:v10 data:v19 error:0];
  }
  else
  {
    if (v17)
    {
      CFStringRef v20 = @"NO";
      if (v7) {
        CFStringRef v20 = @"YES";
      }
      int v22 = 67109378;
      int v23 = v8;
      __int16 v24 = 2112;
      CFStringRef v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending result of message %i (%@) as REQUEST", (uint8_t *)&v22, 0x12u);
    }

    __int16 v19 = [(PUProtoRequestCompleted *)v12 data];
    id v21 = [(PUPeer *)self _sendRequest:203 data:v19 reliably:0 expectResponse:0 handler:0 error:0];
  }
}

- (id)_sendRequest:(unsigned __int16)a3 data:(id)a4 reliably:(BOOL)a5 expectResponse:(BOOL)a6 handler:(id)a7 error:(id *)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v12 = a3;
  id v14 = a7;
  id v15 = a4;
  id v16 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v15 type:v12 isResponse:0];

  if (v14)
  {
    id v17 = [v14 copy];
    CFStringRef v18 = +[NSNumber numberWithUnsignedShort:v12];
    [(PUPeer *)self setResponseHandler:v17 forRequestMessageID:v18];
  }
  __int16 v19 = [(PUPeer *)self _sendProtobuf:v16 reliably:v10 expectsResponse:v9 responseIdentifier:0 error:a8];

  return v19;
}

- (void)_sendResponse:(unsigned __int16)a3 toRequestID:(id)a4 data:(id)a5 error:(id *)a6
{
  uint64_t v8 = a3;
  id v13 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v10 type:v8 isResponse:1];

  id v12 = [(PUPeer *)self _sendProtobuf:v11 reliably:0 expectsResponse:0 responseIdentifier:v13 error:a6];
}

- (id)_sendProtobuf:(id)a3 reliably:(BOOL)a4 expectsResponse:(BOOL)a5 responseIdentifier:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = +[NSMutableDictionary dictionary];
  id v15 = v14;
  if (v13) {
    [v14 setObject:v13 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
  }
  if (v9) {
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
  }
  if (!a4)
  {
    [v15 setObject:&off_1000191A0 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionLocalDeliveryKey];
  }
  service = self->_service;
  id v17 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v24 = 0;
  id v25 = 0;
  unsigned __int8 v18 = [(IDSService *)service sendProtobuf:v12 toDestinations:v17 priority:300 options:v15 identifier:&v25 error:&v24];
  id v19 = v25;
  id v20 = v24;

  if (a7) {
    *a7 = v20;
  }
  id v21 = pu_log();
  int v22 = v21;
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sent protobuf SUCCEEDED: <%@> with ID: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    sub_10001027C();
  }

  return v19;
}

- (void)didCompleteRequest:(id)a3
{
  id v4 = a3;
  id v5 = [PUProtoRequestCompleted alloc];
  id v6 = [v4 data];
  BOOL v7 = [(PUProtoRequestCompleted *)v5 initWithData:v6];

  uint64_t v8 = pu_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v4 context];
    id v10 = [v9 outgoingResponseIdentifier];
    int v22 = 138412546;
    id v23 = v4;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received protobuf: <%@> with identifier: %@", (uint8_t *)&v22, 0x16u);
  }
  id v11 = [(PUProtoRequestCompleted *)v7 errorData];

  if (v11)
  {
    id v12 = objc_alloc((Class)NSKeyedUnarchiver);
    id v13 = [(PUProtoRequestCompleted *)v7 errorData];
    id v14 = [v12 initForReadingFromData:v13 error:0];

    id v11 = [v14 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v11 = 0;
    }
  }
  uint64_t v15 = (unsigned __int16)[(PUProtoRequestCompleted *)v7 messageID];
  if (v15 == 100)
  {
    id v16 = +[NSNumber numberWithUnsignedShort:v15];
    id v17 = [(PUPeer *)self responseHandlerForRequestMessageID:v16];

    unsigned __int8 v18 = pu_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        int v22 = 67109120;
        LODWORD(v23) = 100;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling response handler for message of type %i", (uint8_t *)&v22, 8u);
      }

      id v20 = [(PUProtoRequestCompleted *)v7 passcodeState];
      unsigned __int8 v18 = [(PUPeer *)self _convertRemotePasscodeStateToRemoteDeviceState:v20];

      ((void (**)(void, NSObject *, void *))v17)[2](v17, v18, v11);
    }
    else if (v19)
    {
      int v22 = 67109120;
      LODWORD(v23) = 100;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Missing handler for message of type %i!", (uint8_t *)&v22, 8u);
    }
  }
  id v21 = +[NSNumber numberWithUnsignedShort:v15];
  [(PUPeer *)self removeResponseHandlerForRequestMessageID:v21];
}

- (void)pairForUnlockWithPasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[PUPasscodeState isLocked])
  {
    uint64_t v8 = pu_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000102E4();
    }
    uint64_t v9 = 2;
LABEL_12:

    uint64_t v15 = +[NSError errorWithDomain:@"com.apple.paired-unlock" code:v9 userInfo:0];
    if (v15)
    {
      id v16 = (void *)v15;
      [(PUPeer *)self _notifyPairResult:0 error:v15 handler:v7];
    }
    goto LABEL_14;
  }
  id v10 = +[MCProfileConnection sharedConnection];
  unsigned int v11 = [v10 unlockDeviceWithPasscode:v6 outError:0];

  id v12 = pu_log();
  uint64_t v8 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100010318();
    }
    uint64_t v9 = 1;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting unlock pair", buf, 2u);
  }

  id v13 = +[SFUnlockManager sharedUnlockManager];
  uint64_t v14 = IDSDefaultPairedDevice;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100006ABC;
  v17[3] = &unk_100018648;
  v17[4] = self;
  id v18 = v7;
  [v13 enableUnlockWithDevice:v14 fromKey:0 withPasscode:v6 completionHandler:v17];

LABEL_14:
}

- (void)requestRemoteDeviceRemoteAction:(int64_t)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_alloc_init(PUProtoStartRemoteAction);
  [(PUProtoStartRemoteAction *)v9 setActionID:a3];
  [(PUProtoStartRemoteAction *)v9 setPasscodeType:a4];
  id v10 = [(PUProtoStartRemoteAction *)v9 data];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006BD8;
  v13[3] = &unk_100018670;
  id v14 = v8;
  id v11 = v8;
  id v12 = [(PUPeer *)self _sendRequest:100 data:v10 reliably:0 expectResponse:1 handler:v13 error:0];
}

- (void)requestRemoteDeviceUnlockNotification
{
  id v5 = objc_alloc_init(PUProtoSetShouldNotifyNextUnlock);
  [(PUProtoSetShouldNotifyNextUnlock *)v5 setShouldNotify:1];
  dispatch_queue_t v3 = [(PUProtoSetShouldNotifyNextUnlock *)v5 data];
  id v4 = [(PUPeer *)self _sendRequest:1 data:v3 reliably:1 expectResponse:0 handler:&stru_1000186B0 error:0];
}

- (void)requestRemoteDeviceDisableOnlyRemoteUnlock
{
  id v5 = objc_alloc_init(PUProtoRequestDisableOnlyRemoteUnlock);
  dispatch_queue_t v3 = [(PUProtoRequestDisableOnlyRemoteUnlock *)v5 data];
  id v4 = [(PUPeer *)self _sendRequest:101 data:v3 reliably:1 expectResponse:0 handler:&stru_1000186D0 error:0];
}

- (void)requestRemoteDeviceRemoveLockout:(id)a3
{
  id v7 = a3;
  id v4 = objc_alloc_init(PUProtoRemoveLockout);
  id v5 = [(PUProtoRemoveLockout *)v4 data];
  id v6 = [(PUPeer *)self _sendRequest:102 data:v5 reliably:1 expectResponse:1 handler:v7 error:0];
}

- (void)unpairForUnlockWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v3 = +[SFUnlockManager sharedUnlockManager];
  [v3 disableUnlockWithDevice:IDSDefaultPairedDevice];

  (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
}

- (void)queryRemoteDeviceState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  [(PUPeer *)self setResponseHandler:v5 forRequestMessageID:&off_1000191B8];

  id v6 = objc_alloc_init(PUProtoGetPasscodeState);
  id v7 = [(PUProtoGetPasscodeState *)v6 data];
  id v14 = 0;
  id v8 = [(PUPeer *)self _sendRequest:201 data:v7 reliably:0 expectResponse:1 handler:0 error:&v14];
  id v9 = v14;

  if (v9)
  {
    [(PUPeer *)self removeResponseHandlerForRequestMessageID:&off_1000191B8];
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v9);
  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000071EC;
    v10[3] = &unk_1000186F8;
    objc_copyWeak(&v12, &location);
    id v11 = &off_1000191B8;
    [(PUPeer *)self setErrorHandler:v10 forRequest:v8];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)requestDeviceSetWristDetectionDisabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007330;
  v6[3] = &unk_100018720;
  BOOL v8 = a3;
  id v7 = a4;
  id v5 = v7;
  +[PUPasscodeState setWristDetectionDisabled:v4 completion:v6];
}

- (void)resetDeviceWristDetectionSetting:(id)a3
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007608;
  v11[3] = &unk_100018748;
  id v3 = a3;
  id v12 = v3;
  BOOL v4 = objc_retainBlock(v11);
  BOOL v5 = +[PUPasscodeState wristDetectDisabledPreference];
  unsigned int v6 = +[PUPasscodeState isWristDetectionDisabled];
  id v7 = pu_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5 == v6)
  {
    if (v8)
    {
      id v10 = +[NSNumber numberWithBool:v5];
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "wristDetectDisabled preference has not changed = %@", buf, 0xCu);
    }
    ((void (*)(void *, void))v4[2])(v4, 0);
  }
  else
  {
    if (v8)
    {
      id v9 = +[NSNumber numberWithBool:v5];
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "wristDetectDisabled preference has changed to = %@", buf, 0xCu);
    }
    +[PUPasscodeState setWristDetectionDisabled:v5 completion:v4];
  }
}

- (void)notifyCurrentState
{
}

- (id)_createAndStoreNewPasscodeWithCurrentPasscode:(id)a3
{
  id v4 = a3;
  BOOL v5 = malloc_type_malloc(0x40uLL, 0x100004077774924uLL);
  if (SecRandomCopyBytes(0, 0x40uLL, v5))
  {
    unsigned int v6 = pu_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000103E8();
    }
    goto LABEL_17;
  }
  unsigned int v6 = +[NSData dataWithBytesNoCopy:v5 length:64];
  id v7 = [(PUPeer *)self _passcodeStringFromPasscodeData:v6];
  BOOL v8 = pu_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 length]);
    int v20 = 138412290;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Generated random passcode of length %@.", (uint8_t *)&v20, 0xCu);
  }
  id v10 = +[MCProfileConnection sharedConnection];
  unsigned int v11 = [v10 changePasscodeFrom:v4 to:v7 outError:0];

  id v12 = pu_log();
  id v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000103B4();
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Successfully changed to random passcode; storing",
      (uint8_t *)&v20,
      2u);
  }

  unsigned int v14 = [(PUKeyStore *)self->_keyStore storePasscodeBlob:v6 withLabel:@"passcode"];
  uint64_t v15 = pu_log();
  id v16 = v15;
  if (!v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100010380();
    }

    id v18 = +[MCProfileConnection sharedConnection];
    unsigned __int8 v19 = [v18 changePasscodeFrom:v7 to:v4 outError:0];

    if (v19) {
      goto LABEL_16;
    }
    id v13 = pu_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001034C();
    }
LABEL_15:

LABEL_16:
LABEL_17:
    id v7 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Successfully stored random passcode", (uint8_t *)&v20, 2u);
  }

LABEL_18:
  return v7;
}

- (void)completeEnableOnlyRemoteUnlockWithPasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100007B78;
  v25[3] = &unk_1000187B0;
  v25[4] = self;
  id v7 = a4;
  id v26 = v7;
  BOOL v8 = objc_retainBlock(v25);
  id v9 = v6;
  id v10 = v9;
  if (v9 && [v9 length])
  {
    char v11 = 0;
    id v12 = v10;
  }
  else
  {
    id v13 = pu_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "replacing empty passcode", buf, 2u);
    }

    id v12 = [(PUPeer *)self _createAndStoreNewPasscodeWithCurrentPasscode:v10];

    if (!v12)
    {
      id v16 = +[NSError errorWithDomain:@"com.apple.paired-unlock" code:0 userInfo:0];
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v16);
      goto LABEL_10;
    }
    char v11 = 1;
  }
  unsigned int v14 = +[SFUnlockManager sharedUnlockManager];
  uint64_t v15 = IDSDefaultPairedDevice;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100007D74;
  v17[3] = &unk_100018800;
  char v23 = v11;
  id v21 = v8;
  id v18 = v10;
  id v19 = v12;
  int v20 = self;
  id v22 = v7;
  id v16 = v12;
  [v14 enableUnlockWithDevice:v15 fromKey:0 withPasscode:v16 completionHandler:v17];

LABEL_10:
}

- (void)enableWristDetectBeforeEnableOnlyRemoteUnlockWithPasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[PUPasscodeState isWristDetectionDisabled])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000827C;
    v10[3] = &unk_100018828;
    id v12 = v7;
    void v10[4] = self;
    id v11 = v6;
    +[PUPasscodeState setWristDetectionDisabled:0 completion:v10];
  }
  else
  {
    BOOL v8 = pu_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "wrist detection already enabled", v9, 2u);
    }

    [(PUPeer *)self completeEnableOnlyRemoteUnlockWithPasscode:v6 completionHandler:v7];
  }
}

- (void)enableOnlyRemoteUnlockWithPasscode:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (+[PUPasscodeState isLocked])
  {
    id v7 = +[NSError errorWithDomain:@"com.apple.paired-unlock" code:2 userInfo:0];
    v6[2](v6, 0, v7);
    goto LABEL_9;
  }
  id v7 = +[MCProfileConnection sharedConnection];
  if ([v7 isPasscodeModificationAllowed])
  {
    if ([v7 unlockDeviceWithPasscode:v10 outError:0])
    {
      [(PUPeer *)self enableWristDetectBeforeEnableOnlyRemoteUnlockWithPasscode:v10 completionHandler:v6];
      goto LABEL_9;
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 4;
  }
  id v9 = +[NSError errorWithDomain:@"com.apple.paired-unlock" code:v8 userInfo:0];
  v6[2](v6, 0, v9);

LABEL_9:
}

- (id)_passcodeStringFromPasscodeData:(id)a3
{
  id v3 = [a3 base64EncodedStringWithOptions:0];
  id v4 = +[NSString stringWithFormat:@"c5l_%@", v3];

  return v4;
}

- (id)_retrieveUnlockOnlyPasscode
{
  id v3 = [(PUKeyStore *)self->_keyStore getPasscodeBlobWithLabel:@"passcode"];
  if (v3)
  {
    id v4 = [(PUPeer *)self _passcodeStringFromPasscodeData:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_notifyCurrentStateReliably:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[PUPasscodeState toProtobuf];
  uint64_t v8 = [v7 data];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008668;
  v11[3] = &unk_100018670;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PUPeer *)self _sendRequest:202 data:v8 reliably:v4 expectResponse:0 handler:v11 error:0];
}

- (void)disableOnlyRemoteUnlockWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  if (+[PUPasscodeState isLocked])
  {
    uint64_t v5 = 2;
LABEL_8:
    uint64_t v8 = +[NSError errorWithDomain:@"com.apple.paired-unlock" code:v5 userInfo:0];
    v4[2](v4, 0, v8);
    goto LABEL_16;
  }
  id v6 = +[MCProfileConnection sharedConnection];
  unsigned int v7 = [v6 isPasscodeModificationAllowed];

  if (!v7)
  {
    uint64_t v5 = 4;
    goto LABEL_8;
  }
  uint64_t v8 = [(PUPeer *)self _retrieveUnlockOnlyPasscode];
  if (v8)
  {
    id v9 = +[MCProfileConnection sharedConnection];
    id v16 = 0;
    unsigned int v10 = [v9 changePasscodeFrom:v8 to:&stru_100018D98 outError:&v16];
    id v11 = v16;

    if (v10)
    {
      [(PUKeyStore *)self->_keyStore deletePasscodeBlobWithLabel:@"passcode"];
      id v12 = +[SFUnlockManager sharedUnlockManager];
      [v12 disableUnlockWithDevice:IDSDefaultPairedDevice];

      [(PUPeer *)self _notifyCurrentStateReliably:1 completionHandler:&stru_100018848];
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v15 = pu_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000105BC();
      }

      uint64_t v13 = (uint64_t)v11;
    }
  }
  else
  {
    unsigned int v14 = pu_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100010588();
    }

    uint64_t v13 = +[NSError errorWithDomain:@"com.apple.paired-unlock" code:0 userInfo:0];
    id v11 = (id)v13;
  }
  v4[2](v4, 0, (void *)v13);

LABEL_16:
}

- (void)notifyThisDeviceDidUnlock
{
  uint64_t v5 = objc_alloc_init(PUProtoDidUnlock);
  id v3 = [(PUProtoDidUnlock *)v5 data];
  id v4 = [(PUPeer *)self _sendRequest:200 data:v3 reliably:0 expectResponse:0 handler:0 error:0];
}

- (void)_logProtobuf:(id)a3
{
  id v3 = a3;
  id v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 context];
    id v6 = [v5 outgoingResponseIdentifier];
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    unsigned int v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received protobuf: <%@> with identifier: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_logResponse:(id)a3
{
  id v3 = a3;
  id v4 = pu_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending repsonse protobuf: <%@>", (uint8_t *)&v5, 0xCu);
  }
}

- (void)startRemoteAction:(id)a3
{
  id v4 = a3;
  [(PUPeer *)self _logProtobuf:v4];
  int v5 = [v4 context];
  id v6 = [v5 outgoingResponseIdentifier];

  if (+[PUPasscodeState isLocked])
  {
    int v7 = +[NSError errorWithDomain:@"com.apple.paired-unlock" code:2 userInfo:0];
    [(PUPeer *)self _sendResultOfMessage:100 requestID:v6 success:0 error:v7];

    goto LABEL_40;
  }
  id v8 = [PUProtoStartRemoteAction alloc];
  __int16 v9 = [v4 data];
  unsigned int v10 = [(PUProtoStartRemoteAction *)v8 initWithData:v9];

  objc_initWeak(&location, self);
  unsigned int v11 = [(PUProtoStartRemoteAction *)v10 actionID];
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 1;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000092C8;
  v56[3] = &unk_100018898;
  v59 = &v61;
  id v12 = v10;
  v57 = v12;
  objc_copyWeak(v60, &location);
  id v58 = v6;
  uint64_t v35 = v11;
  v60[1] = (id)v11;
  uint64_t v13 = objc_retainBlock(v56);
  unsigned int v14 = (void (**)(void, void, void))v13;
  switch(v11)
  {
    case 4u:
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100009690;
      v46[3] = &unk_1000188E8;
      uint64_t v15 = v12;
      v47 = v15;
      v48 = self;
      uint64_t v51 = 4;
      id v49 = 0;
      v50 = v14;
      id v16 = objc_retainBlock(v46);
      id v17 = pu_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "unlock pairing requested %@", (uint8_t *)&buf, 0xCu);
      }

      if (!+[PUPasscodeState isWristDetectionDisabled]
        || !+[PUPasscodeState hasSEP])
      {
        id v18 = pu_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "wrist detection enabled prior to unlock pairing or device without SEP", (uint8_t *)&buf, 2u);
        }
      }
      ((void (*)(void *, void))v16[2])(v16, 0);
      *((unsigned char *)v62 + 24) = 0;

      break;
    case 5u:
      if (+[PUPasscodeState hasSEP])
      {
        id v19 = pu_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "on new hardware, not putting up passcode screen for disabling the wrist detect", (uint8_t *)&buf, 2u);
        }

        *((unsigned char *)v62 + 24) = 0;
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1000095F8;
        v52[3] = &unk_100018748;
        v53 = v14;
        +[PUPasscodeState setWristDetectionDisabled:1 completion:v52];
      }
      else
      {
        *((unsigned char *)v62 + 24) = 1;
      }
      break;
    case 6u:
      *((unsigned char *)v62 + 24) = 0;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100009560;
      v54[3] = &unk_100018748;
      v55 = v13;
      +[PUPasscodeState setWristDetectionDisabled:0 completion:v54];

      break;
  }
  if (!*((unsigned char *)v62 + 24) || !+[PUPasscodeState isUnlockOnly]) {
    goto LABEL_34;
  }
  int v20 = +[MCProfileConnection sharedConnection];
  unsigned int v21 = [v20 isPasscodeModificationAllowed];

  if (!v21)
  {
    char v23 = +[NSError errorWithDomain:@"com.apple.paired-unlock" code:4 userInfo:0];
    ((void (**)(void, void, NSObject *))v14)[2](v14, 0, v23);
    goto LABEL_33;
  }
  if (v11 != 2)
  {
    if (v11 != 3)
    {
LABEL_34:
      v33 = 0;
      goto LABEL_35;
    }
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v67 = 0x3032000000;
    v68 = sub_100009A3C;
    v69 = sub_100009A4C;
    id v70 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_100009A3C;
    v44 = sub_100009A4C;
    id v45 = 0;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100009A54;
    v36[3] = &unk_100018910;
    p_long long buf = &buf;
    v39 = &v40;
    char v23 = v22;
    v37 = v23;
    [(PUPeer *)self disableOnlyRemoteUnlockWithCompletionHandler:v36];
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      __int16 v24 = pu_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100010658((uint64_t)&buf + 8, v24, v25, v26, v27, v28, v29, v30);
      }

      v31 = v41;
      uint64_t v32 = *(void *)(*((void *)&buf + 1) + 40);
    }
    else
    {
      uint64_t v32 = 0;
      v31 = v41;
    }
    v14[2](v14, v31[5], v32);

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&buf, 8);

LABEL_33:
    goto LABEL_34;
  }
  v33 = [(PUPeer *)self _retrieveUnlockOnlyPasscode];
LABEL_35:
  if (*((unsigned char *)v62 + 24))
  {
    v34 = pu_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "putting up passcode screen", (uint8_t *)&buf, 2u);
    }

    [(PUPeerDelegate *)self->_delegate peer:self remoteDeviceRequestsRemoteAction:v35 type:[(PUProtoStartRemoteAction *)v12 passcodeType] existingPasscode:v33 completionHandler:v14];
  }

  objc_destroyWeak(v60);
  _Block_object_dispose(&v61, 8);

  objc_destroyWeak(&location);
LABEL_40:
}

- (void)disableOnlyRemoteUnlock:(id)a3
{
  [(PUPeer *)self _logProtobuf:a3];
  unsigned __int8 v4 = +[PUPasscodeState isLocked];
  int v5 = pu_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got request to disable only remote unlock; currently locked, so waiting until next unlock to do so",
        v7,
        2u);
    }

    CFPreferencesSetAppValue(@"ShouldDisableOnlyRemoteUnlock", kCFBooleanTrue, @"com.apple.paired-unlock");
  }
  else
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got request to disable only remote unlock; currently unlocked, so starting that now",
        buf,
        2u);
    }

    [(PUPeer *)self disableOnlyRemoteUnlockWithCompletionHandler:&stru_100018930];
  }
}

- (void)removeLockout:(id)a3
{
  id v4 = a3;
  [(PUPeer *)self _logProtobuf:v4];
  int v5 = +[NSFileManager defaultManager];
  [v5 removeItemAtPath:@"/var/mobile/Library/Carousel/LockoutStateJournal.plist" error:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kPUDidRemoveLockoutNotification, 0, 0, 1u);
  id v8 = [v4 context];

  int v7 = [v8 outgoingResponseIdentifier];
  [(PUPeer *)self _sendResultOfMessage:102 requestID:v7 success:1 error:0];
}

- (void)didUnlock:(id)a3
{
  [(PUPeer *)self _logProtobuf:a3];
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(PUPeerDelegate *)delegate peerRemoteDeviceDidUnlock:self];
  }
}

- (void)setShouldNotifyNextUnlock:(id)a3
{
  id v4 = a3;
  [(PUPeer *)self _logProtobuf:v4];
  int v5 = [PUProtoSetShouldNotifyNextUnlock alloc];
  BOOL v6 = [v4 data];

  int v7 = [(PUProtoSetShouldNotifyNextUnlock *)v5 initWithData:v6];
  [(PUPeerDelegate *)self->_delegate peer:self wantsNotificationOfNextUnlock:[(PUProtoSetShouldNotifyNextUnlock *)v7 shouldNotify]];
}

- (id)_convertToRemoteDeviceState:(id)a3
{
  id v4 = a3;
  int v5 = [PUProtoPasscodeState alloc];
  BOOL v6 = [v4 data];

  int v7 = [(PUProtoPasscodeState *)v5 initWithData:v6];
  id v8 = [(PUPeer *)self _convertRemotePasscodeStateToRemoteDeviceState:v7];

  return v8;
}

- (id)_convertRemotePasscodeStateToRemoteDeviceState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)PURemoteDeviceState);
    [v5 setVersion:self->_pairedDeviceVersion];
    objc_msgSend(v5, "setPasscodeSet:", objc_msgSend(v4, "hasPasscode"));
    objc_msgSend(v5, "setPasscodeLocked:", objc_msgSend(v4, "isLocked"));
    objc_msgSend(v5, "setUnlockOnly:", objc_msgSend(v4, "isUnlockOnly"));
    if ([v4 hasPolicy])
    {
      BOOL v6 = [v4 policy];
      id v7 = objc_alloc_init((Class)PURemotePasscodePolicy);
      objc_msgSend(v7, "setModificationAllowed:", objc_msgSend(v6, "modificationAllowed"));
      objc_msgSend(v7, "setPasscodeMinimumLength:", objc_msgSend(v6, "minimumLength"));
      [v5 setPasscodePolicy:v7];
    }
    if ([v4 hasIsWristDetectionEnabled])
    {
      objc_msgSend(v5, "setWristDetectEnabled:", objc_msgSend(v4, "isWristDetectionEnabled"));
    }
    else
    {
      [v5 version];
      if (NRVersionIsGreaterThanOrEqual())
      {
        id v8 = pu_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000107F0();
        }
      }
      else
      {
        id v8 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel"];
        objc_msgSend(v5, "setWristDetectEnabled:", -[NSObject BOOLForKey:](v8, "BOOLForKey:", @"DisableWristDetection") ^ 1);
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)didGetPasscodeState:(id)a3
{
  id v11 = a3;
  [(PUPeer *)self _logProtobuf:v11];
  id v4 = [(PUPeer *)self _convertToRemoteDeviceState:v11];
  uint64_t v5 = [(PUPeer *)self responseHandlerForRequestMessageID:&off_1000191B8];
  BOOL v6 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0);
    [(PUPeer *)self removeResponseHandlerForRequestMessageID:&off_1000191B8];
  }
  id v7 = [v11 context];
  id v8 = [v7 incomingResponseIdentifier];

  if (!v8) {
    [(PUPeerDelegate *)self->_delegate peer:self didNotifyRemoteState:v4 error:0];
  }
  unsigned int v9 = [v4 isUnlockOnly];
  unsigned int v10 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v9) {
    unsigned int v10 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"IsUnlockOnly", *v10, @"com.apple.paired-unlock");
}

- (void)getPasscodeState:(id)a3
{
  id v4 = a3;
  [(PUPeer *)self _logProtobuf:v4];
  id v8 = +[PUPasscodeState toProtobuf];
  +[PUConnection syncPasscodeState];
  [(PUPeer *)self _logResponse:v8];
  uint64_t v5 = [v4 context];

  BOOL v6 = [v5 outgoingResponseIdentifier];
  id v7 = [v8 data];
  [(PUPeer *)self _sendResponse:202 toRequestID:v6 data:v7 error:0];
}

- (void)_notifyPairResult:(BOOL)a3 error:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  unsigned int v9 = (void (**)(id, void, id))a5;
  unsigned int v10 = pu_log();
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "successfully paired for unlocking", v12, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_100010824();
  }

  if (objc_opt_respondsToSelector()) {
    [(PUPeerDelegate *)self->_delegate peer:self didPairForUnlock:v6 error:v8];
  }
  if (v9) {
    v9[2](v9, 0, v8);
  }
}

- (PUPeerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PUPeerDelegate *)a3;
}

- (BOOL)isUnlockEnabled
{
  return self->_unlockEnabled;
}

- (void)setUnlockEnabled:(BOOL)a3
{
  self->_unlockEnabled = a3;
}

- (PUKeyStore)keyStore
{
  return self->_keyStore;
}

- (void)setKeyStore:(id)a3
{
}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
}

- (NSMutableDictionary)errorHandlers
{
  return self->_errorHandlers;
}

- (void)setErrorHandlers:(id)a3
{
}

- (OS_dispatch_queue)handlerManagementQueue
{
  return self->_handlerManagementQueue;
}

- (void)setHandlerManagementQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerManagementQueue, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end