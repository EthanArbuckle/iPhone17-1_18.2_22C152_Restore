@interface SSVDirectUploadQueue
- (NSArray)uploadKinds;
- (SSVDirectUploadQueue)init;
- (SSVDirectUploadQueue)initWithUploadKinds:(id)a3;
- (id)_outboundConnection;
- (void)_establishInboundConnection;
- (void)_handleAddUploadsMessage:(id)a3;
- (void)_handleChangeUploadsMessage:(id)a3;
- (void)_handleInboundMessage:(id)a3 connection:(id)a4;
- (void)_handleRemoveUploadsMessage:(id)a3;
- (void)_sendObserversUploadsDidChange;
- (void)_sendSimpleMessage:(id)a3 completionBlock:(id)a4;
- (void)addUploadObserver:(id)a3;
- (void)cancelAllUploadsWithCompletionBlock:(id)a3;
- (void)cancelUploads:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)getUploadsWithCompletionBlock:(id)a3;
- (void)pauseAllUploadsWithCompletionBlock:(id)a3;
- (void)pauseUploads:(id)a3 completionBlock:(id)a4;
- (void)removeUploadObserver:(id)a3;
- (void)resumeAllUploadsWithCompletionBlock:(id)a3;
- (void)resumeUploads:(id)a3 completionBlock:(id)a4;
@end

@implementation SSVDirectUploadQueue

- (SSVDirectUploadQueue)init
{
  return [(SSVDirectUploadQueue *)self initWithUploadKinds:0];
}

- (SSVDirectUploadQueue)initWithUploadKinds:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must have upload kinds"];
  }
  v20.receiver = self;
  v20.super_class = (Class)SSVDirectUploadQueue;
  v5 = [(SSVDirectUploadQueue *)&v20 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.StoreServices.SSVDirectUploadQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.StoreServices.SSVDirectUploadQueue.observers", 0);
    observerQueue = v5->_observerQueue;
    v5->_observerQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v10;

    uint64_t v12 = [v4 copy];
    uploadKinds = v5->_uploadKinds;
    v5->_uploadKinds = (NSArray *)v12;

    objc_initWeak(&location, v5);
    v14 = (const char *)[(__CFString *)@"com.apple.iTunesStore.daemon.launched" UTF8String];
    v15 = v5->_accessQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__SSVDirectUploadQueue_initWithUploadKinds___block_invoke;
    v17[3] = &unk_1E5BA7F98;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch(v14, &v5->_daemonLaunchToken, v15, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __44__SSVDirectUploadQueue_initWithUploadKinds___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained[5] count];
    v2 = v4;
    if (v3)
    {
      [v4 _establishInboundConnection];
      v2 = v4;
    }
  }
}

- (void)dealloc
{
  notify_cancel(self->_daemonLaunchToken);
  v3.receiver = self;
  v3.super_class = (Class)SSVDirectUploadQueue;
  [(SSVDirectUploadQueue *)&v3 dealloc];
}

- (void)addUploadObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SSVDirectUploadQueue_addUploadObserver___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __42__SSVDirectUploadQueue_addUploadObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _establishInboundConnection];
}

- (void)cancelAllUploadsWithCompletionBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v22 = 136446210;
      v23 = "-[SSVDirectUploadQueue cancelAllUploadsWithCompletionBlock:]";
      LODWORD(v19) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v19);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SSVDirectUploadQueue_cancelAllUploadsWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5BA7350;
  block[4] = self;
  id v21 = v4;
  id v18 = v4;
  dispatch_async(accessQueue, block);
}

void __60__SSVDirectUploadQueue_cancelAllUploadsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = SSXPCCreateMessageDictionary(154);
  xpc_dictionary_set_BOOL(v2, "2", 1);
  [*(id *)(a1 + 32) _sendSimpleMessage:v2 completionBlock:*(void *)(a1 + 40)];
}

- (void)cancelUploads:(id)a3 completionBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v28 = 136446210;
      v29 = "-[SSVDirectUploadQueue cancelUploads:completionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v28, v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SSVDirectUploadQueue_cancelUploads_completionBlock___block_invoke;
  block[3] = &unk_1E5BA6FF0;
  id v25 = v6;
  v26 = self;
  id v27 = v7;
  id v21 = v7;
  id v22 = v6;
  dispatch_async(accessQueue, block);
}

void __54__SSVDirectUploadQueue_cancelUploads_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = SSXPCCreateMessageDictionary(154);
  xpc_object_t v3 = xpc_array_create(0, 0);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        xpc_array_set_int64(v3, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "persistentIdentifier", (void)v9));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "1", v3);
  [*(id *)(a1 + 40) _sendSimpleMessage:v2 completionBlock:*(void *)(a1 + 48)];
}

- (void)getUploadsWithCompletionBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v22 = 136446210;
      uint64_t v23 = "-[SSVDirectUploadQueue getUploadsWithCompletionBlock:]";
      LODWORD(v19) = 12;
      long long v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v19);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5BA7350;
  void block[4] = self;
  id v21 = v4;
  id v18 = v4;
  dispatch_async(accessQueue, block);
}

void __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = SSXPCCreateMessageDictionary(155);
  SSXPCDictionarySetCFObject(v2, "1", *(__CFString **)(*(void *)(a1 + 32) + 56));
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = [*(id *)(a1 + 32) _outboundConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E5BADCE0;
  objc_copyWeak(&v10, &location);
  uint64_t v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v6 = v3;
  id v8 = v6;
  [v4 sendMessage:v2 withReply:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v25 = 0;
  int isValidReply = _isValidReply(v3, &v25);
  id v6 = v25;
  int v7 = v6;
  if (isValidReply)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v9 = xpc_dictionary_get_value(v3, "1");
    id v10 = (void *)[v8 initWithXPCEncoding:v9];

    uint64_t v11 = xpc_dictionary_get_value(v3, "2");
    uint64_t v12 = objc_opt_class();
    id v13 = SSXPCCreateNSArrayFromXPCEncodedArray(v11, v12);

    if (WeakRetained && v13)
    {
      uint64_t v14 = WeakRetained[1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_3;
      block[3] = &unk_1E5BA7018;
      id v13 = v13;
      uint64_t v15 = *(void *)(a1 + 32);
      id v23 = v13;
      uint64_t v24 = v15;
      dispatch_async(v14, block);
    }
  }
  else
  {
    id v13 = 0;
    id v10 = v6;
  }
  uint64_t v16 = *(void **)(a1 + 48);
  if (v16)
  {
    uint64_t v17 = *(NSObject **)(a1 + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_4;
    v18[3] = &unk_1E5BA6EB8;
    id v21 = v16;
    id v19 = v13;
    id v20 = v10;
    dispatch_async(v17, v18);
  }
}

void __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v9 = *(void **)(*(void *)(a1 + 40) + 64);
        if (v9
          && (uint64_t v10 = objc_msgSend(v9, "indexOfObject:", *(void *)(*((void *)&v14 + 1) + 8 * v7), (void)v14),
              v10 != 0x7FFFFFFFFFFFFFFFLL))
        {
          uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 64) objectAtIndex:v10];
          [v11 _adoptStatusFromUpload:v8];
          [v2 addObject:v11];
        }
        else
        {
          objc_msgSend(v2, "addObject:", v8, (void)v14);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(v12 + 64);
  *(void *)(v12 + 64) = v2;
}

uint64_t __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)pauseAllUploadsWithCompletionBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v22 = 136446210;
      id v23 = "-[SSVDirectUploadQueue pauseAllUploadsWithCompletionBlock:]";
      LODWORD(v19) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v19);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SSVDirectUploadQueue_pauseAllUploadsWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5BA7350;
  void block[4] = self;
  id v21 = v4;
  id v18 = v4;
  dispatch_async(accessQueue, block);
}

void __59__SSVDirectUploadQueue_pauseAllUploadsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = SSXPCCreateMessageDictionary(156);
  xpc_dictionary_set_BOOL(v2, "2", 1);
  [*(id *)(a1 + 32) _sendSimpleMessage:v2 completionBlock:*(void *)(a1 + 40)];
}

- (void)pauseUploads:(id)a3 completionBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      uint64_t v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v28 = 136446210;
      v29 = "-[SSVDirectUploadQueue pauseUploads:completionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v28, v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SSVDirectUploadQueue_pauseUploads_completionBlock___block_invoke;
  block[3] = &unk_1E5BA6FF0;
  id v25 = v6;
  v26 = self;
  id v27 = v7;
  id v21 = v7;
  id v22 = v6;
  dispatch_async(accessQueue, block);
}

void __53__SSVDirectUploadQueue_pauseUploads_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = SSXPCCreateMessageDictionary(156);
  xpc_object_t v3 = xpc_array_create(0, 0);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        xpc_array_set_int64(v3, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "persistentIdentifier", (void)v9));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "1", v3);
  [*(id *)(a1 + 40) _sendSimpleMessage:v2 completionBlock:*(void *)(a1 + 48)];
}

- (void)removeUploadObserver:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SSVDirectUploadQueue_removeUploadObserver___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

uint64_t __45__SSVDirectUploadQueue_removeUploadObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)resumeAllUploadsWithCompletionBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v22 = 136446210;
      uint64_t v23 = "-[SSVDirectUploadQueue resumeAllUploadsWithCompletionBlock:]";
      LODWORD(v19) = 12;
      long long v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v19);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SSVDirectUploadQueue_resumeAllUploadsWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5BA7350;
  void block[4] = self;
  id v21 = v4;
  id v18 = v4;
  dispatch_async(accessQueue, block);
}

void __60__SSVDirectUploadQueue_resumeAllUploadsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = SSXPCCreateMessageDictionary(158);
  xpc_dictionary_set_BOOL(v2, "2", 1);
  [*(id *)(a1 + 32) _sendSimpleMessage:v2 completionBlock:*(void *)(a1 + 40)];
}

- (void)resumeUploads:(id)a3 completionBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v28 = 136446210;
      v29 = "-[SSVDirectUploadQueue resumeUploads:completionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v28, v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SSVDirectUploadQueue_resumeUploads_completionBlock___block_invoke;
  block[3] = &unk_1E5BA6FF0;
  id v25 = v6;
  v26 = self;
  id v27 = v7;
  id v21 = v7;
  id v22 = v6;
  dispatch_async(accessQueue, block);
}

void __54__SSVDirectUploadQueue_resumeUploads_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = SSXPCCreateMessageDictionary(158);
  xpc_object_t v3 = xpc_array_create(0, 0);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        xpc_array_set_int64(v3, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "persistentIdentifier", (void)v9));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "1", v3);
  [*(id *)(a1 + 40) _sendSimpleMessage:v2 completionBlock:*(void *)(a1 + 48)];
}

- (NSArray)uploadKinds
{
  xpc_object_t v2 = (void *)[(NSArray *)self->_uploadKinds copy];
  return (NSArray *)v2;
}

- (void)_establishInboundConnection
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    xpc_object_t v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      xpc_object_t v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    uint64_t v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      LODWORD(location[0]) = 136446210;
      *(id *)((char *)location + 4) = "-[SSVDirectUploadQueue _establishInboundConnection]";
      LODWORD(v24) = 12;
      uint64_t v8 = (void *)_os_log_send_and_compose_impl();

      if (v8)
      {
        long long v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, location, v24);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
      }
    }
    else
    {
    }
  }
  if (!self->_inboundConnection)
  {
    if ([(NSHashTable *)self->_observers count])
    {
      uint64_t v16 = objc_alloc_init(SSXPCConnection);
      inboundConnection = self->_inboundConnection;
      self->_inboundConnection = v16;

      uint64_t v18 = self->_accessQueue;
      objc_initWeak(location, self);
      uint64_t v19 = self->_inboundConnection;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __51__SSVDirectUploadQueue__establishInboundConnection__block_invoke;
      v25[3] = &unk_1E5BADD08;
      id v20 = v18;
      v26 = v20;
      objc_copyWeak(&v27, location);
      [(SSXPCConnection *)v19 setMessageBlock:v25];
      xpc_object_t v21 = SSXPCCreateMessageDictionary(157);
      SSXPCDictionarySetCFObject(v21, "1", (__CFString *)self->_uploadKinds);
      id v22 = [(SSXPCConnection *)self->_inboundConnection createXPCEndpoint];
      xpc_dictionary_set_value(v21, "2", v22);
      uint64_t v23 = [(SSVDirectUploadQueue *)self _outboundConnection];
      [v23 sendMessage:v21];

      objc_destroyWeak(&v27);
      objc_destroyWeak(location);
    }
  }
}

void __51__SSVDirectUploadQueue__establishInboundConnection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SSVDirectUploadQueue__establishInboundConnection__block_invoke_2;
  block[3] = &unk_1E5BA9318;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __51__SSVDirectUploadQueue__establishInboundConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleInboundMessage:*(void *)(a1 + 32) connection:*(void *)(a1 + 40)];
}

- (void)_handleAddUploadsMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = self->_uploads;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        id v12 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v11, "persistentIdentifier"));
        [v5 setObject:v11 forKey:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  uint64_t v13 = xpc_dictionary_get_value(v4, "2");
  uint64_t v14 = (void *)v13;
  uint64_t v15 = MEMORY[0x1E4F14568];
  if (v13 && MEMORY[0x1A62689E0](v13) == v15)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __49__SSVDirectUploadQueue__handleAddUploadsMessage___block_invoke;
    applier[3] = &unk_1E5BA73C8;
    id v24 = v5;
    xpc_array_apply(v14, applier);
  }
  uint64_t v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uploads = self->_uploads;
  self->_uploads = v16;

  uint64_t v18 = xpc_dictionary_get_value(v4, "1");
  uint64_t v19 = (void *)v18;
  if (v18 && MEMORY[0x1A62689E0](v18) == v15)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__SSVDirectUploadQueue__handleAddUploadsMessage___block_invoke_2;
    v20[3] = &unk_1E5BAB610;
    id v21 = v5;
    id v22 = self;
    xpc_array_apply(v19, v20);
  }
  if ([(NSHashTable *)self->_observers count]) {
    [(SSVDirectUploadQueue *)self _sendObserversUploadsDidChange];
  }
}

uint64_t __49__SSVDirectUploadQueue__handleAddUploadsMessage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[SSVDirectUpload alloc] initWithXPCEncoding:v4];

  if (v5)
  {
    id v6 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", -[SSVDirectUpload persistentIdentifier](v5, "persistentIdentifier"));
    uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v6];
    uint64_t v8 = v7;
    if (v7) {
      [v7 _adoptStatusFromUpload:v5];
    }
    else {
      [*(id *)(a1 + 32) setObject:v5 forKey:v6];
    }
  }
  return 1;
}

uint64_t __49__SSVDirectUploadQueue__handleAddUploadsMessage___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F145C0])
  {
    id v5 = (void *)[objc_alloc(NSNumber) initWithLongLong:xpc_int64_get_value(v4)];
    id v6 = [*(id *)(a1 + 32) objectForKey:v5];
    if (v6) {
      [*(id *)(*(void *)(a1 + 40) + 64) addObject:v6];
    }
  }
  return 1;
}

- (void)_handleChangeUploadsMessage:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_uploads count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = xpc_dictionary_get_value(v4, "1");
    uint64_t v7 = (void *)v6;
    if (v6 && MEMORY[0x1A62689E0](v6) == MEMORY[0x1E4F14568])
    {
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __52__SSVDirectUploadQueue__handleChangeUploadsMessage___block_invoke;
      applier[3] = &unk_1E5BAB610;
      void applier[4] = self;
      id v16 = v5;
      xpc_array_apply(v7, applier);
    }
    if ([v5 count] && -[NSHashTable count](self->_observers, "count"))
    {
      uint64_t v8 = (void *)[(NSHashTable *)self->_observers copy];
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__SSVDirectUploadQueue__handleChangeUploadsMessage___block_invoke_2;
      block[3] = &unk_1E5BA7068;
      id v12 = v8;
      uint64_t v13 = self;
      id v14 = v5;
      id v10 = v8;
      dispatch_async(observerQueue, block);
    }
  }
}

uint64_t __52__SSVDirectUploadQueue__handleChangeUploadsMessage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[SSVDirectUpload alloc] initWithXPCEncoding:v4];

  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 64) indexOfObject:v5];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndex:v6];
    [v7 _adoptStatusFromUpload:v5];
    [*(id *)(a1 + 40) addObject:v7];
  }
  return 1;
}

void __52__SSVDirectUploadQueue__handleChangeUploadsMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "uploadQueue:statusDidChangeForUploads:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_handleInboundMessage:(id)a3 connection:(id)a4
{
  id v8 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v8, "0");
  int64_t v6 = int64;
  if (int64 <= 1013)
  {
    if (!int64) {
      goto LABEL_10;
    }
    if (int64 == 1013)
    {
      [(SSVDirectUploadQueue *)self _handleAddUploadsMessage:v8];
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v7 = objc_opt_class();
    NSLog(&cfstr_UnrecognizedMe.isa, v7, v6);
    goto LABEL_10;
  }
  if (int64 != 1014)
  {
    if (int64 == 1015)
    {
      [(SSVDirectUploadQueue *)self _handleRemoveUploadsMessage:v8];
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  [(SSVDirectUploadQueue *)self _handleChangeUploadsMessage:v8];
LABEL_10:
}

- (void)_handleRemoveUploadsMessage:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = xpc_dictionary_get_value(v4, "1");
  int64_t v6 = (void *)v5;
  if (v5 && MEMORY[0x1A62689E0](v5) == MEMORY[0x1E4F14568])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__SSVDirectUploadQueue__handleRemoveUploadsMessage___block_invoke;
    v7[3] = &unk_1E5BADD50;
    v7[4] = self;
    void v7[5] = &v8;
    xpc_array_apply(v6, v7);
  }
  if (*((unsigned char *)v9 + 24) && [(NSHashTable *)self->_observers count]) {
    [(SSVDirectUploadQueue *)self _sendObserversUploadsDidChange];
  }

  _Block_object_dispose(&v8, 8);
}

uint64_t __52__SSVDirectUploadQueue__handleRemoveUploadsMessage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F145C0])
  {
    int64_t value = xpc_int64_get_value(v4);
    int64_t v6 = *(void **)(*(void *)(a1 + 32) + 64);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__SSVDirectUploadQueue__handleRemoveUploadsMessage___block_invoke_2;
    v9[3] = &__block_descriptor_40_e32_B32__0__SSVDirectUpload_8Q16_B24l;
    v9[4] = value;
    uint64_t v7 = [v6 indexOfObjectPassingTest:v9];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(*(void *)(a1 + 32) + 64) removeObjectAtIndex:v7];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }

  return 1;
}

BOOL __52__SSVDirectUploadQueue__handleRemoveUploadsMessage___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 persistentIdentifier] == *(void *)(a1 + 32);
}

- (id)_outboundConnection
{
  outboundConnection = self->_outboundConnection;
  if (!outboundConnection)
  {
    id v4 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    uint64_t v5 = self->_outboundConnection;
    self->_outboundConnection = v4;

    outboundConnection = self->_outboundConnection;
  }
  return outboundConnection;
}

- (void)_sendObserversUploadsDidChange
{
  uint64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
  id v4 = (void *)[(NSMutableArray *)self->_uploads copy];
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SSVDirectUploadQueue__sendObserversUploadsDidChange__block_invoke;
  block[3] = &unk_1E5BA7068;
  id v9 = v3;
  uint64_t v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(observerQueue, block);
}

void __54__SSVDirectUploadQueue__sendObserversUploadsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "uploadQueue:uploadsDidChange:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_sendSimpleMessage:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = self->_observerQueue;
  id v8 = a3;
  long long v9 = [(SSVDirectUploadQueue *)self _outboundConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__SSVDirectUploadQueue__sendSimpleMessage_completionBlock___block_invoke;
  v12[3] = &unk_1E5BA6EE0;
  uint64_t v13 = v7;
  id v14 = v6;
  long long v10 = v7;
  id v11 = v6;
  [v9 sendMessage:v8 withReply:v12];
}

void __59__SSVDirectUploadQueue__sendSimpleMessage_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 40))
  {
    id v16 = 0;
    LODWORD(v5) = _isValidReply(v3, &v16);
    id v6 = v16;
    if (v5)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v7 = xpc_dictionary_get_value(v4, "1");
      uint64_t v8 = [v5 initWithXPCEncoding:v7];

      LOBYTE(v5) = xpc_dictionary_get_BOOL(v4, "2");
      id v6 = (id)v8;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__SSVDirectUploadQueue__sendSimpleMessage_completionBlock___block_invoke_2;
    v12[3] = &unk_1E5BAB848;
    long long v9 = *(NSObject **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    char v15 = (char)v5;
    id v13 = v6;
    id v14 = v10;
    id v11 = v6;
    dispatch_async(v9, v12);
  }
}

uint64_t __59__SSVDirectUploadQueue__sendSimpleMessage_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploads, 0);
  objc_storeStrong((id *)&self->_uploadKinds, 0);
  objc_storeStrong((id *)&self->_outboundConnection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_inboundConnection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end