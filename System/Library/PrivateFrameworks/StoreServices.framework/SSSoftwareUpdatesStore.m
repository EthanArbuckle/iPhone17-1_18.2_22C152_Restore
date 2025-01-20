@interface SSSoftwareUpdatesStore
- (SSSoftwareUpdatesStore)init;
- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)getUpdatesWithCompletionBlock:(id)a3;
- (void)hideApplicationBadgeForPendingUpdates;
- (void)reloadFromServerWithCompletionBlock:(id)a3;
- (void)removeUpdateBulletins;
- (void)showApplicationBadgeForPendingUpdates;
@end

@implementation SSSoftwareUpdatesStore

- (SSSoftwareUpdatesStore)init
{
  v14.receiver = self;
  v14.super_class = (Class)SSSoftwareUpdatesStore;
  v2 = [(SSSoftwareUpdatesStore *)&v14 init];
  if (v2)
  {
    v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSSoftwareUpdatesStore.%p", v2);
    v4 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    connection = v2->_connection;
    v2->_connection = v4;

    id v6 = v3;
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.StoreServices.SSSoftwareUpdatesStore.callout.%p", v2);
    id v10 = v9;
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunesstored.updatesstorechanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)SSSoftwareUpdatesStore;
  [(SSSoftwareUpdatesStore *)&v4 dealloc];
}

- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)getUpdatesWithCompletionBlock:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, MEMORY[0x1E4F1CBF0]);
  }
}

- (void)hideApplicationBadgeForPendingUpdates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl()) {
    goto LABEL_16;
  }
  v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    int v7 = v5;
  }
  else {
    int v7 = v5 & 2;
  }
  if (!v7) {
    goto LABEL_14;
  }
  int v17 = 136446210;
  v18 = "-[SSSoftwareUpdatesStore hideApplicationBadgeForPendingUpdates]";
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v17, v16);
    free(v8);
    SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_14:
  }
LABEL_16:
  if (self->_connection)
  {
    xpc_object_t v15 = SSXPCCreateMessageDictionary(118);
    [(SSXPCConnection *)self->_connection sendMessage:v15];
  }
}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    int v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      int v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v22 = 136446210;
      v23 = "-[SSSoftwareUpdatesStore reloadFromServerWithCompletionBlock:]";
      LODWORD(v19) = 12;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v19);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5BA7350;
  block[4] = self;
  id v21 = v4;
  id v18 = v4;
  dispatch_async(dispatchQueue, block);
}

void __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = SSXPCCreateMessageDictionary(106);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E5BA9530;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  [v4 sendMessage:v2 withReply:v5];
}

void __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v7 = xpc_dictionary_get_value(v4, "1");
    int v5 = (void *)[v6 initWithXPCEncoding:v7];
  }
  else
  {
    int v5 = SSError(@"SSErrorDomain", 111, 0, 0);
  }
  v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_3;
  v11[3] = &unk_1E5BA7328;
  id v9 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __62__SSSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], *(void *)(a1 + 32));
}

- (void)removeUpdateBulletins
{
  if (self->_connection)
  {
    id v3 = SSXPCCreateMessageDictionary(121);
    [(SSXPCConnection *)self->_connection sendMessage:v3];
  }
}

- (void)showApplicationBadgeForPendingUpdates
{
  if (self->_connection)
  {
    id v3 = SSXPCCreateMessageDictionary(119);
    [(SSXPCConnection *)self->_connection sendMessage:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end