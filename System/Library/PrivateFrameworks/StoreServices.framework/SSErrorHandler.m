@interface SSErrorHandler
- (NSArray)failureTypes;
- (SSErrorHandler)init;
- (SSErrorHandlerDelegate)delegate;
- (void)_dispatchToDelegate:(id)a3;
- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4;
- (void)_openSessionWithMessage:(id)a3;
- (void)_reconnectToDaemonWithCompletionBlock:(id)a3;
- (void)_sendDisconnectMessage;
- (void)_tearDownConnections;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setFailureTypes:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)stopWithCompletionBlock:(id)a3;
@end

@implementation SSErrorHandler

- (SSErrorHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSErrorHandler;
  v2 = [(SSErrorHandler *)&v7 init];
  if (v2)
  {
    v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSErrorHandler.%p", v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v3 UTF8String], 0);

    v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSErrorHandler.delegate.%p", v2);
    v2->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v4 UTF8String], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__DaemonLaunchNotification_3, @"com.apple.iTunesStore.daemon.launched", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.iTunesStore.daemon.launched", 0);
  [(SSErrorHandler *)self _tearDownConnections];
  delegateQueue = self->_delegateQueue;
  if (delegateQueue) {
    dispatch_release(delegateQueue);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)SSErrorHandler;
  [(SSErrorHandler *)&v6 dealloc];
}

- (SSErrorHandlerDelegate)delegate
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__52;
  v10 = __Block_byref_object_dispose__52;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__SSErrorHandler_delegate__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSErrorHandlerDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __26__SSErrorHandler_delegate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)failureTypes
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__52;
  v10 = __Block_byref_object_dispose__52;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__SSErrorHandler_failureTypes__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__SSErrorHandler_failureTypes__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__SSErrorHandler_setDelegate___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __30__SSErrorHandler_setDelegate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(result + 40);
  return result;
}

- (void)setFailureTypes:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SSErrorHandler_setFailureTypes___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SSErrorHandler_setFailureTypes___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 40);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    id result = [*(id *)(v2 + 40) copy];
    *(void *)(*(void *)(v2 + 32) + 40) = result;
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__SSErrorHandler_startWithCompletionBlock___block_invoke;
  v4[3] = &unk_1E5BAA2E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__SSErrorHandler_startWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SSWeakReference weakReferenceWithObject:*(void *)(a1 + 32)];
  v3 = *(void **)(a1 + 32);
  if (!v3[1])
  {
    *(void *)(*(void *)(a1 + 32) + 8) = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    v4 = *(void **)(*(void *)(a1 + 32) + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__SSErrorHandler_startWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E5BA73F8;
    v8[4] = v2;
    [v4 setDisconnectBlock:v8];
    v3 = *(void **)(a1 + 32);
  }
  if (!v3[6])
  {
    *(void *)(*(void *)(a1 + 32) + 48) = objc_alloc_init(SSXPCConnection);
    v5 = *(void **)(*(void *)(a1 + 32) + 48);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__SSErrorHandler_startWithCompletionBlock___block_invoke_3;
    v7[3] = &unk_1E5BAB7E8;
    v7[4] = v2;
    [v5 setMessageBlock:v7];
    v3 = *(void **)(a1 + 32);
  }
  return [v3 _reconnectToDaemonWithCompletionBlock:*(void *)(a1 + 40)];
}

uint64_t __43__SSErrorHandler_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) object];
  return [v1 _sendDisconnectMessage];
}

uint64_t __43__SSErrorHandler_startWithCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = (void *)[*(id *)(a1 + 32) object];
  return [v5 _handleMessage:a2 fromServerConnection:a3];
}

- (void)stopWithCompletionBlock:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SSErrorHandler_stopWithCompletionBlock___block_invoke;
  v4[3] = &unk_1E5BAA2E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __42__SSErrorHandler_stopWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _tearDownConnections];
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    dispatch_async(v3, v2);
  }
}

- (void)_dispatchToDelegate:(id)a3
{
}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SSErrorHandler__handleMessage_fromServerConnection___block_invoke;
  block[3] = &unk_1E5BA8630;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __54__SSErrorHandler__handleMessage_fromServerConnection___block_invoke(uint64_t a1)
{
  if (xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "0") == 1012) {
    [*(id *)(a1 + 40) _openSessionWithMessage:*(void *)(a1 + 32)];
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 48);
  xpc_release(v2);
}

- (void)_openSessionWithMessage:(id)a3
{
  v5 = objc_alloc_init(SSErrorHandlerSession);
  [(SSErrorHandlerSession *)v5 _setControlConnection:self->_controlConnection];
  [(SSErrorHandlerSession *)v5 _setSessionID:xpc_dictionary_get_int64(a3, "1")];
  objc_opt_class();
  CFArrayRef v6 = SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
  [(SSErrorHandlerSession *)v5 _setErrorProperties:v6];

  delegate = self->_delegate;
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__SSErrorHandler__openSessionWithMessage___block_invoke;
    block[3] = &unk_1E5BA8630;
    block[4] = delegate;
    block[5] = self;
    block[6] = v5;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    [(SSErrorHandlerSession *)v5 performDefaultHandling];
  }
}

uint64_t __42__SSErrorHandler__openSessionWithMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) errorHandler:*(void *)(a1 + 40) handleSession:*(void *)(a1 + 48)];
}

- (void)_reconnectToDaemonWithCompletionBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v24 = 136446210;
      v25 = "-[SSErrorHandler _reconnectToDaemonWithCompletionBlock:]";
      LODWORD(v22) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v24, v22);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 96);
  SSXPCDictionarySetCFObject(v18, "2", (__CFString *)self->_failureTypes);
  id v19 = [(SSXPCConnection *)self->_observerConnection createXPCEndpoint];
  xpc_dictionary_set_value(v18, "1", v19);
  xpc_release(v19);
  v20 = +[SSWeakReference weakReferenceWithObject:self];
  controlConnection = self->_controlConnection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__SSErrorHandler__reconnectToDaemonWithCompletionBlock___block_invoke;
  v23[3] = &unk_1E5BAAAE0;
  v23[4] = v20;
  v23[5] = a3;
  [(SSXPCConnection *)controlConnection sendMessage:v18 withReply:v23];
  xpc_release(v18);
}

void __56__SSErrorHandler__reconnectToDaemonWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) object];
  if (*(void *)(a1 + 40)) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    int v6 = (void *)v4;
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      id v7 = (id)SSError(@"SSErrorDomain", 121, 0, 0);
      BOOL v8 = 0;
    }
    else
    {
      id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      BOOL v8 = xpc_dictionary_get_BOOL(a2, "1");
      if (v8)
      {
LABEL_11:
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __56__SSErrorHandler__reconnectToDaemonWithCompletionBlock___block_invoke_2;
        v10[3] = &unk_1E5BACBD0;
        uint64_t v9 = *(void *)(a1 + 40);
        BOOL v11 = v8;
        v10[4] = v7;
        v10[5] = v9;
        [v6 _dispatchToDelegate:v10];

        return;
      }
    }
    if (!v7) {
      id v7 = (id)SSError(@"SSErrorDomain", 100, 0, 0);
    }
    goto LABEL_11;
  }
}

uint64_t __56__SSErrorHandler__reconnectToDaemonWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_sendDisconnectMessage
{
  v3 = [(SSErrorHandler *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__SSErrorHandler__sendDisconnectMessage__block_invoke;
    v5[3] = &unk_1E5BA7448;
    v5[4] = v3;
    v5[5] = self;
    dispatch_async(delegateQueue, v5);
  }
}

uint64_t __40__SSErrorHandler__sendDisconnectMessage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) errorHandlerDidDisconnect:*(void *)(a1 + 40)];
}

- (void)_tearDownConnections
{
  self->_controlConnection = 0;
  [(SSXPCConnection *)self->_observerConnection setMessageBlock:0];

  self->_observerConnection = 0;
}

@end