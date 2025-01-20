@interface NMRIDSMessageCenter
- (BOOL)_sendMessageWithProtobufData:(id)a3 messageType:(unsigned __int16)a4 priority:(unint64_t)a5 timeout:(double)a6 bypassDuet:(BOOL)a7 skipStorage:(BOOL)a8 isResponse:(BOOL)a9 additionalOptions:(id)a10 resultingMessageIdentifier:(id *)a11 error:(id *)a12;
- (BOOL)sendMessageWithProtobufData:(id)a3 messageType:(unsigned __int16)a4 priority:(unint64_t)a5 timeout:(double)a6 bypassDuet:(BOOL)a7 skipStorage:(BOOL)a8 expectReply:(BOOL)a9 queueOneIdentifier:(id)a10 resultingMessageIdentifier:(id *)a11 error:(id *)a12;
- (BOOL)sendMessageWithProtobufData:(id)a3 messageType:(unsigned __int16)a4 priority:(unint64_t)a5 timeout:(double)a6 bypassDuet:(BOOL)a7 skipStorage:(BOOL)a8 inReplyTo:(id)a9 resultingMessageIdentifier:(id *)a10 error:(id *)a11;
- (NMRIDSMessageCenterDelegate)delegate;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setMessageHandlerTarget:(id)a3 action:(SEL)a4 forIncomingMessagesOfType:(unsigned __int16)a5;
- (void)startHandlingMessages;
@end

@implementation NMRIDSMessageCenter

- (void)setMessageHandlerTarget:(id)a3 action:(SEL)a4 forIncomingMessagesOfType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v13 = a3;
  if (!self->_messageHandlers)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    messageHandlers = self->_messageHandlers;
    self->_messageHandlers = v8;
  }
  v10 = objc_opt_new();
  [v10 setTarget:v13];
  [v10 setAction:a4];
  [v10 setMessageType:v5];
  v11 = self->_messageHandlers;
  v12 = +[NSNumber numberWithUnsignedShort:v5];
  [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];
}

- (void)startHandlingMessages
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 bundleIdentifier];
  uint64_t v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = +[NSString stringWithFormat:@"%@.%@.idsQueue", v4, v6];
  v8 = (const char *)[v7 UTF8String];

  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
  v10 = (OS_dispatch_queue *)dispatch_queue_create(v8, v9);
  idsQueue = self->_idsQueue;
  self->_idsQueue = v10;

  v12 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.mediaremote"];
  idsService = self->_idsService;
  self->_idsService = v12;

  [(IDSService *)self->_idsService addDelegate:self queue:self->_idsQueue];
}

- (BOOL)sendMessageWithProtobufData:(id)a3 messageType:(unsigned __int16)a4 priority:(unint64_t)a5 timeout:(double)a6 bypassDuet:(BOOL)a7 skipStorage:(BOOL)a8 expectReply:(BOOL)a9 queueOneIdentifier:(id)a10 resultingMessageIdentifier:(id *)a11 error:(id *)a12
{
  BOOL v12 = a9;
  BOOL v13 = a8;
  BOOL v14 = a7;
  uint64_t v17 = a4;
  id v19 = a3;
  id v20 = a10;
  v21 = objc_opt_new();
  v22 = v21;
  if (v12) {
    [v21 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
  }
  if ([v20 length]) {
    [v22 setObject:v20 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
  }
  BOOL v23 = [(NMRIDSMessageCenter *)self _sendMessageWithProtobufData:v19 messageType:v17 priority:a5 timeout:v14 bypassDuet:v13 skipStorage:0 isResponse:a6 additionalOptions:v22 resultingMessageIdentifier:a11 error:a12];

  return v23;
}

- (BOOL)sendMessageWithProtobufData:(id)a3 messageType:(unsigned __int16)a4 priority:(unint64_t)a5 timeout:(double)a6 bypassDuet:(BOOL)a7 skipStorage:(BOOL)a8 inReplyTo:(id)a9 resultingMessageIdentifier:(id *)a10 error:(id *)a11
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  uint64_t v16 = a4;
  id v18 = a3;
  if (a9)
  {
    uint64_t v28 = IDSSendMessageOptionPeerResponseIdentifierKey;
    [a9 context];
    v27 = self;
    uint64_t v19 = v16;
    unint64_t v20 = a5;
    BOOL v21 = v13;
    BOOL v23 = v22 = v12;
    v24 = [v23 outgoingResponseIdentifier];
    v29 = v24;
    a9 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];

    BOOL v12 = v22;
    BOOL v13 = v21;
    a5 = v20;
    uint64_t v16 = v19;
    self = v27;
  }
  BOOL v25 = [(NMRIDSMessageCenter *)self _sendMessageWithProtobufData:v18 messageType:v16 priority:a5 timeout:v13 bypassDuet:v12 skipStorage:1 isResponse:a6 additionalOptions:a9 resultingMessageIdentifier:a10 error:a11];

  return v25;
}

- (BOOL)_sendMessageWithProtobufData:(id)a3 messageType:(unsigned __int16)a4 priority:(unint64_t)a5 timeout:(double)a6 bypassDuet:(BOOL)a7 skipStorage:(BOOL)a8 isResponse:(BOOL)a9 additionalOptions:(id)a10 resultingMessageIdentifier:(id *)a11 error:(id *)a12
{
  BOOL v12 = a9;
  BOOL v13 = a8;
  BOOL v14 = a7;
  uint64_t v17 = a4;
  id v19 = a3;
  id v20 = a10;
  if (!v19)
  {
    id v19 = +[NSData data];
  }
  id v46 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v19 type:v17 isResponse:v12];
  id v21 = [v20 mutableCopy];
  BOOL v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_opt_new();
  }
  v24 = v23;

  double v25 = IDSMaxMessageTimeout;
  if (IDSMaxMessageTimeout > a6) {
    double v25 = a6;
  }
  v26 = +[NSNumber numberWithDouble:v25];
  [v24 setObject:v26 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

  [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
  v27 = +[NSNumber numberWithBool:v14];
  [v24 setObject:v27 forKeyedSubscript:IDSSendMessageOptionBypassDuetKey];

  uint64_t v28 = +[NSNumber numberWithBool:v13];
  [v24 setObject:v28 forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];

  [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionForceLocalDeliveryKey];
  if (v17 > 0x13 || ((1 << v17) & 0xD50AE) == 0) {
    [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionNonWakingKey];
  }
  idsService = self->_idsService;
  v30 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  v45 = v19;
  if (a5 > 4) {
    uint64_t v31 = 300;
  }
  else {
    uint64_t v31 = qword_100041898[a5];
  }
  id v47 = 0;
  id v48 = 0;
  unsigned int v32 = [(IDSService *)idsService sendProtobuf:v46 toDestinations:v30 priority:v31 options:v24 identifier:&v48 error:&v47];
  id v33 = v48;
  id v34 = v47;

  v35 = sub_10002BF10(v17);
  v36 = [v20 objectForKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
  v37 = @"NO";
  if (v14) {
    v38 = @"YES";
  }
  else {
    v38 = @"NO";
  }
  if (v13) {
    v37 = @"YES";
  }
  v39 = v37;
  v40 = v38;
  v41 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ID: %@, QueueOne: %@, BypassDuet: %@, FireAndForget: %@, ForceLocal: YES, %lu byte payload", v33, v36, v40, v39, [v45 length]);

  v42 = sub_10002C428(2);
  v43 = v42;
  if (v32)
  {
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v35;
      __int16 v51 = 2112;
      v52 = v41;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Successfully requested delivery of %@ message (%@).", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v50 = v35;
    __int16 v51 = 2112;
    v52 = v41;
    __int16 v53 = 2112;
    id v54 = v34;
    _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to request delivery of %@ message (%@) with error \"%@\".", buf, 0x20u);
  }

  if (a11) {
    *a11 = v33;
  }
  if (a12) {
    *a12 = v34;
  }

  return v32;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a7;
  id v11 = [v9 type];
  unsigned int v12 = v11;
  messageHandlers = self->_messageHandlers;
  BOOL v14 = +[NSNumber numberWithUnsignedShort:v11];
  v15 = [(NSMutableDictionary *)messageHandlers objectForKeyedSubscript:v14];

  uint64_t v16 = sub_10002BF10(v12);
  uint64_t v17 = sub_10002C428(2);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v15) {
      CFStringRef v18 = @"a";
    }
    else {
      CFStringRef v18 = @"an UNHANDLED";
    }
    id v19 = [v10 outgoingResponseIdentifier];
    id v20 = [v9 data];
    int v24 = 138413058;
    CFStringRef v25 = v18;
    __int16 v26 = 2112;
    v27 = v16;
    __int16 v28 = 2112;
    v29 = v19;
    __int16 v30 = 2048;
    id v31 = [v20 length];
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received %@ %@ message (ID: %@, %lu byte payload).", (uint8_t *)&v24, 0x2Au);
  }
  if (v15)
  {
    id v21 = [v15 target];
    id v22 = [v15 action];
    id v23 = (void (*)(void *, id, id))[v21 methodForSelector:v22];
    if (v23) {
      v23(v21, v22, v9);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = sub_10002C428(2);
  uint64_t v17 = v16;
  if (v8)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully sent message (ID: %@).", (uint8_t *)&v21, 0xCu);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    sub_100031728((uint64_t)v14, (uint64_t)v15, v17);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    [v20 messageCenter:self messageWithIdentifier:v14 didSendWithSuccess:v8 error:v15];
  }
}

- (NMRIDSMessageCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NMRIDSMessageCenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_idsService, 0);

  objc_storeStrong((id *)&self->_idsQueue, 0);
}

@end