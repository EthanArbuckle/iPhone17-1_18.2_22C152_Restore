@interface SPDaemonConnection
+ (id)sharedBackgroundConnection;
+ (id)sharedConnection;
- (NSString)daemonName;
- (SPDaemonConnection)init;
- (SPDaemonConnection)initWithDaemonName:(id)a3 qos:(unsigned int)a4;
- (__CFDictionary)runningQueries;
- (id)_connection;
- (id)connectionQueue;
- (id)startQuery:(id)a3 queue:(id)a4 delegate:(id)a5;
- (void)_resetConnection;
- (void)_sendFeedbackMessage:(id)a3 object:(id)a4 info:(id)a5 reply:(id)a6;
- (void)_sendInteractiveMessage:(id)a3 object:(id)a4 info:(id)a5 reply:(id)a6;
- (void)_sendMessage:(id)a3 object:(id)a4 info:(id)a5 reply:(id)a6;
- (void)activate;
- (void)activate:(id)a3;
- (void)barrierOnXPC:(id)a3;
- (void)cancelQuery:(id)a3;
- (void)clearInput:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)preheat;
- (void)requestParsecParametersWithReply:(id)a3;
- (void)retrieveFirstTimeExperienceTextWithReply:(id)a3;
- (void)sendApps:(id)a3;
- (void)sendMessageForToken:(id)a3;
- (void)sendSFFeedback:(id)a3 type:(int64_t)a4 queryId:(unint64_t)a5;
- (void)setDaemonName:(id)a3;
- (void)setRunningQueries:(__CFDictionary *)a3;
@end

@implementation SPDaemonConnection

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_168);
  }
  v2 = (void *)sharedConnection_gDaemonConnection;

  return v2;
}

- (void)activate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__SPDaemonConnection_activate___block_invoke;
  v7[3] = &unk_2644B2A78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __31__SPDaemonConnection_activate___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v9 = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPDC Activate QOS: %d", buf, 8u);
  }

  id v4 = _os_activity_create(&dword_21E5D7000, "activation", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SPDaemonConnection_activate___block_invoke_126;
  v6[3] = &unk_2644B2A78;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  os_activity_apply(v4, v6);
}

void __50__SPDaemonConnection_sendSFFeedback_type_queryId___block_invoke(uint64_t a1)
{
  v2 = _os_activity_create(&dword_21E5D7000, "sendFeedback", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SPDaemonConnection_sendSFFeedback_type_queryId___block_invoke_2;
  v4[3] = &unk_2644B2AF0;
  long long v6 = *(_OWORD *)(a1 + 48);
  os_log_type_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  os_activity_apply(v2, v4);
}

void __50__SPDaemonConnection_sendSFFeedback_type_queryId___block_invoke_2(uint64_t a1)
{
  v8[2] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48))
  {
    v7[0] = @"QID";
    v2 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
    v7[1] = @"FBT";
    v8[0] = v2;
    os_log_type_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    v8[1] = v3;
    id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  }
  else
  {
    id v5 = @"FBT";
    v2 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    long long v6 = v2;
    id v4 = [NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  }

  [*(id *)(a1 + 32) _sendFeedbackMessage:@"SendSFFeedback" object:*(void *)(a1 + 40) info:v4 reply:0];
}

void __31__SPDaemonConnection_activate___block_invoke_126(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _sendInteractiveMessage:@"Activate" object:v2 info:0 reply:&__block_literal_global_128];
}

- (void)_sendInteractiveMessage:(id)a3 object:(id)a4 info:(id)a5 reply:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[SPXPCMessage alloc] initWithName:v13];

  [(SPXPCMessage *)v14 setRootObject:v12];
  [(SPXPCMessage *)v14 setInfo:v11];

  v15 = SPLogForSPLogCategoryDefault();
  os_log_type_t v16 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v28 = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v15, v16, "SPDC _sendMessage QOS: %d", buf, 8u);
  }

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SPDaemonConnection__sendInteractiveMessage_object_info_reply___block_invoke;
  block[3] = &unk_2644B29E0;
  v25 = v14;
  id v26 = v10;
  block[4] = self;
  v18 = connectionQueue;
  v19 = v14;
  id v20 = v10;
  qos_class_t v21 = qos_class_self();
  if (v21 < 0x1A) {
    dispatch_block_t v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  }
  else {
    dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v21, 0, block);
  }
  v23 = v22;
  dispatch_async(v18, v22);
}

uint64_t __48__SPDaemonConnection_sharedBackgroundConnection__block_invoke()
{
  sharedBackgroundConnection_gDaemonConnection = [[SPDaemonConnection alloc] initWithDaemonName:@"com.apple.searchd.background" qos:9];

  return MEMORY[0x270F9A758]();
}

uint64_t __38__SPDaemonConnection_sharedConnection__block_invoke()
{
  sharedConnection_gDaemonConnection = objc_alloc_init(SPDaemonConnection);

  return MEMORY[0x270F9A758]();
}

- (SPDaemonConnection)initWithDaemonName:(id)a3 qos:(unsigned int)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SPDaemonConnection;
  id v7 = [(SPDaemonConnection *)&v19 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    qos_class_t v9 = (void *)*((void *)v7 + 4);
    *((void *)v7 + 4) = v8;

    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v11 = dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)a4, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.search.daemonQueue", v11);
    id v13 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, (dispatch_qos_class_t)a4, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.search.XPCQueue", v15);
    v17 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v16;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v7 + 3), "com.apple.search.XPCQueue", v7, 0);
    *((void *)v7 + 5) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
  }

  return (SPDaemonConnection *)v7;
}

- (SPDaemonConnection)init
{
  return [(SPDaemonConnection *)self initWithDaemonName:@"com.apple.searchd" qos:33];
}

void __64__SPDaemonConnection__sendInteractiveMessage_object_info_reply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v11 = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPDC QOS: %d", buf, 8u);
  }

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) _connection];
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__SPDaemonConnection__sendInteractiveMessage_object_info_reply___block_invoke_20;
    void v8[3] = &unk_2644B29B8;
    id v9 = *(id *)(a1 + 48);
    [v6 sendInteractiveMessage:v7 withReply:v8];

    id v6 = v9;
  }
  else
  {
    [v5 sendMessage:*(void *)(a1 + 40)];
  }
}

void __61__SPDaemonConnection__sendFeedbackMessage_object_info_reply___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    v5[0] = 67109120;
    v5[1] = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPDC feedback QOS: %d", (uint8_t *)v5, 8u);
  }

  uint64_t v4 = [*(id *)(a1 + 32) _connection];
  [v4 sendMessage:*(void *)(a1 + 40)];
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v4 = [[SPXPCConnection alloc] initWithServiceName:self->_daemonName onQueue:self->_connectionQueue];
    id v5 = self->_connection;
    self->_connection = v4;

    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v6 = self->_connection;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __33__SPDaemonConnection__connection__block_invoke;
    v11[3] = &unk_2644B2940;
    objc_copyWeak(&v12, &location);
    [(SPXPCConnection *)v6 setDisconnectHandler:v11];
    uint64_t v7 = self->_connection;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __33__SPDaemonConnection__connection__block_invoke_2;
    v9[3] = &unk_2644B2968;
    objc_copyWeak(&v10, &location);
    [(SPXPCConnection *)v7 setMessageHandler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (void)_sendFeedbackMessage:(id)a3 object:(id)a4 info:(id)a5 reply:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[SPXPCMessage alloc] initWithName:v11];

  [(SPXPCMessage *)v12 setRootObjectForFeedback:v10];
  [(SPXPCMessage *)v12 setInfo:v9];

  connectionQueue = self->_connectionQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__SPDaemonConnection__sendFeedbackMessage_object_info_reply___block_invoke;
  v15[3] = &unk_2644B2990;
  v15[4] = self;
  dispatch_queue_t v16 = v12;
  v14 = v12;
  dispatch_async(connectionQueue, v15);
}

+ (id)sharedBackgroundConnection
{
  if (sharedBackgroundConnection_onceToken != -1) {
    dispatch_once(&sharedBackgroundConnection_onceToken, &__block_literal_global_171);
  }
  id v2 = (void *)sharedBackgroundConnection_gDaemonConnection;

  return v2;
}

- (void)sendSFFeedback:(id)a3 type:(int64_t)a4 queryId:(unint64_t)a5
{
  id v8 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__SPDaemonConnection_sendSFFeedback_type_queryId___block_invoke;
  v11[3] = &unk_2644B2AF0;
  unint64_t v13 = a5;
  int64_t v14 = a4;
  void v11[4] = self;
  id v12 = v8;
  id v9 = v8;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, v11);
  dispatch_async((dispatch_queue_t)self->_queue, v10);
}

- (void)_resetConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(SPXPCConnection *)connection setMessageHandler:0];
    [(SPXPCConnection *)self->_connection setDisconnectHandler:0];
    [(SPXPCConnection *)self->_connection shutdown];
    uint64_t v4 = self->_connection;
    self->_connection = 0;
  }
}

uint64_t __33__SPDaemonConnection__connection__block_invoke(uint64_t a1)
{
  WeakRetained = (CFDictionaryRef *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    context = WeakRetained;
    [(CFDictionaryRef *)WeakRetained _resetConnection];
    if (CFDictionaryGetCount(context[5])) {
      CFDictionaryApplyFunction(context[5], (CFDictionaryApplierFunction)queryReissueFunction, context);
    }
  }

  return MEMORY[0x270F9A758]();
}

void __33__SPDaemonConnection__connection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    v11[0] = 67109120;
    v11[1] = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v4, v5, "SPDC message QOS: %d", (uint8_t *)v11, 8u);
  }

  WeakRetained = (CFDictionaryRef *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = [v3 info];
    id v8 = [v7 objectForKey:@"QID"];
    unint64_t v9 = [v8 unsignedIntValue];

    dispatch_block_t v10 = CFDictionaryGetValue(WeakRetained[5], (const void *)v9);
    [v10 handleMessage:v3];
  }
}

- (void)_sendMessage:(id)a3 object:(id)a4 info:(id)a5 reply:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  int64_t v14 = [[SPXPCMessage alloc] initWithName:v13];

  [(SPXPCMessage *)v14 setRootObject:v12];
  [(SPXPCMessage *)v14 setInfo:v11];

  v15 = SPLogForSPLogCategoryDefault();
  os_log_type_t v16 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v25 = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v15, v16, "SPDC _sendMessage QOS: %d", buf, 8u);
  }

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SPDaemonConnection__sendMessage_object_info_reply___block_invoke;
  block[3] = &unk_2644B29E0;
  dispatch_block_t v22 = v14;
  id v23 = v10;
  block[4] = self;
  v18 = v14;
  id v19 = v10;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(connectionQueue, v20);
}

void __53__SPDaemonConnection__sendMessage_object_info_reply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v11 = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPDC QOS: %d", buf, 8u);
  }

  uint64_t v4 = *(void *)(a1 + 48);
  os_log_type_t v5 = [*(id *)(a1 + 32) _connection];
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__SPDaemonConnection__sendMessage_object_info_reply___block_invoke_19;
    void v8[3] = &unk_2644B29B8;
    id v9 = *(id *)(a1 + 48);
    [v6 sendMessage:v7 withReply:v8];

    uint64_t v6 = v9;
  }
  else
  {
    [v5 sendMessage:*(void *)(a1 + 40)];
  }
}

void __53__SPDaemonConnection__sendMessage_object_info_reply___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    v8[0] = 67109120;
    v8[1] = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v4, v5, "SPDC reply QOS: %d", (uint8_t *)v8, 8u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [v3 info];

  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void __64__SPDaemonConnection__sendInteractiveMessage_object_info_reply___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    v8[0] = 67109120;
    v8[1] = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v4, v5, "SPDC reply QOS: %d", (uint8_t *)v8, 8u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [v3 info];

  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (void)sendMessageForToken:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v74 = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v4, v5, "SPDC sendMessageForToken QOS: %d", buf, 8u);
  }

  uint64_t v6 = [v3 query];
  uint64_t v7 = [v6 queryContext];
  id v8 = [v7 searchEntities];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    qos_class_t v11 = [v7 searchEntities];
    uint64_t v12 = v11;
    if (v11 && [v11 count]) {
      [v10 encodeObject:v12 forKey:@"entities"];
    }
    uint64_t v13 = [v10 encodedData];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263EFF8F8] data];
  }
  v71[0] = @"BA";
  uint64_t v14 = [v6 disabledBundles];
  uint64_t v15 = MEMORY[0x263EFFA68];
  v66 = (void *)v14;
  if (v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = MEMORY[0x263EFFA68];
  }
  v72[0] = v16;
  v71[1] = @"AA";
  uint64_t v17 = [v6 disabledApps];
  v65 = (void *)v17;
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = v15;
  }
  v72[1] = v18;
  v71[2] = @"DA";
  uint64_t v19 = [v7 searchDomains];
  v64 = (void *)v19;
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v15;
  }
  v72[2] = v20;
  v71[3] = @"IP";
  v63 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "infinitePatience"));
  v72[3] = v63;
  v71[4] = @"DAS";
  v62 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "deviceAuthenticationState"));
  v72[4] = v62;
  v71[5] = @"WS";
  v61 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isWideScreen"));
  v72[5] = v61;
  v71[6] = @"FC";
  v60 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "contentFilters"));
  v72[6] = v60;
  v71[7] = @"KL";
  uint64_t v21 = [v7 keyboardLanguage];
  v59 = (void *)v21;
  if (v21) {
    dispatch_block_t v22 = (__CFString *)v21;
  }
  else {
    dispatch_block_t v22 = &stru_26CF85E78;
  }
  v72[7] = v22;
  v71[8] = @"KPL";
  uint64_t v23 = [v7 keyboardPrimaryLanguage];
  v58 = (void *)v23;
  if (v23) {
    v24 = (__CFString *)v23;
  }
  else {
    v24 = &stru_26CF85E78;
  }
  v72[8] = v24;
  v71[9] = @"SCF";
  qos_class_t v25 = NSNumber;
  [v7 scaleFactor];
  v57 = objc_msgSend(v25, "numberWithDouble:");
  v72[9] = v57;
  v71[10] = @"QC";
  v56 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v6, "maxCount"));
  v72[10] = v56;
  v71[11] = @"QI";
  v55 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "queryIdent"));
  v72[11] = v55;
  v71[12] = @"QID";
  v67 = v3;
  v54 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "queryID"));
  v72[12] = v54;
  v71[13] = @"QS";
  uint64_t v26 = [v7 searchString];
  v53 = (void *)v26;
  if (v26) {
    v27 = (__CFString *)v26;
  }
  else {
    v27 = &stru_26CF85E78;
  }
  v72[13] = v27;
  v71[14] = @"DDA";
  uint64_t v28 = [v7 disabledDomains];
  v52 = (void *)v28;
  if (v28) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = v15;
  }
  v72[14] = v29;
  v71[15] = @"QSMRA";
  uint64_t v30 = [v7 markedTextArray];
  v50 = (void *)v13;
  v51 = (void *)v30;
  if (v30) {
    uint64_t v31 = v30;
  }
  else {
    uint64_t v31 = v15;
  }
  v72[15] = v31;
  v71[16] = @"EA";
  uint64_t v32 = v13;
  if (!v13)
  {
    uint64_t v32 = [MEMORY[0x263EFF8F8] data];
  }
  v45 = (void *)v32;
  v72[16] = v32;
  v71[17] = @"WHY";
  v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "whyQuery"));
  v72[17] = v49;
  v71[18] = @"QK";
  v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "queryKind"));
  v72[18] = v48;
  v71[19] = @"NT";
  v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "noTokenize"));
  v72[19] = v47;
  v71[20] = @"RPP";
  v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "promoteParsecResults"));
  v72[20] = v33;
  v71[21] = @"RPL";
  v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "promoteLocalResults"));
  v72[21] = v34;
  v71[22] = @"InternalValidation";
  v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "internalValidation"));
  v72[22] = v35;
  v71[23] = @"InternalDebug";
  v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "internalDebug"));
  v72[23] = v36;
  v71[24] = @"CT";
  v37 = NSNumber;
  [v6 currentTime];
  v38 = objc_msgSend(v37, "numberWithDouble:");
  v72[24] = v38;
  v71[25] = @"DOCR";
  v39 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "disableOCR"));
  v72[25] = v39;
  v71[26] = @"FL2S";
  v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "fetchL2Signals"));
  v72[26] = v40;
  v71[27] = @"QU";
  uint64_t v41 = [v7 queryUnderstandingOutput];
  v42 = (void *)v41;
  uint64_t v43 = MEMORY[0x263EFFA78];
  if (v41) {
    uint64_t v43 = v41;
  }
  v72[27] = v43;
  v46 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:28];

  if (!v50) {
  v69[0] = MEMORY[0x263EF8330];
  }
  v69[1] = 3221225472;
  v69[2] = __42__SPDaemonConnection_sendMessageForToken___block_invoke;
  v69[3] = &unk_2644B2A08;
  id v70 = v67;
  id v44 = v67;
  [(SPDaemonConnection *)self _sendInteractiveMessage:@"OpenQuery" object:0 info:v46 reply:v69];
}

uint64_t __42__SPDaemonConnection_sendMessageForToken___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    v5[0] = 67109120;
    v5[1] = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPDC query did complete reply QOS: %d", (uint8_t *)v5, 8u);
  }

  return [*(id *)(a1 + 32) queryDidComplete];
}

- (id)startQuery:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  qos_class_t v11 = [[SPDaemonQueryToken alloc] initWithQuery:v10 queue:v9 delegate:v8];
  CFDictionarySetValue(self->_runningQueries, (const void *)[(SPDaemonQueryToken *)v11 queryID], v11);

  uint64_t v12 = _os_activity_create(&dword_21E5D7000, "query", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __48__SPDaemonConnection_startQuery_queue_delegate___block_invoke;
  v17[3] = &unk_2644B2990;
  v17[4] = self;
  uint64_t v13 = v11;
  uint64_t v18 = v13;
  os_activity_apply(v12, v17);
  uint64_t v14 = v18;
  uint64_t v15 = v13;

  return v15;
}

uint64_t __48__SPDaemonConnection_startQuery_queue_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendMessageForToken:*(void *)(a1 + 40)];
}

- (void)cancelQuery:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SPDaemonConnection_cancelQuery___block_invoke;
  block[3] = &unk_2644B2990;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(connectionQueue, block);
  uint64_t v7 = _os_activity_create(&dword_21E5D7000, "queryCancel", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__SPDaemonConnection_cancelQuery___block_invoke_2;
  v9[3] = &unk_2644B2990;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  os_activity_apply(v7, v9);
}

void __34__SPDaemonConnection_cancelQuery___block_invoke(uint64_t a1)
{
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 32) + 40), (const void *)[*(id *)(a1 + 40) queryID]);
  id v2 = [*(id *)(a1 + 40) query];
  [v2 cancel];
}

void __34__SPDaemonConnection_cancelQuery___block_invoke_2(uint64_t a1)
{
  v1 = NSDictionary;
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "queryID"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  os_log_type_t v3 = [v1 dictionaryWithObject:v4 forKey:@"QID"];
  [v2 _sendMessage:@"CloseQuery" object:0 info:v3 reply:&__block_literal_global_2];
}

- (void)activate
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SPDaemonConnection_activate__block_invoke;
  block[3] = &unk_2644B2A50;
  block[4] = self;
  os_log_type_t v3 = queue;
  qos_class_t v4 = qos_class_self();
  if (v4 < 0x1A) {
    dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  }
  else {
    dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
  }
  id v6 = v5;
  dispatch_async(v3, v5);
}

void __30__SPDaemonConnection_activate__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v7 = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPDC Activate QOS: %d", buf, 8u);
  }

  qos_class_t v4 = _os_activity_create(&dword_21E5D7000, "activation", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SPDaemonConnection_activate__block_invoke_120;
  block[3] = &unk_2644B2A50;
  block[4] = *(void *)(a1 + 32);
  os_activity_apply(v4, block);
}

uint64_t __30__SPDaemonConnection_activate__block_invoke_120(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendInteractiveMessage:@"Activate" object:0 info:0 reply:&__block_literal_global_125];
}

- (void)sendApps:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = _os_activity_create(&dword_21E5D7000, "apps", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __31__SPDaemonConnection_sendApps___block_invoke;
  v7[3] = &unk_2644B2990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

uint64_t __31__SPDaemonConnection_sendApps___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:@"Apps" object:*(void *)(a1 + 40) info:MEMORY[0x263EFFA78] reply:&__block_literal_global_133];
}

- (void)deactivate
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SPDaemonConnection_deactivate__block_invoke;
  block[3] = &unk_2644B2A50;
  block[4] = self;
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v3);
}

void __32__SPDaemonConnection_deactivate__block_invoke(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_21E5D7000, "deactivation", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__SPDaemonConnection_deactivate__block_invoke_2;
  block[3] = &unk_2644B2A50;
  block[4] = *(void *)(a1 + 32);
  os_activity_apply(v2, block);
}

uint64_t __32__SPDaemonConnection_deactivate__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:@"Deactivate" object:0 info:0 reply:0];
}

- (void)preheat
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SPDaemonConnection_preheat__block_invoke;
  block[3] = &unk_2644B2A50;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__SPDaemonConnection_preheat__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_DWORD *)buf = 67109120;
    qos_class_t v7 = qos_class_self();
    _os_log_impl(&dword_21E5D7000, v2, v3, "SPDC preheat QOS: %d", buf, 8u);
  }

  id v4 = _os_activity_create(&dword_21E5D7000, "preheat", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SPDaemonConnection_preheat__block_invoke_137;
  block[3] = &unk_2644B2A50;
  block[4] = *(void *)(a1 + 32);
  os_activity_apply(v4, block);
}

uint64_t __29__SPDaemonConnection_preheat__block_invoke_137(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:@"Preheat" object:0 info:0 reply:0];
}

- (void)clearInput:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SPDaemonConnection_clearInput___block_invoke;
  block[3] = &unk_2644B2A50;
  block[4] = self;
  dispatch_async(queue, block);
}

void __33__SPDaemonConnection_clearInput___block_invoke(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_21E5D7000, "queryClear", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SPDaemonConnection_clearInput___block_invoke_2;
  block[3] = &unk_2644B2A50;
  block[4] = *(void *)(a1 + 32);
  os_activity_apply(v2, block);
}

uint64_t __33__SPDaemonConnection_clearInput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:@"ClearInput" object:0 info:0 reply:0];
}

- (void)retrieveFirstTimeExperienceTextWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke;
  v7[3] = &unk_2644B2AC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_21E5D7000, "fte", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke_2;
  v4[3] = &unk_2644B2AC8;
  os_log_type_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  os_activity_apply(v2, v4);
}

void __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke_3;
  v2[3] = &unk_2644B2AA0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _sendMessage:@"RequestFTE" object:0 info:0 reply:v2];
}

void __63__SPDaemonConnection_retrieveFirstTimeExperienceTextWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"FTE"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestParsecParametersWithReply:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke;
  v7[3] = &unk_2644B2AC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_21E5D7000, "parsecparams", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke_2;
  v4[3] = &unk_2644B2AC8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  os_activity_apply(v2, v4);
}

void __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke_3;
  v2[3] = &unk_2644B2AA0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _sendMessage:@"RequestParsecParameters" object:0 info:0 reply:v2];
}

void __55__SPDaemonConnection_requestParsecParametersWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"PP"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)connectionQueue
{
  return self->_connectionQueue;
}

- (void)barrierOnXPC:(id)a3
{
  connection = self->_connection;
  if (connection) {
    [(SPXPCConnection *)connection barrier:a3];
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)dealloc
{
  [(SPDaemonConnection *)self _resetConnection];
  connectionQueue = self->_connectionQueue;
  if (connectionQueue && dispatch_get_specific("com.apple.search.XPCQueue") != self) {
    dispatch_sync(connectionQueue, &__block_literal_global_176);
  }
  runningQueries = self->_runningQueries;
  if (runningQueries) {
    CFRelease(runningQueries);
  }
  v5.receiver = self;
  v5.super_class = (Class)SPDaemonConnection;
  [(SPDaemonConnection *)&v5 dealloc];
}

- (NSString)daemonName
{
  return self->_daemonName;
}

- (void)setDaemonName:(id)a3
{
}

- (__CFDictionary)runningQueries
{
  return self->_runningQueries;
}

- (void)setRunningQueries:(__CFDictionary *)a3
{
  self->_runningQueries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonName, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end