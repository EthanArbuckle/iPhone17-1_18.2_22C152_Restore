@interface SSRemoteNotificationClient
+ (id)sharedClient;
- (SSRemoteNotificationClient)init;
- (id)popQueuedNotifications;
- (void)dealloc;
- (void)registerForRemoteNotifications;
- (void)unregisterForRemoteNotifications;
@end

@implementation SSRemoteNotificationClient

- (SSRemoteNotificationClient)init
{
  v4.receiver = self;
  v4.super_class = (Class)SSRemoteNotificationClient;
  v2 = [(SSRemoteNotificationClient *)&v4 init];
  if (v2) {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSRemoteNotificationClient", 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)SSRemoteNotificationClient;
  [(SSRemoteNotificationClient *)&v3 dealloc];
}

+ (id)sharedClient
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SSRemoteNotificationClient_sharedClient__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = a1;
  if (sharedClient_sOnce != -1) {
    dispatch_once(&sharedClient_sOnce, block);
  }
  return (id)sharedClient_sSharedClient;
}

id __42__SSRemoteNotificationClient_sharedClient__block_invoke()
{
  id result = objc_alloc_init((Class)objc_opt_class());
  sharedClient_sSharedClient = (uint64_t)result;
  return result;
}

- (id)popQueuedNotifications
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v2 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v2) {
      id v2 = +[SSLogConfig sharedConfig];
    }
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    if (os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v5 = v4;
    }
    else {
      int v5 = v4 & 2;
    }
    if (v5)
    {
      LODWORD(v21) = 136446210;
      *(void *)((char *)&v21 + 4) = "-[SSRemoteNotificationClient popQueuedNotifications]";
      LODWORD(v19) = 12;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, &v21, v19);
        free(v7);
        SSFileLog(v2, @"%@", v9, v10, v11, v12, v13, v14, v8);
      }
    }
  }
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = &v21;
  uint64_t v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__27;
  v24 = __Block_byref_object_dispose__27;
  uint64_t v25 = 0;
  v15 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v16 = SSXPCCreateMessageDictionary(79);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__SSRemoteNotificationClient_popQueuedNotifications__block_invoke;
  v20[3] = &unk_1E5BAAD08;
  v20[4] = &v21;
  [(SSXPCConnection *)v15 sendSynchronousMessage:v16 withReply:v20];
  xpc_release(v16);

  id v17 = *(id *)(*((void *)&v21 + 1) + 40);
  _Block_object_dispose(&v21, 8);
  return v17;
}

void *__52__SSRemoteNotificationClient_popQueuedNotifications__block_invoke(void *result, void *a2)
{
  if (a2)
  {
    int v3 = result;
    id result = (void *)MEMORY[0x1A62689E0](a2);
    if (result == (void *)MEMORY[0x1E4F14590])
    {
      xpc_object_t value = xpc_dictionary_get_value(a2, "0");
      uint64_t v5 = objc_opt_class();
      id result = SSXPCCreateNSArrayFromXPCEncodedArray(value, v5);
      *(void *)(*(void *)(v3[4] + 8) + 40) = result;
    }
  }
  return result;
}

- (void)registerForRemoteNotifications
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
      int v19 = 136446210;
      v20 = "-[SSRemoteNotificationClient registerForRemoteNotifications]";
      LODWORD(v17) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v19, v17);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SSRemoteNotificationClient_registerForRemoteNotifications__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __60__SSRemoteNotificationClient_registerForRemoteNotifications__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (int *)(v1 + 16);
  if (!*(_DWORD *)(v1 + 16))
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3052000000;
    v7[3] = __Block_byref_object_copy__27;
    v7[4] = __Block_byref_object_dispose__27;
    v7[5] = v1;
    global_queue = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __60__SSRemoteNotificationClient_registerForRemoteNotifications__block_invoke_2;
    handler[3] = &unk_1E5BAAD30;
    handler[4] = v7;
    notify_register_dispatch("com.apple.itunesstored.aps.received", v2, global_queue, handler);
    _Block_object_dispose(v7, 8);
  }
  int v4 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v5 = SSXPCCreateMessageDictionary(80);
  [(SSXPCConnection *)v4 sendSynchronousMessage:v5 withReply:&__block_literal_global_14];
  xpc_release(v5);
}

void __60__SSRemoteNotificationClient_registerForRemoteNotifications__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"SSRemoteNotificationClientDidReceiveNotifications", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

- (void)unregisterForRemoteNotifications
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
      int v19 = 136446210;
      v20 = "-[SSRemoteNotificationClient unregisterForRemoteNotifications]";
      LODWORD(v17) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v19, v17);
        free(v8);
        SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SSRemoteNotificationClient_unregisterForRemoteNotifications__block_invoke;
  block[3] = &unk_1E5BA73F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __62__SSRemoteNotificationClient_unregisterForRemoteNotifications__block_invoke(uint64_t a1)
{
  notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 16));
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
  id v3 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v2 = SSXPCCreateMessageDictionary(81);
  [(SSXPCConnection *)v3 sendSynchronousMessage:v2 withReply:&__block_literal_global_22];
  xpc_release(v2);
}

@end