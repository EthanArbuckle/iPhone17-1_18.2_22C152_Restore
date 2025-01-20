@interface SSPreorderManager
+ (id)bookStoreItemKinds;
+ (id)musicStoreItemKinds;
- (NSArray)itemKinds;
- (NSArray)preorders;
- (SSPreorderManager)init;
- (SSPreorderManager)initWithItemKinds:(id)a3;
- (void)_connectAsObserver;
- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4;
- (void)_registerAsObserver;
- (void)_sendMessageToObservers:(SEL)a3;
- (void)addObserver:(id)a3;
- (void)cancelPreorders:(id)a3 withCompletionBlock:(id)a4;
- (void)dealloc;
- (void)reloadFromServer;
- (void)removeObserver:(id)a3;
@end

@implementation SSPreorderManager

- (SSPreorderManager)init
{
  return [(SSPreorderManager *)self initWithItemKinds:0];
}

- (SSPreorderManager)initWithItemKinds:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSPreorderManager;
  v4 = [(SSPreorderManager *)&v7 init];
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSPreorderManager", 0);
    v4->_observerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSPreorderManager.observerQueue", 0);
    v4->_itemKinds = (NSArray *)[a3 copy];
    v4->_observers = CFArrayCreateMutable(0, 0, 0);
    [(SSPreorderManager *)v4 _connectAsObserver];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)__DaemonLaunchNotification_1, @"com.apple.iTunesStore.daemon.launched", 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.iTunesStore.daemon.launched", 0);
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  dispatch_release((dispatch_object_t)self->_observerQueue);
  [(SSXPCConnection *)self->_observerConnection setMessageBlock:0];

  CFRelease(self->_observers);
  v4.receiver = self;
  v4.super_class = (Class)SSPreorderManager;
  [(SSPreorderManager *)&v4 dealloc];
}

+ (id)bookStoreItemKinds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"eBook", 0);
}

+ (id)musicStoreItemKinds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"album", @"audiobook", @"mix", @"movie", @"movie", @"music-video", @"ringtone", @"song", @"tone", @"tv-episode", @"tv-season", @"wemix", 0);
}

- (void)addObserver:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SSPreorderManager_addObserver___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void __33__SSPreorderManager_addObserver___block_invoke(uint64_t a1)
{
}

- (void)cancelPreorders:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
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
      int v35 = 136446210;
      v36 = "-[SSPreorderManager cancelPreorders:withCompletionBlock:]";
      LODWORD(v28) = 12;
      v27 = &v35;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v35, v28);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 35);
  xpc_object_t v21 = xpc_array_create(0, 0);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v22 = [a3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(a3);
        }
        xpc_array_set_int64(v21, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "persistentIdentifier", v27));
      }
      uint64_t v23 = [a3 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v23);
  }
  xpc_dictionary_set_value(v20, "1", v21);
  xpc_release(v21);
  connection = self->_connection;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __57__SSPreorderManager_cancelPreorders_withCompletionBlock___block_invoke;
  v29[3] = &unk_1E5BA77D0;
  v29[4] = a4;
  [(SSXPCConnection *)connection sendMessage:v20 withReply:v29];
  xpc_release(v20);
}

void __57__SSPreorderManager_cancelPreorders_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(a2, "0")) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = SSError(@"SSErrorDomain", 100, 0, 0);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__SSPreorderManager_cancelPreorders_withCompletionBlock___block_invoke_2;
    v7[3] = &unk_1E5BA7728;
    v7[4] = v4;
    v7[5] = v5;
    dispatch_async(global_queue, v7);
  }
}

uint64_t __57__SSPreorderManager_cancelPreorders_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSArray)itemKinds
{
  v2 = self->_itemKinds;
  return v2;
}

- (NSArray)preorders
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
      LODWORD(v21) = 136446210;
      *(void *)((char *)&v21 + 4) = "-[SSPreorderManager preorders]";
      LODWORD(v19) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        int v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v21, v19);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = &v21;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy__36;
  uint64_t v24 = __Block_byref_object_dispose__36;
  uint64_t v25 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__SSPreorderManager_preorders__block_invoke;
  block[3] = &unk_1E5BAA0A8;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(dispatchQueue, block);
  uint64_t v17 = (NSArray *)*(id *)(*((void *)&v21 + 1) + 40);
  _Block_object_dispose(&v21, 8);
  return v17;
}

id __30__SSPreorderManager_preorders__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "0", 34);
    int v5 = dispatch_semaphore_create(0);
    int v6 = *(void **)(*(void *)(a1 + 32) + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__SSPreorderManager_preorders__block_invoke_2;
    v8[3] = &unk_1E5BABB88;
    v8[4] = v3;
    v8[5] = v5;
    [v6 sendMessage:v4 withReply:v8];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
    xpc_release(v4);
    *(void *)(*(void *)(a1 + 32) + 56) = [v3 copy];

    v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  id result = v2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

intptr_t __30__SSPreorderManager_preorders__block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "0");
  if (value)
  {
    xpc_object_t v4 = value;
    if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F14568])
    {
      int64_t count = xpc_array_get_count(v4);
      if (count >= 1)
      {
        int64_t v6 = count;
        for (size_t i = 0; i != v6; ++i)
        {
          int v8 = [[SSPreorder alloc] initWithXPCEncoding:xpc_array_get_value(v4, i)];
          [*(id *)(a1 + 32) addObject:v8];
        }
      }
    }
  }
  uint64_t v9 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v9);
}

- (void)reloadFromServer
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
      uint64_t v19 = "-[SSPreorderManager reloadFromServer]";
      LODWORD(v17) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        int v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v18, v17);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 36);
  [(SSXPCConnection *)self->_connection sendMessage:v16];
  xpc_release(v16);
}

- (void)removeObserver:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SSPreorderManager_removeObserver___block_invoke;
  v4[3] = &unk_1E5BA7448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void __36__SSPreorderManager_removeObserver___block_invoke(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(*(void *)(a1 + 32) + 48);
  v7.length = CFArrayGetCount(v2);
  v7.location = 0;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v7, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
  {
    CFIndex v4 = FirstIndexOfValue;
    int v5 = *(__CFArray **)(*(void *)(a1 + 32) + 48);
    CFArrayRemoveValueAtIndex(v5, v4);
  }
}

- (void)_connectAsObserver
{
  self->_connection = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = __Block_byref_object_copy__36;
  v5[4] = __Block_byref_object_dispose__36;
  v5[5] = self;
  id v3 = objc_alloc_init(SSXPCConnection);
  self->_observerConnection = v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__SSPreorderManager__connectAsObserver__block_invoke;
  v4[3] = &unk_1E5BABBB0;
  v4[4] = self;
  v4[5] = v5;
  [(SSXPCConnection *)v3 setMessageBlock:v4];
  [(SSPreorderManager *)self _registerAsObserver];
  _Block_object_dispose(v5, 8);
}

void __39__SSPreorderManager__connectAsObserver__block_invoke(uint64_t a1, xpc_object_t object, void *a3)
{
  xpc_retain(object);
  xpc_retain(a3);
  int v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SSPreorderManager__connectAsObserver__block_invoke_2;
  block[3] = &unk_1E5BA8F70;
  uint64_t v7 = *(void *)(a1 + 40);
  block[5] = a3;
  void block[6] = v7;
  block[4] = object;
  dispatch_async(v6, block);
}

void __39__SSPreorderManager__connectAsObserver__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _handleMessage:*(void *)(a1 + 32) fromServerConnection:*(void *)(a1 + 40)];
  xpc_release(*(xpc_object_t *)(a1 + 32));
  CFArrayRef v2 = *(void **)(a1 + 40);
  xpc_release(v2);
}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  int64_t int64 = xpc_dictionary_get_int64(a3, "0");
  if (int64)
  {
    int64_t v8 = int64;
    xpc_object_t reply = xpc_dictionary_create_reply(a3);
    xpc_connection_send_message((xpc_connection_t)a4, reply);
    xpc_release(reply);
    if (v8 == 1007)
    {

      self->_preorders = 0;
      [(SSPreorderManager *)self _sendMessageToObservers:sel_preorderManagerPreordersDidChange_];
    }
  }
}

- (void)_registerAsObserver
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
      uint64_t v22 = "-[SSPreorderManager _registerAsObserver]";
      LODWORD(v20) = 12;
      uint64_t v19 = &v21;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        int64_t v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v21, v20);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  id v16 = [(SSXPCConnection *)self->_observerConnection createXPCEndpoint];
  if (v16)
  {
    uint64_t v17 = v16;
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v18, "0", 33);
    SSXPCDictionarySetCFObject(v18, "1", (__CFString *)self->_itemKinds);
    xpc_dictionary_set_value(v18, "2", v17);
    [(SSXPCConnection *)self->_connection sendMessage:v18];
    xpc_release(v18);
    xpc_release(v17);
  }
}

- (void)_sendMessageToObservers:(SEL)a3
{
  if (self->_observers)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CFIndex Count = CFArrayGetCount(self->_observers);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
        objc_msgSend(v5, "addObject:", CFArrayGetValueAtIndex(self->_observers, i));
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__SSPreorderManager__sendMessageToObservers___block_invoke;
      block[3] = &unk_1E5BAA120;
      block[4] = self;
      block[5] = v5;
      void block[6] = a3;
      dispatch_async(observerQueue, block);
    }
  }
}

uint64_t __45__SSPreorderManager__sendMessageToObservers___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(void **)(a1 + 40);
  uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 32)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

@end