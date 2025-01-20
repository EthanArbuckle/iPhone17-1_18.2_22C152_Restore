@interface SUBMessageEndpoint
+ (id)sharedEndpoint;
- (BOOL)isConnected;
- (IDSService)cloudService;
- (IDSService)service;
- (NSMutableArray)queuedDisconnectionBlock;
- (NSMutableDictionary)messageHandlers;
- (NSMutableDictionary)pendingMessageCompletions;
- (NSMutableDictionary)pendingMessageReplies;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)sendMessageQueue;
- (SUBMessageEndpoint)init;
- (id)SUBDefaultPairedDevice;
- (id)_sendCloudMessage:(id)a3 replyingTo:(id)a4 expectingResponse:(BOOL)a5 useTimeout:(id)a6 isCritical:(BOOL)a7 error:(id *)a8 destinations:(id)a9;
- (id)_sendMessage:(id)a3 replyingTo:(id)a4 expectingResponse:(BOOL)a5 useTimeout:(id)a6 isCritical:(BOOL)a7 error:(id *)a8;
- (id)dataCompress:(id)a3 shouldCompress:(BOOL)a4;
- (id)getMessageTimeout:(BOOL)a3 useTimeout:(id)a4;
- (void)_checkConnectivityForQueuedDisconnectedBlocks;
- (void)_sendCloudMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 destinations:(id)a6 completion:(id)a7;
- (void)_sendCloudMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 withReply:(id)a6 destinations:(id)a7;
- (void)_sendErrorReply:(id)a3 toMessage:(id)a4 isCritical:(BOOL)a5;
- (void)_sendMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 completion:(id)a6;
- (void)_sendMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 withReply:(id)a6;
- (void)_sendReply:(id)a3 toMessage:(id)a4 isCritical:(BOOL)a5;
- (void)executeBlockWhenDisconnected:(id)a3;
- (void)handleMessage:(id)a3 withContext:(id)a4;
- (void)resume;
- (void)sendCloudMessage:(id)a3 isCritical:(BOOL)a4 destinations:(id)a5 completion:(id)a6;
- (void)sendCloudMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 destinations:(id)a6 completion:(id)a7;
- (void)sendCloudMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 withReply:(id)a6 destinations:(id)a7;
- (void)sendCloudMessage:(id)a3 isCritical:(BOOL)a4 withReply:(id)a5 destinations:(id)a6;
- (void)sendCloudMessage:(id)a3 toBTID:(id)a4 isCritical:(BOOL)a5 usetimeout:(id)a6 completion:(id)a7;
- (void)sendCloudMessageToCompanion:(id)a3 isCritical:(BOOL)a4 usetimeout:(id)a5 completion:(id)a6;
- (void)sendErrorReply:(id)a3 toMessage:(id)a4 isCritical:(BOOL)a5;
- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 completion:(id)a5;
- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 completion:(id)a6;
- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 withReply:(id)a6;
- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 withReply:(id)a5;
- (void)sendReply:(id)a3 toMessage:(id)a4 isCritical:(BOOL)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)setCloudService:(id)a3;
- (void)setHandler:(id)a3 forMessagesOfType:(id)a4;
- (void)setHandler:(id)a3 forMessagesOfTypes:(id)a4;
- (void)setMessageHandlers:(id)a3;
- (void)setPendingMessageCompletions:(id)a3;
- (void)setPendingMessageReplies:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueuedDisconnectionBlock:(id)a3;
- (void)setSendMessageQueue:(id)a3;
- (void)setService:(id)a3;
- (void)suspend;
@end

@implementation SUBMessageEndpoint

+ (id)sharedEndpoint
{
  if (qword_100033D38 != -1) {
    dispatch_once(&qword_100033D38, &stru_10002D540);
  }
  v2 = (void *)qword_100033D30;
  return v2;
}

- (SUBMessageEndpoint)init
{
  v23.receiver = self;
  v23.super_class = (Class)SUBMessageEndpoint;
  v2 = [(SUBMessageEndpoint *)&v23 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.subridge.SUBMessageEndpoint", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.subridged.SUBMessageEndpoint.callback", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.subridged.SUBMessageEndpoint.sendMessage", v9);
    sendMessageQueue = v2->_sendMessageQueue;
    v2->_sendMessageQueue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingMessageCompletions = v2->_pendingMessageCompletions;
    v2->_pendingMessageCompletions = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingMessageReplies = v2->_pendingMessageReplies;
    v2->_pendingMessageReplies = v16;

    v18 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.otaupdate"];
    service = v2->_service;
    v2->_service = v18;

    v20 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.otaupdate.cloud"];
    cloudService = v2->_cloudService;
    v2->_cloudService = v20;
  }
  return v2;
}

- (BOOL)isConnected
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IDSService *)self->_service devices];
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
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice])
        {
          LOBYTE(v3) = [v6 isConnected];
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

  return (char)v3;
}

- (void)executeBlockWhenDisconnected:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_100016500;
    v11[4] = sub_100016510;
    unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
    v6 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v14 = add;
      __int16 v15 = 2080;
      v16 = "SUBTransactionBegin";
      __int16 v17 = 2080;
      v18 = "com.apple.SoftwareUpdateBridge.executeBlockWhenDisconnected";
      __int16 v19 = 1024;
      int v20 = 59;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
    }
    id v12 = (id)os_transaction_create();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016518;
    block[3] = &unk_10002D568;
    block[4] = self;
    id v9 = v4;
    long long v10 = v11;
    dispatch_async(queue, block);

    _Block_object_dispose(v11, 8);
  }
}

- (void)_checkConnectivityForQueuedDisconnectedBlocks
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableArray *)self->_queuedDisconnectionBlock count]
    && ![(SUBMessageEndpoint *)self isConnected])
  {
    id v3 = self->_queuedDisconnectionBlock;
    queuedDisconnectionBlock = self->_queuedDisconnectionBlock;
    self->_queuedDisconnectionBlock = 0;

    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = sub_100016500;
    v12[4] = sub_100016510;
    unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
    v6 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v15 = add;
      __int16 v16 = 2080;
      __int16 v17 = "SUBTransactionBegin";
      __int16 v18 = 2080;
      __int16 v19 = "com.apple.SoftwareUpdateBridge._checkConnectivityForQueuedDisconnectedBlocks";
      __int16 v20 = 1024;
      int v21 = 59;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
    }
    id v13 = (id)os_transaction_create();
    callbackQueue = self->_callbackQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000168C0;
    v9[3] = &unk_10002D4A8;
    long long v10 = v3;
    long long v11 = v12;
    long long v8 = v3;
    dispatch_async(callbackQueue, v9);

    _Block_object_dispose(v12, 8);
  }
}

- (void)resume
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_100016500;
  v7[4] = sub_100016510;
  unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
  id v4 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v10 = add;
    __int16 v11 = 2080;
    id v12 = "SUBTransactionBegin";
    __int16 v13 = 2080;
    unint64_t v14 = "com.apple.SoftwareUpdateBridge.resume";
    __int16 v15 = 1024;
    int v16 = 59;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
  }
  id v8 = (id)os_transaction_create();
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016C4C;
  v6[3] = &unk_10002D4A8;
  v6[4] = self;
  v6[5] = v7;
  dispatch_async(queue, v6);
  _Block_object_dispose(v7, 8);
}

- (void)suspend
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_100016500;
  v7[4] = sub_100016510;
  unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
  id v4 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v10 = add;
    __int16 v11 = 2080;
    id v12 = "SUBTransactionBegin";
    __int16 v13 = 2080;
    unint64_t v14 = "com.apple.SoftwareUpdateBridge.suspend";
    __int16 v15 = 1024;
    int v16 = 59;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
  }
  id v8 = (id)os_transaction_create();
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016F58;
  v6[3] = &unk_10002D4A8;
  v6[4] = self;
  v6[5] = v7;
  dispatch_async(queue, v6);
  _Block_object_dispose(v7, 8);
}

- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 completion:(id)a5
{
}

- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100016500;
  v25[4] = sub_100016510;
  unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
  unint64_t v14 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v28 = add;
    __int16 v29 = 2080;
    v30 = "SUBTransactionBegin";
    __int16 v31 = 2080;
    v32 = "com.apple.SoftwareUpdateBridge.sendMessage.1.1";
    __int16 v33 = 1024;
    int v34 = 59;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
  }
  id v26 = (id)os_transaction_create();
  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000172F8;
  v19[3] = &unk_10002D5B8;
  v19[4] = self;
  id v20 = v10;
  BOOL v24 = a4;
  id v21 = v11;
  id v22 = v12;
  objc_super v23 = v25;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(queue, v19);

  _Block_object_dispose(v25, 8);
}

- (id)getMessageTimeout:(BOOL)a3 useTimeout:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    dispatch_queue_t v7 = (_UNKNOWN **)v5;
  }
  else if (v4)
  {
    dispatch_queue_t v7 = &off_10002F2D0;
  }
  else
  {
    dispatch_queue_t v7 = &off_10002F2E8;
  }

  return v7;
}

- (void)_sendMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100016500;
  v25[4] = sub_100016510;
  id v26 = 0;
  id obj = 0;
  __int16 v13 = [(SUBMessageEndpoint *)self _sendMessage:v10 replyingTo:0 expectingResponse:0 useTimeout:v11 isCritical:v8 error:&obj];
  objc_storeStrong(&v26, obj);
  if (v12)
  {
    if (v13)
    {
      id v14 = [v12 copy];
      [(NSMutableDictionary *)self->_pendingMessageCompletions setObject:v14 forKeyedSubscript:v13];
    }
    else
    {
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x3032000000;
      v22[3] = sub_100016500;
      v22[4] = sub_100016510;
      unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
      id v16 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        unint64_t v28 = add;
        __int16 v29 = 2080;
        v30 = "SUBTransactionBegin";
        __int16 v31 = 2080;
        v32 = "com.apple.SoftwareUpdateBridge._sendMessage.1";
        __int16 v33 = 1024;
        int v34 = 59;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
      }
      id v23 = (id)os_transaction_create();
      callbackQueue = self->_callbackQueue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100017AA8;
      v18[3] = &unk_10002D5E0;
      id v19 = v12;
      id v20 = v25;
      id v21 = v22;
      dispatch_async(callbackQueue, v18);

      _Block_object_dispose(v22, 8);
    }
  }

  _Block_object_dispose(v25, 8);
}

- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 withReply:(id)a5
{
}

- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100016500;
  v25[4] = sub_100016510;
  unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
  id v14 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v28 = add;
    __int16 v29 = 2080;
    v30 = "SUBTransactionBegin";
    __int16 v31 = 2080;
    v32 = "com.apple.SoftwareUpdateBridge.sendMessage.2.1";
    __int16 v33 = 1024;
    int v34 = 59;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
  }
  id v26 = (id)os_transaction_create();
  queue = self->_queue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100017E4C;
  v19[3] = &unk_10002D5B8;
  v19[4] = self;
  id v20 = v10;
  BOOL v24 = a4;
  id v21 = v11;
  id v22 = v12;
  id v23 = v25;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(queue, v19);

  _Block_object_dispose(v25, 8);
}

- (void)_sendMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 withReply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  queue = self->_queue;
  id v12 = a5;
  id v13 = a3;
  dispatch_assert_queue_V2(queue);
  id v26 = 0;
  id v14 = [(SUBMessageEndpoint *)self _sendMessage:v13 replyingTo:0 expectingResponse:v10 != 0 useTimeout:v12 isCritical:v7 error:&v26];

  id v15 = v26;
  if (v10)
  {
    if (v14)
    {
      id v16 = [v10 copy];
      [(NSMutableDictionary *)self->_pendingMessageReplies setObject:v16 forKeyedSubscript:v14];
    }
    else
    {
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = sub_100016500;
      v24[4] = sub_100016510;
      unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
      id v18 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        unint64_t v28 = add;
        __int16 v29 = 2080;
        v30 = "SUBTransactionBegin";
        __int16 v31 = 2080;
        v32 = "com.apple.SoftwareUpdateBridge._sendMessage.2";
        __int16 v33 = 1024;
        int v34 = 59;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
      }
      id v25 = (id)os_transaction_create();
      callbackQueue = self->_callbackQueue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100018520;
      v20[3] = &unk_10002D630;
      id v22 = v10;
      id v21 = v15;
      id v23 = v24;
      dispatch_async(callbackQueue, v20);

      _Block_object_dispose(v24, 8);
    }
  }
}

- (void)sendCloudMessage:(id)a3 toBTID:(id)a4 isCritical:(BOOL)a5 usetimeout:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  cloudService = self->_cloudService;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  id v16 = [(IDSService *)cloudService devicesForBTUUID:a4];
  id v17 = [v16 anyObject];

  id v18 = (void *)IDSCopyIDForDevice();
  id v19 = +[NSSet setWithObject:v18];

  id v20 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sending to ids device: %@", (uint8_t *)&v21, 0xCu);
  }
  [(SUBMessageEndpoint *)self sendCloudMessage:v15 isCritical:v8 useTimeout:v14 destinations:v19 completion:v13];
}

- (void)sendCloudMessage:(id)a3 isCritical:(BOOL)a4 destinations:(id)a5 completion:(id)a6
{
}

- (void)sendCloudMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 destinations:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100016500;
  v30[4] = sub_100016510;
  unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
  id v17 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v33 = add;
    __int16 v34 = 2080;
    v35 = "SUBTransactionBegin";
    __int16 v36 = 2080;
    v37 = "com.apple.SoftwareUpdateBridge.sendCloudMessage1.1";
    __int16 v38 = 1024;
    int v39 = 59;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
  }
  id v31 = (id)os_transaction_create();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018A4C;
  block[3] = &unk_10002D658;
  block[4] = self;
  id v24 = v12;
  BOOL v29 = a4;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  unint64_t v28 = v30;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async(queue, block);

  _Block_object_dispose(v30, 8);
}

- (void)_sendCloudMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 destinations:(id)a6 completion:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  queue = self->_queue;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  dispatch_assert_queue_V2(queue);
  id v29 = 0;
  id v17 = [(SUBMessageEndpoint *)self _sendCloudMessage:v16 replyingTo:0 expectingResponse:0 useTimeout:v15 isCritical:v9 error:&v29 destinations:v14];

  id v18 = v29;
  if (v12)
  {
    if (v17)
    {
      id v19 = [v12 copy];
      [(NSMutableDictionary *)self->_pendingMessageCompletions setObject:v19 forKeyedSubscript:v17];
    }
    else
    {
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = sub_100016500;
      v27[4] = sub_100016510;
      unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
      id v21 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        unint64_t v31 = add;
        __int16 v32 = 2080;
        unint64_t v33 = "SUBTransactionBegin";
        __int16 v34 = 2080;
        v35 = "com.apple.SoftwareUpdateBridge._sendCloudMessage1";
        __int16 v36 = 1024;
        int v37 = 59;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
      }
      id v28 = (id)os_transaction_create();
      callbackQueue = self->_callbackQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001914C;
      block[3] = &unk_10002D630;
      id v25 = v12;
      id v24 = v18;
      id v26 = v27;
      dispatch_async(callbackQueue, block);

      _Block_object_dispose(v27, 8);
    }
  }
}

- (void)sendCloudMessage:(id)a3 isCritical:(BOOL)a4 withReply:(id)a5 destinations:(id)a6
{
}

- (void)sendCloudMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 withReply:(id)a6 destinations:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100016500;
  v30[4] = sub_100016510;
  unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
  id v17 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v33 = add;
    __int16 v34 = 2080;
    v35 = "SUBTransactionBegin";
    __int16 v36 = 2080;
    int v37 = "com.apple.SoftwareUpdateBridge.sendCloudMessage2.1";
    __int16 v38 = 1024;
    int v39 = 59;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
  }
  id v31 = (id)os_transaction_create();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001950C;
  block[3] = &unk_10002D658;
  void block[4] = self;
  id v24 = v12;
  BOOL v29 = a4;
  id v25 = v13;
  id v26 = v15;
  id v27 = v14;
  id v28 = v30;
  id v19 = v15;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  dispatch_async(queue, block);

  _Block_object_dispose(v30, 8);
}

- (void)_sendCloudMessage:(id)a3 isCritical:(BOOL)a4 useTimeout:(id)a5 withReply:(id)a6 destinations:(id)a7
{
  BOOL v9 = a4;
  id v12 = a6;
  queue = self->_queue;
  id v14 = a7;
  id v15 = a5;
  id v16 = a3;
  dispatch_assert_queue_V2(queue);
  id v29 = 0;
  id v17 = [(SUBMessageEndpoint *)self _sendCloudMessage:v16 replyingTo:0 expectingResponse:v12 != 0 useTimeout:v15 isCritical:v9 error:&v29 destinations:v14];

  id v18 = v29;
  if (v12)
  {
    if (v17)
    {
      id v19 = [v12 copy];
      [(NSMutableDictionary *)self->_pendingMessageReplies setObject:v19 forKeyedSubscript:v17];
    }
    else
    {
      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = sub_100016500;
      v27[4] = sub_100016510;
      unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
      id v21 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        unint64_t v31 = add;
        __int16 v32 = 2080;
        unint64_t v33 = "SUBTransactionBegin";
        __int16 v34 = 2080;
        v35 = "com.apple.SoftwareUpdateBridge._sendCloudMessage2";
        __int16 v36 = 1024;
        int v37 = 59;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
      }
      id v28 = (id)os_transaction_create();
      callbackQueue = self->_callbackQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100019BFC;
      block[3] = &unk_10002D630;
      id v25 = v12;
      id v24 = v18;
      id v26 = v27;
      dispatch_async(callbackQueue, block);

      _Block_object_dispose(v27, 8);
    }
  }
}

- (void)sendReply:(id)a3 toMessage:(id)a4 isCritical:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_100016500;
  void v20[4] = sub_100016510;
  unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
  id v11 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v23 = add;
    __int16 v24 = 2080;
    id v25 = "SUBTransactionBegin";
    __int16 v26 = 2080;
    id v27 = "com.apple.SoftwareUpdateBridge.sendReply";
    __int16 v28 = 1024;
    int v29 = 59;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
  }
  id v21 = (id)os_transaction_create();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019F64;
  block[3] = &unk_10002D680;
  void block[4] = self;
  id v16 = v8;
  BOOL v19 = a5;
  id v17 = v9;
  id v18 = v20;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);

  _Block_object_dispose(v20, 8);
}

- (void)_sendReply:(id)a3 toMessage:(id)a4 isCritical:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  queue = self->_queue;
  id v10 = a3;
  dispatch_assert_queue_V2(queue);
  id v14 = 0;
  id v11 = [(SUBMessageEndpoint *)self _sendMessage:v10 replyingTo:v8 expectingResponse:0 useTimeout:0 isCritical:v5 error:&v14];

  id v12 = v14;
  if (!v11)
  {
    id v13 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to send reply to message identifier '%{public}@': %{public}@", buf, 0x16u);
    }
  }
}

- (void)setHandler:(id)a3 forMessagesOfType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A2B8;
  block[3] = &unk_10002D6A8;
  id v12 = v7;
  id v13 = v6;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)setHandler:(id)a3 forMessagesOfTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A3E8;
  block[3] = &unk_10002D1F0;
  id v13 = self;
  id v14 = v6;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (id)_sendCloudMessage:(id)a3 replyingTo:(id)a4 expectingResponse:(BOOL)a5 useTimeout:(id)a6 isCritical:(BOOL)a7 error:(id *)a8 destinations:(id)a9
{
  BOOL v10 = a7;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  __int16 v17 = (_UNKNOWN **)a6;
  id v18 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v15)
  {
    id v58 = v18;
    +[NSMutableDictionary dictionary];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10001AAAC;
    v62[3] = &unk_10002D198;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v63 = v23;
    [v15 enumerateKeysAndObjectsUsingBlock:v62];
    id v61 = 0;
    __int16 v24 = +[NSPropertyListSerialization dataWithPropertyList:v23 format:200 options:0 error:&v61];
    id v29 = v61;
    if (v24)
    {
      v56 = v17;
      uint64_t v68 = IDSSendMessageOptionExpectsPeerResponseKey;
      v30 = +[NSNumber numberWithBool:v12];
      v69 = v30;
      +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      unint64_t v31 = v57 = v16;
      id v32 = [v31 mutableCopy];

      if (v57) {
        [v32 setObject:v57 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
      }
      unint64_t v33 = &off_10002F2E8;
      if (v10)
      {
        unint64_t v33 = &off_10002F2D0;
        uint64_t v34 = 300;
      }
      else
      {
        uint64_t v34 = 200;
      }
      if (v56) {
        v35 = v56;
      }
      else {
        v35 = v33;
      }
      [v32 setObject:v35 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
      cloudService = self->_cloudService;
      id v59 = v29;
      id v60 = 0;
      unsigned __int8 v37 = [(IDSService *)cloudService sendData:v24 toDestinations:v58 priority:v34 options:v32 identifier:&v60 error:&v59];
      id v38 = v60;
      id v39 = v59;

      v40 = softwareupdatebridge_log;
      BOOL v41 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
      if (v37)
      {
        id v16 = v57;
        if (v57)
        {
          __int16 v17 = v56;
          if (v41)
          {
            *(_DWORD *)buf = 138412546;
            id v65 = v57;
            __int16 v66 = 2112;
            id v67 = v38;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Sent message reply to: %@ with identifier: %@", buf, 0x16u);
          }
        }
        else
        {
          __int16 v17 = v56;
          if (v41)
          {
            v50 = SUBMessageTypeKey[0];
            v51 = v40;
            v52 = +[NSString stringWithUTF8String:v50];
            v53 = [v15 objectForKeyedSubscript:v52];
            *(_DWORD *)buf = 138412546;
            id v65 = v53;
            __int16 v66 = 2112;
            id v67 = v38;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Sent message: %@ with identifier: %@", buf, 0x16u);

            __int16 v17 = v56;
            id v16 = 0;
          }
        }
        id v47 = v38;
      }
      else
      {
        if (v41)
        {
          *(_DWORD *)buf = 138412290;
          id v65 = v39;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Failed to send message: %@", buf, 0xCu);
        }
        if (a8)
        {
          SUBError(@"SUBError", 2, v39, @"Failed to send message: %@", v42, v43, v44, v45, (uint64_t)v39);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        v49 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v65 = v39;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Failed to send message: %@", buf, 0xCu);
        }
        id v47 = 0;
        __int16 v17 = v56;
        id v16 = v57;
      }
    }
    else
    {
      if (a8)
      {
        SUBError(@"SUBError", 1, v29, @"Failed to serialize message '%@'", v25, v26, v27, v28, (uint64_t)v15);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v48 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v65 = v15;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Failed to serialize message '%@'", buf, 0xCu);
      }
      id v47 = 0;
      id v39 = v29;
    }

    id v18 = v58;
  }
  else
  {
    if (a8)
    {
      SUBError(@"SUBError", 1, 0, @"Cannot send nil message", v19, v20, v21, v22, v55);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v46 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Cannot send nil message", buf, 2u);
    }
    id v47 = 0;
  }

  return v47;
}

- (id)dataCompress:(id)a3 shouldCompress:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  memset(&stream, 0, sizeof(stream));
  if (compression_stream_init(&stream, (compression_stream_operation)!v4, COMPRESSION_ZLIB))
  {
    id v6 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Compression failed, returning nil", buf, 2u);
    }
    id v7 = 0;
  }
  else
  {
    id v8 = objc_alloc_init((Class)NSMutableData);
    id v9 = v5;
    stream.src_ptr = (const uint8_t *)[v9 bytes];
    stream.src_size = (size_t)[v9 length];
    while (1)
    {
      stream.dst_ptr = buf;
      stream.dst_size = 4096;
      compression_status v10 = compression_stream_process(&stream, 1);
      if (v10) {
        break;
      }
      if (stream.dst_size)
      {
        id v11 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v13 = 0;
LABEL_17:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to compress", v13, 2u);
        }
        goto LABEL_18;
      }
      [v8 appendBytes:buf length:4096];
    }
    if (v10 != COMPRESSION_STATUS_END)
    {
      id v11 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        goto LABEL_17;
      }
LABEL_18:
      compression_stream_destroy(&stream);
      id v7 = 0;
      goto LABEL_19;
    }
    if (stream.dst_ptr > buf) {
      [v8 appendBytes:buf length:stream.dst_ptr - buf];
    }
    id v7 = v8;
LABEL_19:
  }
  return v7;
}

- (id)_sendMessage:(id)a3 replyingTo:(id)a4 expectingResponse:(BOOL)a5 useTimeout:(id)a6 isCritical:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v14)
  {
    id v68 = v16;
    v69 = [(SUBMessageEndpoint *)self getMessageTimeout:v9 useTimeout:v16];
    +[NSMutableDictionary dictionary];
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_10001B67C;
    v91[3] = &unk_10002D198;
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    id v92 = v70;
    [v14 enumerateKeysAndObjectsUsingBlock:v91];
    *(void *)v85 = 0;
    v86 = v85;
    uint64_t v87 = 0x3032000000;
    v88 = sub_100016500;
    v89 = sub_100016510;
    id v90 = 0;
    id obj = 0;
    v71 = +[NSPropertyListSerialization dataWithPropertyList:v70 format:200 options:0 error:&obj];
    objc_storeStrong(&v90, obj);
    if (!v71)
    {
      if (a8)
      {
        SUBError(@"SUBError", 1, *((void **)v86 + 5), @"Failed to serialize message '%@'", v21, v22, v23, v24, (uint64_t)v14);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v50 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v100) = 138412290;
        *(void *)((char *)&v100 + 4) = v14;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Failed to serialize message '%@'", (uint8_t *)&v100, 0xCu);
      }
      id v49 = 0;
      goto LABEL_50;
    }
    *(void *)&long long v100 = 0;
    *((void *)&v100 + 1) = &v100;
    uint64_t v101 = 0x3032000000;
    v102 = sub_100016500;
    v103 = sub_100016510;
    id v104 = 0;
    id v29 = [(SUBMessageEndpoint *)self SUBDefaultPairedDevice];
    if (!v29)
    {
      if (a8)
      {
        SUBError(@"SUBError", 1, *((void **)v86 + 5), @"Can not send message without default paired device '%@'", v25, v26, v27, v28, (uint64_t)v14);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v51 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v95) = 138412290;
        *(void *)((char *)&v95 + 4) = v14;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Can not send message without default paired device '%@'", (uint8_t *)&v95, 0xCu);
      }
      id v49 = 0;
      goto LABEL_49;
    }
    id v67 = v29;
    v30 = +[NSSet setWithObject:v29];
    uint64_t v98 = IDSSendMessageOptionExpectsPeerResponseKey;
    unint64_t v31 = +[NSNumber numberWithBool:v11];
    v99 = v31;
    id v32 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    id v33 = [v32 mutableCopy];

    if (v15) {
      [v33 setObject:v15 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
    }
    [v33 setObject:v69 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    [v33 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    *(void *)&long long v95 = 0;
    *((void *)&v95 + 1) = &v95;
    uint64_t v96 = 0x2020000000;
    char v97 = 0;
    uint64_t v35 = (uint64_t)[v69 longLongValue];
    BOOL v36 = !v9;
    sendMessageQueue = self->_sendMessageQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B724;
    block[3] = &unk_10002D6D0;
    if (v36) {
      uint64_t v38 = 200;
    }
    else {
      uint64_t v38 = 300;
    }
    v79 = &v95;
    void block[4] = self;
    id v73 = v71;
    id v65 = v30;
    id v74 = v65;
    uint64_t v82 = v38;
    id v66 = v33;
    id v75 = v66;
    v80 = &v100;
    v81 = v85;
    v83 = a8;
    id v39 = (__CFString *)v15;
    v76 = v39;
    id v40 = v14;
    id v77 = v40;
    BOOL v41 = v34;
    v78 = v41;
    dispatch_async(sendMessageQueue, block);
    dispatch_time_t v42 = dispatch_time(0, 1000000000 * v35 + 10000000000);
    if (dispatch_semaphore_wait(v41, v42))
    {
      if (v15)
      {
        if (a8)
        {
          SUBError(@"SUBError", 48, 0, @"IDS timed out on sending message reply to: %@", v43, v44, v45, v46, (uint64_t)v39);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v47 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v39;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "IDS timed out on sending message reply to: %@", buf, 0xCu);
        }
      }
      else
      {
        if (a8)
        {
          v52 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
          id v57 = [v40 objectForKeyedSubscript:v52];
          if (v57)
          {
            uint64_t v35 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
            id v58 = [v40 objectForKeyedSubscript:v35];
          }
          else
          {
            id v58 = @"Unknown";
          }
          SUBError(@"SUBError", 48, 0, @"IDS timed out sending message: %@", v53, v54, v55, v56, (uint64_t)v58);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
          if (v57)
          {
          }
        }
        id v59 = (id)softwareupdatebridge_log;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          id v60 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
          id v61 = [v40 objectForKeyedSubscript:v60];
          if (v61)
          {
            uint64_t v35 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
            v62 = [v40 objectForKeyedSubscript:v35];
          }
          else
          {
            v62 = @"Unknown";
          }
          *(_DWORD *)buf = 138412290;
          v94 = v62;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "IDS timed out sending message: %@", buf, 0xCu);
          if (v61)
          {
          }
        }
      }
    }
    else if (*(unsigned char *)(*((void *)&v95 + 1) + 24))
    {
      id v49 = *(id *)(*((void *)&v100 + 1) + 40);
LABEL_48:

      _Block_object_dispose(&v95, 8);
      id v29 = v67;
LABEL_49:

      _Block_object_dispose(&v100, 8);
LABEL_50:

      _Block_object_dispose(v85, 8);
      id v16 = v68;
      goto LABEL_51;
    }
    id v49 = 0;
    goto LABEL_48;
  }
  if (a8)
  {
    SUBError(@"SUBError", 1, 0, @"Cannot send nil message", v17, v18, v19, v20, v64);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v48 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v85 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Cannot send nil message", v85, 2u);
  }
  id v49 = 0;
LABEL_51:

  return v49;
}

- (id)SUBDefaultPairedDevice
{
  uint64_t v3 = [(IDSService *)self->_service linkedDevicesWithRelationship:1];
  uint64_t v4 = [(IDSService *)self->_service linkedDevicesWithRelationship:2];
  if (v3 | v4)
  {
    id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[(id)v3 count] + (void)objc_msgSend((id)v4, "count"));
    id v6 = v5;
    if (v3) {
      [v5 addObjectsFromArray:v3];
    }
    if (v4) {
      [v6 addObjectsFromArray:v4];
    }
  }
  else
  {
    id v6 = 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "isDefaultPairedDevice", (void)v12))
        {
          id v8 = (id)IDSCopyIDForDevice();
          goto LABEL_17;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v8;
}

- (void)sendErrorReply:(id)a3 toMessage:(id)a4 isCritical:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_100016500;
  void v20[4] = sub_100016510;
  unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
  BOOL v11 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    unint64_t v23 = add;
    __int16 v24 = 2080;
    uint64_t v25 = "SUBTransactionBegin";
    __int16 v26 = 2080;
    uint64_t v27 = "com.apple.SoftwareUpdateBridge.sendErrorReply";
    __int16 v28 = 1024;
    int v29 = 59;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
  }
  id v21 = (id)os_transaction_create();
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BDE8;
  block[3] = &unk_10002D680;
  void block[4] = self;
  id v16 = v8;
  BOOL v19 = a5;
  id v17 = v9;
  uint64_t v18 = v20;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);

  _Block_object_dispose(v20, 8);
}

- (void)sendCloudMessageToCompanion:(id)a3 isCritical:(BOOL)a4 usetimeout:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = +[NRPairedDeviceRegistry sharedInstance];
  id v14 = [v13 getPairedDevices];
  long long v15 = [v14 firstObject];

  id v16 = [v15 objectForKeyedSubscript:_NRDevicePropertyBluetoothIdentifier];
  id v17 = [(IDSService *)self->_cloudService devicesForBTUUID:v16];
  uint64_t v18 = [v17 anyObject];

  BOOL v19 = (void *)IDSCopyIDForDevice();
  uint64_t v20 = +[NSSet setWithObject:v19];

  id v21 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    unint64_t v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sending to ids device: %@", (uint8_t *)&v22, 0xCu);
  }
  [(SUBMessageEndpoint *)self sendCloudMessage:v12 isCritical:v7 useTimeout:v11 destinations:v20 completion:v10];
}

- (void)_sendErrorReply:(id)a3 toMessage:(id)a4 isCritical:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v9)
  {
    id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
    if (v10)
    {
      id v11 = +[NSString stringWithUTF8String:SUBMessageErrorKey[0]];
      uint64_t v18 = v11;
      BOOL v19 = v10;
      id v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v17 = 0;
      id v13 = [(SUBMessageEndpoint *)self _sendMessage:v12 replyingTo:v9 expectingResponse:0 useTimeout:0 isCritical:v5 error:&v17];
      id v14 = v17;

      if (!v13)
      {
        long long v15 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to send error reply: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v16 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to archive error '%{public}@'", buf, 0xCu);
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v26 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v14)
  {
    BOOL v19 = SUBError(@"SUBError", 2, v14, @"failed to send message", v15, v16, v17, v18, (uint64_t)v26);
  }
  else
  {
    BOOL v19 = 0;
  }
  uint64_t v20 = [(NSMutableDictionary *)self->_pendingMessageCompletions objectForKeyedSubscript:v13];
  if (v14)
  {
    id v21 = [(NSMutableDictionary *)self->_pendingMessageReplies objectForKeyedSubscript:v13];
    unint64_t v22 = objc_retainBlock(v21);
  }
  else
  {
    unint64_t v22 = 0;
  }
  if (v20 | v22)
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = sub_100016500;
    v33[4] = sub_100016510;
    unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
    __int16 v24 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v36 = add;
      __int16 v37 = 2080;
      uint64_t v38 = "SUBTransactionBegin";
      __int16 v39 = 2080;
      id v40 = "com.apple.SoftwareUpdateBridge.service.1";
      __int16 v41 = 1024;
      int v42 = 59;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
    }
    id v34 = (id)os_transaction_create();
    callbackQueue = self->_callbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C610;
    block[3] = &unk_10002D6F8;
    id v29 = (id)v20;
    id v28 = v19;
    BOOL v32 = a6;
    id v30 = (id)v22;
    unint64_t v31 = v33;
    dispatch_async(callbackQueue, block);
    if (v20) {
      [(NSMutableDictionary *)self->_pendingMessageCompletions removeObjectForKey:v13];
    }
    if (v22) {
      [(NSMutableDictionary *)self->_pendingMessageReplies removeObjectForKey:v13];
    }

    _Block_object_dispose(v33, 8);
  }
}

- (void)handleMessage:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [v7 incomingResponseIdentifier];
  v48 = [v7 outgoingResponseIdentifier];
  id v63 = 0;
  id v9 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v63];
  id v10 = v63;
  if (v9)
  {
    if (!v8)
    {
      id v11 = +[NSString stringWithUTF8String:SUBMessageTypeKey[0]];
      id v12 = [v9 objectForKeyedSubscript:v11];

      if (v12)
      {
        uint64_t v45 = [(NSMutableDictionary *)self->_messageHandlers objectForKeyedSubscript:v12];
        if (v45)
        {
          *(void *)uint64_t v64 = 0;
          *(void *)&v64[8] = v64;
          *(void *)&v64[16] = 0x3032000000;
          id v65 = sub_100016500;
          id v66 = sub_100016510;
          unint64_t add = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
          id v14 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218754;
            unint64_t v69 = add;
            __int16 v70 = 2080;
            v71 = "SUBTransactionBegin";
            __int16 v72 = 2080;
            id v73 = "com.apple.SoftwareUpdateBridge.service.2.2";
            __int16 v74 = 1024;
            int v75 = 59;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
          }
          id v67 = (id)os_transaction_create();
          callbackQueue = self->_callbackQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001D224;
          block[3] = &unk_10002D748;
          id v50 = v12;
          id v51 = v48;
          id v46 = v45;
          id v54 = v46;
          id v52 = v9;
          id v53 = v7;
          uint64_t v55 = v64;
          dispatch_async(callbackQueue, block);

          _Block_object_dispose(v64, 8);
        }
        else
        {
          uint64_t v35 = (void *)softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            id v40 = v35;
            __int16 v41 = [v7 outgoingResponseIdentifier];
            *(_DWORD *)uint64_t v64 = 138412546;
            *(void *)&v64[4] = v41;
            *(_WORD *)&v64[12] = 2112;
            *(void *)&v64[14] = v12;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "No handler for message %@ of type %@", v64, 0x16u);
          }
          int v42 = SUBError(@"SUBError", 1, 0, @"No handler for message type '%@'", v36, v37, v38, v39, (uint64_t)v12);
          uint64_t v43 = [v7 outgoingResponseIdentifier];
          [(SUBMessageEndpoint *)self _sendErrorReply:v42 toMessage:v43 isCritical:1];
        }
      }
      else
      {
        uint64_t v27 = (void *)softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v32 = v27;
          id v33 = [v7 outgoingResponseIdentifier];
          *(_DWORD *)uint64_t v64 = 138543618;
          *(void *)&v64[4] = v33;
          *(_WORD *)&v64[12] = 2082;
          *(char **)&v64[14] = SUBMessageTypeKey[0];
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Got message %{public}@ without %{public}s key", v64, 0x16u);
        }
        id v47 = SUBError(@"SUBError", 1, 0, @"Dropping message without '%s' key", v28, v29, v30, v31, (uint64_t)SUBMessageTypeKey[0]);
        id v34 = [v7 outgoingResponseIdentifier];
        [(SUBMessageEndpoint *)self _sendErrorReply:v47 toMessage:v34 isCritical:1];
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v16 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v64 = 138543618;
      *(void *)&v64[4] = v48;
      *(_WORD *)&v64[12] = 2114;
      *(void *)&v64[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to parse IDS message %{public}@: %{public}@", v64, 0x16u);
    }
    if (!v8)
    {
      SUBError(@"SUBError", 1, v10, @"Unparseable IDS message", v17, v18, v19, v20, v44);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = [v7 outgoingResponseIdentifier];
      [(SUBMessageEndpoint *)self _sendErrorReply:v12 toMessage:v26 isCritical:1];

      goto LABEL_25;
    }
  }
  id v12 = [(NSMutableDictionary *)self->_pendingMessageReplies objectForKeyedSubscript:v8];
  if (v12)
  {
    *(void *)uint64_t v64 = 0;
    *(void *)&v64[8] = v64;
    *(void *)&v64[16] = 0x3032000000;
    id v65 = sub_100016500;
    id v66 = sub_100016510;
    unint64_t v21 = atomic_fetch_add(&_SUBTransactionCounter, 1uLL);
    unint64_t v22 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v69 = v21;
      __int16 v70 = 2080;
      v71 = "SUBTransactionBegin";
      __int16 v72 = 2080;
      id v73 = "com.apple.SoftwareUpdateBridge.service.2.1";
      __int16 v74 = 1024;
      int v75 = 59;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "TX ⬆: %ld %s %s %d", buf, 0x26u);
    }
    id v67 = (id)os_transaction_create();
    unint64_t v23 = self->_callbackQueue;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10001CF80;
    v56[3] = &unk_10002D720;
    id v57 = v10;
    id v12 = v12;
    id v61 = v12;
    id v58 = v9;
    id v59 = v48;
    id v24 = v8;
    id v60 = v24;
    v62 = v64;
    dispatch_async(v23, v56);
    [(NSMutableDictionary *)self->_pendingMessageReplies removeObjectForKey:v24];

    _Block_object_dispose(v64, 8);
  }
  else
  {
    uint64_t v25 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v64 = 138543362;
      *(void *)&v64[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No reply handler set for message identifier %{public}@", v64, 0xCu);
    }
  }
LABEL_25:
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = [(IDSService *)self->_cloudService linkedDeviceForFromID:v11 withRelationship:3];
  uint64_t v14 = [(IDSService *)self->_service linkedDeviceForFromID:v11 withRelationship:3];
  if (v13 | v14)
  {
    [(SUBMessageEndpoint *)self handleMessage:v10 withContext:v12];
  }
  else
  {
    uint64_t v15 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Incoming data from from unknown device (%{public}@), dropping..", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(SUBMessageEndpoint *)self _checkConnectivityForQueuedDisconnectedBlocks];
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = [(IDSService *)self->_cloudService linkedDeviceForFromID:v11 withRelationship:3];
  if (v13)
  {
    uint64_t v14 = +[NSData dataWithContentsOfURL:v10];
    uint64_t v15 = [(SUBMessageEndpoint *)self dataCompress:v14 shouldCompress:0];
    [(SUBMessageEndpoint *)self handleMessage:v15 withContext:v12];
  }
  else
  {
    int v16 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Message sent by unknown device (%{public}@), dropping", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (NSMutableDictionary)messageHandlers
{
  return self->_messageHandlers;
}

- (void)setMessageHandlers:(id)a3
{
}

- (NSMutableDictionary)pendingMessageCompletions
{
  return self->_pendingMessageCompletions;
}

- (void)setPendingMessageCompletions:(id)a3
{
}

- (NSMutableDictionary)pendingMessageReplies
{
  return self->_pendingMessageReplies;
}

- (void)setPendingMessageReplies:(id)a3
{
}

- (NSMutableArray)queuedDisconnectionBlock
{
  return self->_queuedDisconnectionBlock;
}

- (void)setQueuedDisconnectionBlock:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (IDSService)cloudService
{
  return self->_cloudService;
}

- (void)setCloudService:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)sendMessageQueue
{
  return self->_sendMessageQueue;
}

- (void)setSendMessageQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendMessageQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queuedDisconnectionBlock, 0);
  objc_storeStrong((id *)&self->_pendingMessageReplies, 0);
  objc_storeStrong((id *)&self->_pendingMessageCompletions, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
}

@end