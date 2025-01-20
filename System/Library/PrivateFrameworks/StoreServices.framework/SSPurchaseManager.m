@interface SSPurchaseManager
- (BOOL)_resultForReply:(id)a3 error:(id *)a4;
- (BOOL)_shouldInvalidateSubscriptionStatusForPurchaseResponse:(id)a3;
- (NSString)managerIdentifier;
- (SSPurchaseManager)init;
- (SSPurchaseManager)initWithManagerIdentifier:(id)a3;
- (SSPurchaseManagerDelegate)delegate;
- (id)_newEncodedArrayWithPurchaseIdentifiers:(id)a3;
- (id)_newEncodedArrayWithPurchases:(id)a3;
- (id)_requestConnection;
- (id)_responseConnection;
- (void)_connectToDaemon;
- (void)_handleAuthenticateRequest:(id)a3 fromConnection:(id)a4;
- (void)_handleMessage:(id)a3 fromConnection:(id)a4;
- (void)_handlePurchasesFinished:(id)a3 fromConnection:(id)a4;
- (void)_reconnectForDaemonLaunch;
- (void)_sendCompletionBlock:(id)a3 forGetPurchasesReply:(id)a4;
- (void)_sendCompletionBlock:(id)a3 forStandardReply:(id)a4;
- (void)_sendMessage:(int64_t)a3 withPurchaseIdentifiers:(id)a4 afterPurchase:(id)a5 completionBlock:(id)a6;
- (void)_sendMessage:(int64_t)a3 withPurchases:(id)a4 afterPurchase:(id)a5 completionBlock:(id)a6;
- (void)addPurchases:(id)a3 withCompletionBlock:(id)a4;
- (void)cancelPurchases:(id)a3 withCompletionBlock:(id)a4;
- (void)dealloc;
- (void)getPurchasesUsingBlock:(id)a3;
- (void)insertPurchases:(id)a3 afterPurchase:(id)a4 withCompletionBlock:(id)a5;
- (void)movePurchases:(id)a3 afterPurchase:(id)a4 withCompletionBlock:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SSPurchaseManager

uint64_t __44__SSPurchaseManager_getPurchasesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = (void *)[*(id *)(a1 + 32) object];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _sendCompletionBlock:v5 forGetPurchasesReply:a2];
}

uint64_t __40__SSPurchaseManager__responseConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) object];
  return [v5 _handleMessage:a2 fromConnection:a3];
}

- (void)_handleMessage:(id)a3 fromConnection:(id)a4
{
  int64_t int64 = xpc_dictionary_get_int64(a3, "0");
  if (int64 == 1101)
  {
    [(SSPurchaseManager *)self _handlePurchasesFinished:a3 fromConnection:a4];
  }
  else if (int64 == 1100)
  {
    [(SSPurchaseManager *)self _handleAuthenticateRequest:a3 fromConnection:a4];
  }
}

uint64_t __63__SSPurchaseManager__sendCompletionBlock_forGetPurchasesReply___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __33__SSPurchaseManager_setDelegate___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = *(void *)(result + 40);
  if (!v2) {
    return [*(id *)(result + 32) _connectToDaemon];
  }
  return result;
}

- (void)_connectToDaemon
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
      int v21 = 136446210;
      v22 = "-[SSPurchaseManager _connectToDaemon]";
      LODWORD(v20) = 12;
      v19 = &v21;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v21, v20);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  xpc_object_t v16 = SSXPCCreateMessageDictionary(104);
  SSXPCDictionarySetCFObject(v16, "1", (__CFString *)self->_managerIdentifier);
  v17 = objc_msgSend(-[SSPurchaseManager _responseConnection](self, "_responseConnection"), "createXPCEndpoint");
  if (v17)
  {
    v18 = v17;
    xpc_dictionary_set_value(v16, "2", v17);
    xpc_release(v18);
  }
  +[SSAuthenticateRequest localAuthenticationAvailable];
  xpc_dictionary_set_BOOL(v16, "3", 0);
  objc_msgSend(-[SSPurchaseManager _requestConnection](self, "_requestConnection"), "sendMessage:withReply:", v16, &__block_literal_global_29);
  xpc_release(v16);
}

void __44__SSPurchaseManager_getPurchasesUsingBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = SSXPCCreateMessageDictionary(100);
  id v3 = +[SSWeakReference weakReferenceWithObject:*(void *)(a1 + 32)];
  int v4 = (void *)[*(id *)(a1 + 32) _requestConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SSPurchaseManager_getPurchasesUsingBlock___block_invoke_2;
  v6[3] = &unk_1E5BAAAE0;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = v3;
  v6[5] = v5;
  [v4 sendMessage:v2 withReply:v6];
  xpc_release(v2);
}

- (id)_requestConnection
{
  id result = self->_requestConnection;
  if (!result)
  {
    id result = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    self->_requestConnection = (SSXPCConnection *)result;
  }
  return result;
}

- (id)_responseConnection
{
  id result = self->_responseConnection;
  if (!result)
  {
    self->_responseConnection = objc_alloc_init(SSXPCConnection);
    int v4 = +[SSWeakReference weakReferenceWithObject:self];
    responseConnection = self->_responseConnection;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__SSPurchaseManager__responseConnection__block_invoke;
    v6[3] = &unk_1E5BAB7E8;
    v6[4] = v4;
    [(SSXPCConnection *)responseConnection setMessageBlock:v6];
    return self->_responseConnection;
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SSPurchaseManager_setDelegate___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_sendCompletionBlock:(id)a3 forGetPurchasesReply:(id)a4
{
  if (a3)
  {
    uint64_t v13 = 0;
    id v7 = 0;
    if ([(SSPurchaseManager *)self _resultForReply:a4 error:&v13])
    {
      xpc_object_t value = xpc_dictionary_get_value(a4, "2");
      if (value && (uint64_t v9 = value, MEMORY[0x1A62689E0]() == MEMORY[0x1E4F14568]))
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        applier[0] = MEMORY[0x1E4F143A8];
        applier[1] = 3221225472;
        applier[2] = __63__SSPurchaseManager__sendCompletionBlock_forGetPurchasesReply___block_invoke;
        applier[3] = &unk_1E5BA86F8;
        applier[4] = v7;
        xpc_array_apply(v9, applier);
      }
      else
      {
        id v7 = 0;
      }
    }
    completionBlockQueue = self->_completionBlockQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SSPurchaseManager__sendCompletionBlock_forGetPurchasesReply___block_invoke_2;
    block[3] = &unk_1E5BA8608;
    block[4] = v7;
    block[5] = v13;
    block[6] = a3;
    dispatch_async(completionBlockQueue, block);
  }
}

- (BOOL)_resultForReply:(id)a3 error:(id *)a4
{
  if (a3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v6 = 121;
LABEL_6:
    id v7 = (id)SSError(@"SSErrorDomain", v6, 0, 0);
    BOOL v8 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (!a3 || MEMORY[0x1A62689E0](a3, a2) != MEMORY[0x1E4F14590])
  {
    uint64_t v6 = 111;
    goto LABEL_6;
  }
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
  BOOL v8 = xpc_dictionary_get_BOOL(a3, "0");
  if (!a4) {
    goto LABEL_9;
  }
LABEL_7:
  if (!v8) {
    *a4 = v7;
  }
LABEL_9:
  id v9 = v7;
  return v8;
}

- (SSPurchaseManager)initWithManagerIdentifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SSPurchaseManager;
  int v4 = [(SSPurchaseManager *)&v9 init];
  if (v4)
  {
    v4->_managerIdentifier = (NSString *)[a3 copy];
    uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"com.apple.StoreServices.SSPurchaseManager.%@.%p", a3, v4];
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v5 UTF8String], 0);

    uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"com.apple.StoreServices.SSPurchaseManager.completion.%@.%p", a3, v4];
    v4->_completionBlockQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v6 UTF8String], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)__DaemonLaunchNotification_4, @"com.apple.iTunesStore.daemon.launched", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v4;
}

- (void)getPurchasesUsingBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
      int v21 = 136446210;
      v22 = "-[SSPurchaseManager getPurchasesUsingBlock:]";
      LODWORD(v19) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v21, v19);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SSPurchaseManager_getPurchasesUsingBlock___block_invoke;
  block[3] = &unk_1E5BAA2E0;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

- (SSPurchaseManager)init
{
  return [(SSPurchaseManager *)self initWithManagerIdentifier:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.iTunesStore.daemon.launched", 0);
  completionBlockQueue = self->_completionBlockQueue;
  if (completionBlockQueue) {
    dispatch_release(completionBlockQueue);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  [(SSXPCConnection *)self->_responseConnection setMessageBlock:0];
  v6.receiver = self;
  v6.super_class = (Class)SSPurchaseManager;
  [(SSPurchaseManager *)&v6 dealloc];
}

- (void)addPurchases:(id)a3 withCompletionBlock:(id)a4
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
    if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v10 = v9;
    }
    else {
      int v10 = v9 & 2;
    }
    if (v10)
    {
      int v23 = 136446210;
      v24 = "-[SSPurchaseManager addPurchases:withCompletionBlock:]";
      LODWORD(v21) = 12;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v23, v21);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SSPurchaseManager_addPurchases_withCompletionBlock___block_invoke;
  block[3] = &unk_1E5BA8FC0;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __54__SSPurchaseManager_addPurchases_withCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:98 withPurchases:*(void *)(a1 + 40) afterPurchase:0 completionBlock:*(void *)(a1 + 48)];
}

- (void)cancelPurchases:(id)a3 withCompletionBlock:(id)a4
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
    if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v10 = v9;
    }
    else {
      int v10 = v9 & 2;
    }
    if (v10)
    {
      int v23 = 136446210;
      v24 = "-[SSPurchaseManager cancelPurchases:withCompletionBlock:]";
      LODWORD(v21) = 12;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v23, v21);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SSPurchaseManager_cancelPurchases_withCompletionBlock___block_invoke;
  block[3] = &unk_1E5BA8FC0;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __57__SSPurchaseManager_cancelPurchases_withCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:99 withPurchaseIdentifiers:*(void *)(a1 + 40) afterPurchase:0 completionBlock:*(void *)(a1 + 48)];
}

- (SSPurchaseManagerDelegate)delegate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__63;
  int v10 = __Block_byref_object_dispose__63;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__SSPurchaseManager_delegate__block_invoke;
  v5[3] = &unk_1E5BA7688;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (SSPurchaseManagerDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __29__SSPurchaseManager_delegate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)insertPurchases:(id)a3 afterPurchase:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v9 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v12 = v11;
    }
    else {
      int v12 = v11 & 2;
    }
    if (v12)
    {
      int v25 = 136446210;
      v26 = "-[SSPurchaseManager insertPurchases:afterPurchase:withCompletionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v25, v23);
        free(v14);
        SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SSPurchaseManager_insertPurchases_afterPurchase_withCompletionBlock___block_invoke;
  block[3] = &unk_1E5BAD7C8;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  dispatch_async(dispatchQueue, block);
}

uint64_t __71__SSPurchaseManager_insertPurchases_afterPurchase_withCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:102 withPurchases:*(void *)(a1 + 40) afterPurchase:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 56)];
}

- (NSString)managerIdentifier
{
  xpc_object_t v2 = self->_managerIdentifier;
  return v2;
}

- (void)movePurchases:(id)a3 afterPurchase:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v9 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v12 = v11;
    }
    else {
      int v12 = v11 & 2;
    }
    if (v12)
    {
      int v25 = 136446210;
      v26 = "-[SSPurchaseManager movePurchases:afterPurchase:withCompletionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v25, v23);
        free(v14);
        SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SSPurchaseManager_movePurchases_afterPurchase_withCompletionBlock___block_invoke;
  block[3] = &unk_1E5BAD7C8;
  block[4] = self;
  block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  dispatch_async(dispatchQueue, block);
}

uint64_t __69__SSPurchaseManager_movePurchases_afterPurchase_withCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendMessage:103 withPurchaseIdentifiers:*(void *)(a1 + 40) afterPurchase:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 56)];
}

- (void)_handleAuthenticateRequest:(id)a3 fromConnection:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  xpc_object_t value = xpc_dictionary_get_value(a3, "1");
  if (value)
  {
    uint64_t v8 = [[SSAuthenticationContext alloc] initWithXPCEncoding:value];
    id v9 = +[SSLogConfig sharedStoreServicesConfig];
    id v10 = v9;
    if (v8)
    {
      if (!v9) {
        id v10 = +[SSLogConfig sharedConfig];
      }
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v12 &= 2u;
      }
      if (v12)
      {
        int v36 = 138543618;
        uint64_t v37 = objc_opt_class();
        __int16 v38 = 2114;
        uint64_t v39 = [(SSAuthenticationContext *)v8 logUUID];
        LODWORD(v34) = 22;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v36, v34);
          free(v14);
          SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, v15);
        }
      }
      v22 = [[SSAuthenticateRequest alloc] initWithAuthenticationContext:v8];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __63__SSPurchaseManager__handleAuthenticateRequest_fromConnection___block_invoke;
      v35[3] = &unk_1E5BAD7F0;
      v35[4] = self;
      v35[5] = v8;
      v35[6] = a3;
      v35[7] = a4;
      [(SSAuthenticateRequest *)v22 startWithAuthenticateResponseBlock:v35];
    }
    else
    {
      if (!v9) {
        id v10 = +[SSLogConfig sharedConfig];
      }
      int v23 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v24 = v23 | 2;
      }
      else {
        int v24 = v23;
      }
      if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v24 &= 2u;
      }
      if (v24)
      {
        int v36 = 138543362;
        uint64_t v37 = objc_opt_class();
        LODWORD(v34) = 12;
        uint64_t v25 = _os_log_send_and_compose_impl();
        if (v25)
        {
          v26 = (void *)v25;
          uint64_t v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v36, v34);
          free(v26);
          SSFileLog(v10, @"%@", v28, v29, v30, v31, v32, v33, v27);
        }
      }
    }
  }
}

void __63__SSPurchaseManager__handleAuthenticateRequest_fromConnection___block_invoke(uint64_t a1, SSAuthenticateResponse *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [*(id *)(a1 + 40) logUUID];
    int v24 = 138543874;
    uint64_t v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v10;
    __int16 v28 = 2114;
    uint64_t v29 = a3;
    LODWORD(v23) = 32;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      int v12 = (void *)v11;
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v24, v23);
      free(v12);
      SSFileLog(v6, @"%@", v14, v15, v16, v17, v18, v19, v13);
    }
  }
  if (!a2)
  {
    if (!a3) {
      a3 = SSError(@"SSErrorDomain", 100, 0, 0);
    }
    a2 = objc_alloc_init(SSAuthenticateResponse);
    [(SSAuthenticateResponse *)a2 setAuthenticateResponseType:0];
    [(SSAuthenticateResponse *)a2 setError:a3];
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  id v21 = [(SSAuthenticateResponse *)a2 copyXPCEncoding];
  if (v21)
  {
    v22 = v21;
    xpc_dictionary_set_value(reply, "0", v21);
    xpc_release(v22);
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  xpc_release(reply);
}

- (void)_handlePurchasesFinished:(id)a3 fromConnection:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = [(SSPurchaseManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    xpc_object_t v7 = xpc_array_create(0, 0);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    xpc_object_t value = xpc_dictionary_get_value(a3, "1");
    uint64_t v10 = value;
    if (value && MEMORY[0x1A62689E0](value) == MEMORY[0x1E4F14568])
    {
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __61__SSPurchaseManager__handlePurchasesFinished_fromConnection___block_invoke;
      applier[3] = &unk_1E5BAD818;
      applier[4] = self;
      void applier[5] = v7;
      applier[6] = v8;
      applier[7] = &v30;
      xpc_array_apply(v10, applier);
    }
    if (*((unsigned char *)v31 + 24)) {
      objc_msgSend(+[SSVSubscriptionStatusCoordinator _existingSharedCoordinator](SSVSubscriptionStatusCoordinator, "_existingSharedCoordinator"), "_invalidateLastKnownStatus");
    }
    if ([v8 count])
    {
      completionBlockQueue = self->_completionBlockQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__SSPurchaseManager__handlePurchasesFinished_fromConnection___block_invoke_2;
      block[3] = &unk_1E5BA8630;
      block[4] = v6;
      block[5] = self;
      void block[6] = v8;
      dispatch_async(completionBlockQueue, block);
    }
    if (xpc_array_get_count(v7))
    {
      if (SSIsInternalBuild() && _os_feature_enabled_impl())
      {
        id v12 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v12) {
          id v12 = +[SSLogConfig sharedConfig];
        }
        int v13 = [v12 shouldLog];
        int v14 = [v12 shouldLogToDisk];
        uint64_t v15 = [v12 OSLogObject];
        if (v14) {
          v13 |= 2u;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          int v16 = v13;
        }
        else {
          int v16 = v13 & 2;
        }
        if (v16)
        {
          int v34 = 136446210;
          v35 = "-[SSPurchaseManager _handlePurchasesFinished:fromConnection:]";
          LODWORD(v27) = 12;
          uint64_t v17 = _os_log_send_and_compose_impl();
          if (v17)
          {
            uint64_t v18 = (void *)v17;
            uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v34, v27);
            free(v18);
            SSFileLog(v12, @"%@", v20, v21, v22, v23, v24, v25, v19);
          }
        }
      }
      xpc_object_t v26 = SSXPCCreateMessageDictionary(101);
      SSXPCDictionarySetCFObject(v26, "1", (__CFString *)self->_managerIdentifier);
      xpc_dictionary_set_value(v26, "2", v7);
      objc_msgSend(-[SSPurchaseManager _requestConnection](self, "_requestConnection"), "sendMessage:withReply:", v26, &__block_literal_global_31);
      xpc_release(v26);
    }

    xpc_release(v7);
    _Block_object_dispose(&v30, 8);
  }
}

uint64_t __61__SSPurchaseManager__handlePurchasesFinished_fromConnection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (MEMORY[0x1A62689E0](a3) == MEMORY[0x1E4F14590])
  {
    id v5 = [[SSPurchaseResponse alloc] initWithXPCEncoding:a3];
    if (v5)
    {
      id v6 = v5;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _shouldInvalidateSubscriptionStatusForPurchaseResponse:v5];
      }
      xpc_array_set_int64(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, [[(SSPurchaseResponse *)v6 purchase] uniqueIdentifier]);
      [*(id *)(a1 + 48) addObject:v6];
    }
  }
  return 1;
}

uint64_t __61__SSPurchaseManager__handlePurchasesFinished_fromConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) purchaseManager:*(void *)(a1 + 40) didFinishPurchasesWithResponses:*(void *)(a1 + 48)];
}

- (id)_newEncodedArrayWithPurchaseIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, [*(id *)(*((void *)&v10 + 1) + 8 * v8++) uniqueIdentifier]);
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)_newEncodedArrayWithPurchases:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = xpc_array_create(0, 0);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v8) copyXPCEncoding];
        if (v9)
        {
          long long v10 = v9;
          xpc_array_append_value(v4, v9);
          xpc_release(v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)_reconnectForDaemonLaunch
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SSPurchaseManager__reconnectForDaemonLaunch__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__SSPurchaseManager__reconnectForDaemonLaunch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToDaemon];
}

uint64_t __63__SSPurchaseManager__sendCompletionBlock_forGetPurchasesReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v4 = [[SSPurchase alloc] initWithXPCEncoding:a3];
  if (v4)
  {
    uint64_t v5 = v4;
    [*(id *)(a1 + 32) addObject:v4];
  }
  return 1;
}

- (void)_sendCompletionBlock:(id)a3 forStandardReply:(id)a4
{
  if (a3)
  {
    uint64_t v10 = 0;
    BOOL v6 = [(SSPurchaseManager *)self _resultForReply:a4 error:&v10];
    completionBlockQueue = self->_completionBlockQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__SSPurchaseManager__sendCompletionBlock_forStandardReply___block_invoke;
    v8[3] = &unk_1E5BACBD0;
    BOOL v9 = v6;
    v8[4] = v10;
    v8[5] = a3;
    dispatch_async(completionBlockQueue, v8);
  }
}

uint64_t __59__SSPurchaseManager__sendCompletionBlock_forStandardReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_sendMessage:(int64_t)a3 withPurchaseIdentifiers:(id)a4 afterPurchase:(id)a5 completionBlock:(id)a6
{
  xpc_object_t v10 = SSXPCCreateMessageDictionary(a3);
  SSXPCDictionarySetCFObject(v10, "1", (__CFString *)self->_managerIdentifier);
  if (a5) {
    xpc_dictionary_set_int64(v10, "3", [a5 uniqueIdentifier]);
  }
  id v11 = [(SSPurchaseManager *)self _newEncodedArrayWithPurchaseIdentifiers:a4];
  xpc_dictionary_set_value(v10, "2", v11);
  xpc_release(v11);
  long long v12 = +[SSWeakReference weakReferenceWithObject:self];
  id v13 = [(SSPurchaseManager *)self _requestConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__SSPurchaseManager__sendMessage_withPurchaseIdentifiers_afterPurchase_completionBlock___block_invoke;
  v14[3] = &unk_1E5BAAAE0;
  v14[4] = v12;
  v14[5] = a6;
  [v13 sendMessage:v10 withReply:v14];
  xpc_release(v10);
}

uint64_t __88__SSPurchaseManager__sendMessage_withPurchaseIdentifiers_afterPurchase_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = (void *)[*(id *)(a1 + 32) object];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _sendCompletionBlock:v5 forStandardReply:a2];
}

- (void)_sendMessage:(int64_t)a3 withPurchases:(id)a4 afterPurchase:(id)a5 completionBlock:(id)a6
{
  xpc_object_t v10 = SSXPCCreateMessageDictionary(a3);
  SSXPCDictionarySetCFObject(v10, "1", (__CFString *)self->_managerIdentifier);
  if (a5) {
    xpc_dictionary_set_int64(v10, "3", [a5 uniqueIdentifier]);
  }
  id v11 = [(SSPurchaseManager *)self _newEncodedArrayWithPurchases:a4];
  xpc_dictionary_set_value(v10, "2", v11);
  xpc_release(v11);
  long long v12 = +[SSWeakReference weakReferenceWithObject:self];
  id v13 = [(SSPurchaseManager *)self _requestConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__SSPurchaseManager__sendMessage_withPurchases_afterPurchase_completionBlock___block_invoke;
  v14[3] = &unk_1E5BAAAE0;
  v14[4] = v12;
  v14[5] = a6;
  [v13 sendMessage:v10 withReply:v14];
  xpc_release(v10);
}

uint64_t __78__SSPurchaseManager__sendMessage_withPurchases_afterPurchase_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = (void *)[*(id *)(a1 + 32) object];
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _sendCompletionBlock:v5 forStandardReply:a2];
}

- (BOOL)_shouldInvalidateSubscriptionStatusForPurchaseResponse:(id)a3
{
  if ([a3 error]) {
    return 0;
  }
  uint64_t v5 = (void *)[a3 purchase];
  BOOL v6 = objc_msgSend((id)objc_msgSend(v5, "requestProperties"), "URLBagKey");
  if (v6)
  {
    if (![v6 isEqualToString:@"buyProduct"]) {
      return 0;
    }
  }
  uint64_t v7 = (void *)[v5 buyParameters];
  if (!v7) {
    return 0;
  }
  return [v7 containsString:@"STDQ"];
}

@end