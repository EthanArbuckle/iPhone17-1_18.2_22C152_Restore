@interface SSEventMonitor
- (SSEventMonitor)init;
- (SSEventMonitorDelegate)delegate;
- (void)_connectEventConnection;
- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SSEventMonitor

uint64_t __30__SSEventMonitor_setDelegate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 8) = *(void *)(result + 40);
  return result;
}

- (void)_connectEventConnection
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v6 = v5;
    }
    else {
      int v6 = v5 & 2;
    }
    if (v6)
    {
      LODWORD(v22) = 136446210;
      *(void *)((char *)&v22 + 4) = "-[SSEventMonitor _connectEventConnection]";
      LODWORD(v20) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v22, v20);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  if (!self->_eventConnection)
  {
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = &v22;
    uint64_t v23 = 0x3052000000;
    v24 = __Block_byref_object_copy__41;
    v25 = __Block_byref_object_dispose__41;
    v26 = self;
    v16 = objc_alloc_init(SSXPCConnection);
    self->_eventConnection = v16;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __41__SSEventMonitor__connectEventConnection__block_invoke;
    v21[3] = &unk_1E5BABBB0;
    v21[4] = self;
    v21[5] = &v22;
    [(SSXPCConnection *)v16 setMessageBlock:v21];
    _Block_object_dispose(&v22, 8);
  }
  v17 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 50);
  id v19 = [(SSXPCConnection *)self->_eventConnection createXPCEndpoint];
  xpc_dictionary_set_value(v18, "1", v19);
  xpc_release(v19);
  [(SSXPCConnection *)v17 sendMessage:v18];
  xpc_release(v18);
}

void __41__SSEventMonitor__connectEventConnection__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _handleMessage:*(void *)(a1 + 32) fromServerConnection:*(void *)(a1 + 40)];
  xpc_release(*(xpc_object_t *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  xpc_release(v2);
}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  objc_opt_class();
  CFArrayRef v6 = SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__SSEventMonitor__handleMessage_fromServerConnection___block_invoke;
    block[3] = &unk_1E5BA8630;
    block[4] = self;
    block[5] = v6;
    block[6] = v7;
    dispatch_async(delegateQueue, block);
  }
}

void __41__SSEventMonitor__connectEventConnection__block_invoke(uint64_t a1, void *a2, xpc_object_t object)
{
  xpc_retain(object);
  xpc_retain(a2);
  CFArrayRef v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSEventMonitor__connectEventConnection__block_invoke_2;
  block[3] = &unk_1E5BA8F70;
  uint64_t v7 = *(void *)(a1 + 40);
  block[5] = object;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(v6, block);
}

- (SSEventMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSEventMonitor;
  v2 = [(SSEventMonitor *)&v5 init];
  if (v2)
  {
    v2->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSEventMonitor.delegate", 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSEventMonitor", 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__DaemonLaunchNotification_2, @"com.apple.iTunesStore.daemon.launched", 0, CFNotificationSuspensionBehaviorCoalesce);
    [(SSEventMonitor *)v2 _connectEventConnection];
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__SSEventMonitor_setDelegate___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.iTunesStore.daemon.launched", 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue) {
    dispatch_release(delegateQueue);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_sync(dispatchQueue, &__block_literal_global_19);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
  }
  [(SSXPCConnection *)self->_eventConnection setMessageBlock:0];

  v6.receiver = self;
  v6.super_class = (Class)SSEventMonitor;
  [(SSEventMonitor *)&v6 dealloc];
}

- (SSEventMonitorDelegate)delegate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__41;
  uint64_t v10 = __Block_byref_object_dispose__41;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__SSEventMonitor_delegate__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (SSEventMonitorDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __26__SSEventMonitor_delegate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __54__SSEventMonitor__handleMessage_fromServerConnection___block_invoke(void *a1)
{
  id v2 = *(id *)(a1[4] + 8);
  [v2 eventMonitor:a1[4] receivedEventWithName:a1[5] userInfo:a1[6]];
}

@end