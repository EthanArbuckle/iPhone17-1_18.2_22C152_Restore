@interface SSVSubscriptionEntitlementsCoordinator
+ (id)sharedCoordinator;
- (SSVSubscriptionEntitlementsCoordinator)init;
- (id)_cachedSubscriptionEntitlements;
- (id)_connection;
- (id)_loadSubscriptionEntitlementsIgnoreCaches:(BOOL)a3 error:(id *)a4;
- (void)_setCachedSubscriptionEntitlements:(id)a3;
- (void)dealloc;
- (void)getSubscriptionEntitlements:(id)a3;
- (void)getSubscriptionEntitlementsIgnoreCaches:(BOOL)a3 entitlementsBlock:(id)a4;
@end

@implementation SSVSubscriptionEntitlementsCoordinator

- (SSVSubscriptionEntitlementsCoordinator)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSVSubscriptionEntitlementsCoordinator;
  v2 = [(SSVSubscriptionEntitlementsCoordinator *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVSubscriptionEntitlementsCoordinator", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__EntitlementsChangedNotification, kSSVNotificationSubscriptionEntitlementsChanged, 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kSSVNotificationSubscriptionEntitlementsChanged, 0);
  v4.receiver = self;
  v4.super_class = (Class)SSVSubscriptionEntitlementsCoordinator;
  [(SSVSubscriptionEntitlementsCoordinator *)&v4 dealloc];
}

+ (id)sharedCoordinator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SSVSubscriptionEntitlementsCoordinator_sharedCoordinator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sOnce_0 != -1) {
    dispatch_once(&sOnce_0, block);
  }
  v2 = (void *)sCoordinator_0;
  return v2;
}

void __59__SSVSubscriptionEntitlementsCoordinator_sharedCoordinator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sCoordinator_0;
  sCoordinator_0 = (uint64_t)v1;
}

- (void)getSubscriptionEntitlements:(id)a3
{
}

- (void)getSubscriptionEntitlementsIgnoreCaches:(BOOL)a3 entitlementsBlock:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__SSVSubscriptionEntitlementsCoordinator_getSubscriptionEntitlementsIgnoreCaches_entitlementsBlock___block_invoke;
  block[3] = &unk_1E5BA8748;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __100__SSVSubscriptionEntitlementsCoordinator_getSubscriptionEntitlementsIgnoreCaches_entitlementsBlock___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v18 = [*(id *)(a1 + 32) _cachedSubscriptionEntitlements];
    if (v18)
    {
      v16 = (void *)v18;
      id v17 = 0;
      goto LABEL_17;
    }
  }
  v2 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (v4)
  {
    int v27 = 138412290;
    id v28 = (id)objc_opt_class();
    id v6 = v28;
    LODWORD(v21) = 12;
    objc_super v7 = (void *)_os_log_send_and_compose_impl();

    if (!v7) {
      goto LABEL_13;
    }
    v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v27, v21);
    free(v7);
    SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
  }

LABEL_13:
  v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(unsigned __int8 *)(a1 + 48);
  id v26 = 0;
  v16 = [v14 _loadSubscriptionEntitlementsIgnoreCaches:v15 error:&v26];
  id v17 = v26;
  if (!v17) {
    [*(id *)(a1 + 32) _setCachedSubscriptionEntitlements:v16];
  }
LABEL_17:
  v19 = *(void **)(a1 + 40);
  if (v19)
  {
    v20 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__SSVSubscriptionEntitlementsCoordinator_getSubscriptionEntitlementsIgnoreCaches_entitlementsBlock___block_invoke_6;
    block[3] = &unk_1E5BA6EB8;
    id v25 = v19;
    id v23 = v16;
    id v24 = v17;
    dispatch_async(v20, block);
  }
}

uint64_t __100__SSVSubscriptionEntitlementsCoordinator_getSubscriptionEntitlementsIgnoreCaches_entitlementsBlock___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_cachedSubscriptionEntitlements
{
  v2 = self;
  objc_sync_enter(v2);
  int v3 = v2->_cachedEntitlements;
  objc_sync_exit(v2);

  return v3;
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    int v4 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    v5 = self->_connection;
    self->_connection = v4;

    connection = self->_connection;
  }
  return connection;
}

- (id)_loadSubscriptionEntitlementsIgnoreCaches:(BOOL)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    objc_super v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      objc_super v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      LODWORD(v32) = 136446210;
      *(void *)((char *)&v32 + 4) = "-[SSVSubscriptionEntitlementsCoordinator _loadSubscriptionEntitlementsIgnoreCaches:error:]";
      LODWORD(v24) = 12;
      uint64_t v12 = (void *)_os_log_send_and_compose_impl();

      if (v12)
      {
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v32, v24);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
      }
    }
    else
    {
    }
  }
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 150);
  xpc_dictionary_set_BOOL(v20, "1", a3);
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = &v32;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__84;
  v35 = __Block_byref_object_dispose__84;
  id v36 = 0;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__84;
  v30 = __Block_byref_object_dispose__84;
  id v31 = 0;
  uint64_t v21 = [(SSVSubscriptionEntitlementsCoordinator *)self _connection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__SSVSubscriptionEntitlementsCoordinator__loadSubscriptionEntitlementsIgnoreCaches_error___block_invoke;
  v25[3] = &unk_1E5BAEA50;
  v25[4] = &v32;
  v25[5] = &v26;
  [v21 sendSynchronousMessage:v20 withReply:v25];

  if (a4) {
    *a4 = *(id *)(*((void *)&v32 + 1) + 40);
  }
  id v22 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v22;
}

void __90__SSVSubscriptionEntitlementsCoordinator__loadSubscriptionEntitlementsIgnoreCaches_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v4 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v4 = 111;
LABEL_6:
    uint64_t v5 = SSError(@"SSErrorDomain", v4, 0, 0);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    objc_super v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
    goto LABEL_7;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v9 = xpc_dictionary_get_value(xdict, "2");
  uint64_t v10 = [v8 initWithXPCEncoding:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = [SSVSubscriptionEntitlements alloc];
  objc_super v7 = xpc_dictionary_get_value(xdict, "3");
  uint64_t v14 = [(SSVSubscriptionEntitlements *)v13 initWithXPCEncoding:v7];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

LABEL_7:
}

- (void)_setCachedSubscriptionEntitlements:(id)a3
{
  uint64_t v6 = (SSVSubscriptionEntitlements *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_cachedEntitlements != v6) {
    objc_storeStrong((id *)&v5->_cachedEntitlements, a3);
  }
  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_cachedEntitlements, 0);
}

@end