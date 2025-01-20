@interface SSDownloadHandler
- (BOOL)_sendAuthenticationSessionWithMessage:(id)a3;
- (BOOL)_sendSessionCancelWithMessage:(id)a3;
- (BOOL)_sendSessionHandleWithMessage:(id)a3;
- (BOOL)_sendSessionPauseWithMessage:(id)a3;
- (BOOL)sessionsNeedPowerAssertion;
- (BOOL)sessionsShouldBlockOtherDownloads;
- (NSArray)downloadPhasesToIgnore;
- (SSDownloadHandler)init;
- (SSDownloadHandlerDelegate)delegate;
- (id)_controlConnection;
- (id)_newSessionWithMessage:(id)a3;
- (id)description;
- (int64_t)handlerIdentifier;
- (void)_connectToDaemon;
- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4;
- (void)_sendDisconnectMessage;
- (void)_setValue:(id)a3 forProperty:(const char *)a4;
- (void)dealloc;
- (void)resetDisavowedSessions;
- (void)setDelegate:(id)a3;
- (void)setDownloadPhasesToIgnore:(id)a3;
- (void)setSessionsNeedPowerAssertion:(BOOL)a3;
- (void)setSessionsShouldBlockOtherDownloads:(BOOL)a3;
@end

@implementation SSDownloadHandler

- (SSDownloadHandler)init
{
  v11.receiver = self;
  v11.super_class = (Class)SSDownloadHandler;
  v2 = [(SSDownloadHandler *)&v11 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_sessionsNeedPowerAssertion = 257;
    v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.storeservices.SSDownloadHandler.%p", v2);
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v4 UTF8String], 0);

    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.storeservices.SSDownloadHandler.delegate.%p", v3);
    v3->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v5 UTF8String], 0);

    CFUUIDRef v6 = CFUUIDCreate(0);
    v3->_handlerID = *(_OWORD *)&CFUUIDGetUUIDBytes(v6);
    CFRelease(v6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__DaemonLaunchNotification_0, @"com.apple.iTunesStore.daemon.launched", 0, CFNotificationSuspensionBehaviorCoalesce);
    dispatchQueue = v3->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __25__SSDownloadHandler_init__block_invoke;
    block[3] = &unk_1E5BA73F8;
    block[4] = v3;
    dispatch_async(dispatchQueue, block);
  }
  return v3;
}

uint64_t __25__SSDownloadHandler_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToDaemon];
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
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__SSDownloadHandler_dealloc__block_invoke;
    block[3] = &unk_1E5BA73F8;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadHandler;
  [(SSDownloadHandler *)&v6 dealloc];
}

void __28__SSDownloadHandler_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setMessageBlock:0];

  v2 = *(void **)(*(void *)(a1 + 32) + 8);
}

- (SSDownloadHandlerDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__SSDownloadHandler_delegate__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSDownloadHandlerDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __29__SSDownloadHandler_delegate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)downloadPhasesToIgnore
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSDownloadHandler_downloadPhasesToIgnore__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__SSDownloadHandler_downloadPhasesToIgnore__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)handlerIdentifier
{
  return self->_handlerID;
}

- (void)resetDisavowedSessions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
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
    if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v6 = v5;
    }
    else {
      int v6 = v5 & 2;
    }
    if (v6)
    {
      int v18 = 136446210;
      v19 = "-[SSDownloadHandler resetDisavowedSessions]";
      LODWORD(v17) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v18, v17);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 40);
  xpc_dictionary_set_int64(v16, "1", self->_handlerID);
  [(SSXPCConnection *)self->_controlConnection sendMessage:v16];
  xpc_release(v16);
}

- (BOOL)sessionsNeedPowerAssertion
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SSDownloadHandler_sessionsNeedPowerAssertion__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSDownloadHandler_sessionsNeedPowerAssertion__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 64);
  return result;
}

- (BOOL)sessionsShouldBlockOtherDownloads
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SSDownloadHandler_sessionsShouldBlockOtherDownloads__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__SSDownloadHandler_sessionsShouldBlockOtherDownloads__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 65);
  return result;
}

- (void)setDelegate:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SSDownloadHandler_setDelegate___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __33__SSDownloadHandler_setDelegate___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(result + 40);
  return result;
}

- (void)setDownloadPhasesToIgnore:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__SSDownloadHandler_setDownloadPhasesToIgnore___block_invoke;
  v8[3] = &unk_1E5BA7448;
  v8[4] = self;
  v8[5] = a3;
  dispatch_sync(dispatchQueue, v8);
  if (a3) {
    xpc_object_t v6 = SSXPCCreateXPCObjectFromCFObject((__CFString *)a3);
  }
  else {
    xpc_object_t v6 = xpc_null_create();
  }
  uint64_t v7 = v6;
  [(SSDownloadHandler *)self _setValue:v6 forProperty:"1"];
  xpc_release(v7);
}

uint64_t __47__SSDownloadHandler_setDownloadPhasesToIgnore___block_invoke(uint64_t result)
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

- (void)setSessionsNeedPowerAssertion:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SSDownloadHandler_setSessionsNeedPowerAssertion___block_invoke;
  v7[3] = &unk_1E5BA8488;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_sync(dispatchQueue, v7);
  xpc_object_t v6 = xpc_BOOL_create(a3);
  [(SSDownloadHandler *)self _setValue:v6 forProperty:"0"];
  xpc_release(v6);
}

uint64_t __51__SSDownloadHandler_setSessionsNeedPowerAssertion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 64) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setSessionsShouldBlockOtherDownloads:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SSDownloadHandler_setSessionsShouldBlockOtherDownloads___block_invoke;
  v7[3] = &unk_1E5BA8488;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_sync(dispatchQueue, v7);
  xpc_object_t v6 = xpc_BOOL_create(a3);
  [(SSDownloadHandler *)self _setValue:v6 forProperty:"2"];
  xpc_release(v6);
}

uint64_t __58__SSDownloadHandler_setSessionsShouldBlockOtherDownloads___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 65) = *(unsigned char *)(result + 40);
  return result;
}

- (id)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__33;
  uint64_t v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SSDownloadHandler_description__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSDownloadHandler_description__block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SSDownloadHandler;
  uint64_t result = [v2 initWithFormat:@"%@: Blocks: %d, Ignores: (%@)", objc_msgSendSuper2(&v4, sel_description), *(unsigned __int8 *)(*(void *)(a1 + 32) + 65), *(void *)(*(void *)(a1 + 32) + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_connectToDaemon
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
    if (os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v6 = v5;
    }
    else {
      int v6 = v5 & 2;
    }
    if (v6)
    {
      int v39 = 136446210;
      v40 = "-[SSDownloadHandler _connectToDaemon]";
      LODWORD(v36) = 12;
      v35 = &v39;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v39, v36);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  xpc_object_t v16 = +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self, v35);
  if (!self->_controlConnection)
  {
    uint64_t v17 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    self->_controlConnection = v17;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __37__SSDownloadHandler__connectToDaemon__block_invoke;
    v38[3] = &unk_1E5BA73F8;
    v38[4] = v16;
    [(SSXPCConnection *)v17 setDisconnectBlock:v38];
  }
  if (!self->_observerConnection)
  {
    int v18 = objc_alloc_init(SSXPCConnection);
    self->_observerConnection = v18;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __37__SSDownloadHandler__connectToDaemon__block_invoke_2;
    v37[3] = &unk_1E5BAB7E8;
    v37[4] = v16;
    [(SSXPCConnection *)v18 setMessageBlock:v37];
  }
  id v19 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v19) {
    id v19 = +[SSLogConfig sharedConfig];
  }
  int v20 = [v19 shouldLog];
  if ([v19 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  if (!os_log_type_enabled((os_log_t)[v19 OSLogObject], OS_LOG_TYPE_INFO)) {
    v21 &= 2u;
  }
  if (v21)
  {
    uint64_t v22 = objc_opt_class();
    int64_t handlerID = self->_handlerID;
    int v39 = 138412546;
    v40 = (const char *)v22;
    __int16 v41 = 2048;
    int64_t v42 = handlerID;
    LODWORD(v36) = 22;
    uint64_t v24 = _os_log_send_and_compose_impl();
    if (v24)
    {
      v25 = (void *)v24;
      uint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v39, v36);
      free(v25);
      SSFileLog(v19, @"%@", v27, v28, v29, v30, v31, v32, v26);
    }
  }
  xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v33, "0", 3);
  xpc_dictionary_set_int64(v33, "1", self->_handlerID);
  xpc_dictionary_set_BOOL(v33, "3", self->_sessionsShouldBlockOtherDownloads);
  SSXPCDictionarySetCFObject(v33, "4", (__CFString *)self->_downloadPhasesToIgnore);
  xpc_dictionary_set_BOOL(v33, "5", self->_sessionsNeedPowerAssertion);
  id v34 = [(SSXPCConnection *)self->_observerConnection createXPCEndpoint];
  xpc_dictionary_set_value(v33, "2", v34);
  xpc_release(v34);
  [(SSXPCConnection *)self->_controlConnection sendMessage:v33];
  xpc_release(v33);
}

uint64_t __37__SSDownloadHandler__connectToDaemon__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) object];
  return [v1 _sendDisconnectMessage];
}

uint64_t __37__SSDownloadHandler__connectToDaemon__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = (void *)[*(id *)(a1 + 32) object];
  return [v5 _handleMessage:a2 fromServerConnection:a3];
}

- (id)_controlConnection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__33;
  uint64_t v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SSDownloadHandler__controlConnection__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __39__SSDownloadHandler__controlConnection__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  xpc_retain(a3);
  xpc_retain(a4);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SSDownloadHandler__handleMessage_fromServerConnection___block_invoke;
  block[3] = &unk_1E5BA8630;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __57__SSDownloadHandler__handleMessage_fromServerConnection___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "0");
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
  if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 48);
    int v25 = 138412802;
    uint64_t v26 = v6;
    __int16 v27 = 2048;
    uint64_t v28 = v7;
    __int16 v29 = 2048;
    int64_t v30 = int64;
    LODWORD(v21) = 32;
    uint64_t v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v25, v21);
      free(v9);
      SSFileLog(v3, @"%@", v11, v12, v13, v14, v15, v16, v10);
    }
  }
  if ((unint64_t)(int64 - 1000) <= 5 && ((1 << (int64 + 24)) & 0x27) != 0)
  {
    xpc_retain(*(xpc_object_t *)(a1 + 32));
    xpc_retain(*(xpc_object_t *)(a1 + 48));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    uint64_t v17 = *(void *)(a1 + 32);
    long long v18 = *(_OWORD *)(a1 + 40);
    id v19 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    block[2] = __57__SSDownloadHandler__handleMessage_fromServerConnection___block_invoke_27;
    block[3] = &unk_1E5BAB810;
    block[4] = v17;
    int64_t v24 = int64;
    long long v23 = v18;
    dispatch_async(v19, block);
  }
  else if (int64)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), reply);
    xpc_release(reply);
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 48));
}

void __57__SSDownloadHandler__handleMessage_fromServerConnection___block_invoke_27(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  BOOL v3 = 0;
  switch(*(void *)(a1 + 56))
  {
    case 0x3E8:
      char v4 = [*(id *)(a1 + 40) _sendSessionHandleWithMessage:*(void *)(a1 + 32)];
      goto LABEL_6;
    case 0x3E9:
      char v4 = [*(id *)(a1 + 40) _sendSessionCancelWithMessage:*(void *)(a1 + 32)];
      goto LABEL_6;
    case 0x3EALL:
      char v4 = [*(id *)(a1 + 40) _sendSessionPauseWithMessage:*(void *)(a1 + 32)];
      goto LABEL_6;
    case 0x3EDLL:
      char v4 = [*(id *)(a1 + 40) _sendAuthenticationSessionWithMessage:*(void *)(a1 + 32)];
LABEL_6:
      BOOL v3 = v4;
      break;
    default:
      break;
  }
  xpc_dictionary_set_BOOL(reply, "0", v3);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  int v5 = *(void **)(a1 + 48);
  xpc_release(v5);
}

- (id)_newSessionWithMessage:(id)a3
{
  int v5 = [SSDownloadHandlerSession alloc];
  id v6 = [(SSDownloadHandler *)self _controlConnection];
  return [(SSDownloadHandlerSession *)v5 _initWithMessage:a3 controlConnection:v6];
}

- (BOOL)_sendAuthenticationSessionWithMessage:(id)a3
{
  int v5 = [(SSDownloadHandler *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  if (v6)
  {
    id v7 = [(SSDownloadSession *)[SSDownloadAuthenticationSession alloc] _initWithMessage:a3 controlConnection:[(SSDownloadHandler *)self _controlConnection]];
    uint64_t v8 = self;
    [(SSDownloadHandlerDelegate *)v5 downloadHandler:self handleAuthenticationSession:v7];
  }
  return v6 & 1;
}

- (void)_sendDisconnectMessage
{
  BOOL v3 = [(SSDownloadHandler *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v4 = self;
    [(SSDownloadHandlerDelegate *)v3 downloadHandlerDidDisconnect:self];
  }
}

- (BOOL)_sendSessionCancelWithMessage:(id)a3
{
  int v5 = [(SSDownloadHandler *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  if (v6)
  {
    id v7 = [(SSDownloadHandler *)self _newSessionWithMessage:a3];
    uint64_t v8 = self;
    [(SSDownloadHandlerDelegate *)v5 downloadHandler:self cancelSession:v7];
  }
  return v6 & 1;
}

- (BOOL)_sendSessionHandleWithMessage:(id)a3
{
  int v5 = [(SSDownloadHandler *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  if (v6)
  {
    id v7 = [(SSDownloadHandler *)self _newSessionWithMessage:a3];
    uint64_t v8 = self;
    [(SSDownloadHandlerDelegate *)v5 downloadHandler:self handleSession:v7];
  }
  return v6 & 1;
}

- (BOOL)_sendSessionPauseWithMessage:(id)a3
{
  int v5 = [(SSDownloadHandler *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v6 = [(SSDownloadHandler *)self _newSessionWithMessage:a3];
  id v7 = self;
  char v8 = [(SSDownloadHandlerDelegate *)v5 downloadHandler:self pauseSession:v6];

  return v8;
}

- (void)_setValue:(id)a3 forProperty:(const char *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v10 = v9;
    }
    else {
      int v10 = v9 & 2;
    }
    if (v10)
    {
      int v23 = 136446210;
      int64_t v24 = "-[SSDownloadHandler _setValue:forProperty:]";
      LODWORD(v22) = 12;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v23, v22);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 31);
  xpc_dictionary_set_int64(v20, "1", self->_handlerID);
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v21, a4, a3);
  xpc_dictionary_set_value(v20, "2", v21);
  xpc_release(v21);
  [(SSXPCConnection *)self->_controlConnection sendMessage:v20];
  xpc_release(v20);
}

@end