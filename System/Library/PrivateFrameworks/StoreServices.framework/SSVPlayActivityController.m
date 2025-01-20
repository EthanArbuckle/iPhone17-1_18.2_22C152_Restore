@interface SSVPlayActivityController
+ (id)_requiredEndpointIdentifiers;
- (BOOL)_setEndpointRevisionInformation:(id)a3 forEndpointIdentifier:(id)a4;
- (SSVPlayActivityController)init;
- (SSVPlayActivityController)initWithWritingStyle:(unint64_t)a3;
- (id)_copyEndpointRevisionInformationForEndpointIdentifier:(id)a3;
- (id)_daemonPlayActivityControllerConnection;
- (id)_revisionsIndexSetForPlayActivityEventPersistentIDs:(id)a3;
- (id)_revisionsIndexSetForPlayActivityEvents:(id)a3;
- (id)_sessionInformationForSessionToken:(unint64_t)a3;
- (unint64_t)writingStyle;
- (void)_acquirePendingPlayActivityEventsForEndpointIdentifier:(id)a3 withStoreAccountID:(unint64_t)a4 shouldFilterStoreAccountID:(BOOL)a5 completionHandler:(id)a6;
- (void)_completePendingPlayEventsWithRevisionIndexSet:(id)a3 forSessionToken:(unint64_t)a4 withResult:(unint64_t)a5 completionHandler:(id)a6;
- (void)_getFlushSessionInformationForEndpointIdentifier:(id)a3 shouldAcquire:(BOOL)a4 storeAccountID:(unint64_t)a5 shouldFilterStoreAccountID:(BOOL)a6 withCompletionHandler:(id)a7;
- (void)_loadEndpointIdentifierInformationIfNeeded;
- (void)_setupNotifyTokenIfNeeded;
- (void)acquirePendingPlayActivityEventsForEndpointIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)acquirePendingPlayActivityEventsForEndpointIdentifier:(id)a3 withStoreAccountID:(unint64_t)a4 completionHandler:(id)a5;
- (void)completePendingPlayActivityEventPersistentIDs:(id)a3 forSessionToken:(unint64_t)a4 withResult:(unint64_t)a5 completionHandler:(id)a6;
- (void)completePendingPlayActivityEvents:(id)a3 forSessionToken:(unint64_t)a4 withResult:(unint64_t)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)flushPendingPlayActivityEventsForEndpointIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getHasPendingPlayEventsForEndpointIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getPlayActivityEventsFromRevision:(unint64_t)a3 toRevision:(unint64_t)a4 withCompletionHandler:(id)a5;
- (void)getRevisionInformationWithCompletionHandler:(id)a3;
- (void)recordPlayActivityEvents:(id)a3 withCompletionHandler:(id)a4;
- (void)removeFlushedPlayActivityEventsWithCompletionHandler:(id)a3;
- (void)removePlayActivityEventsUpToRevision:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)setCurrentRevision:(unint64_t)a3 revisionVersionToken:(id)a4 forEndpointIdentifier:(id)a5 withCompletionHandler:(id)a6;
@end

@implementation SSVPlayActivityController

- (SSVPlayActivityController)init
{
  return [(SSVPlayActivityController *)self initWithWritingStyle:0];
}

- (SSVPlayActivityController)initWithWritingStyle:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SSVPlayActivityController;
  v4 = [(SSVPlayActivityController *)&v12 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreServices.SSVPlayActivityController.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.StoreServices.SSVPlayActivityController.serialQueue", 0);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v7;

    v4->_writingStyle = a3;
    v9 = objc_alloc_init(SSVPlayActivityTable);
    table = v4->_table;
    v4->_table = v9;
  }
  return v4;
}

- (void)dealloc
{
  if (self->_hasValidEndpointRevisionInformationDidChangeNotifyToken) {
    notify_cancel(self->_endpointRevisionInformationDidChangeNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)SSVPlayActivityController;
  [(SSVPlayActivityController *)&v3 dealloc];
}

- (void)acquirePendingPlayActivityEventsForEndpointIdentifier:(id)a3 withStoreAccountID:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)acquirePendingPlayActivityEventsForEndpointIdentifier:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)completePendingPlayActivityEvents:(id)a3 forSessionToken:(unint64_t)a4 withResult:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  objc_super v12 = v11;
  if (a4)
  {
    serialQueue = self->_serialQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_2;
    v16[3] = &unk_1E5BAD3B8;
    v16[4] = self;
    id v17 = v10;
    unint64_t v19 = a4;
    unint64_t v20 = a5;
    id v18 = v12;
    dispatch_async(serialQueue, v16);

    v14 = v17;
LABEL_5:

    goto LABEL_6;
  }
  if (v11)
  {
    v15 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke;
    block[3] = &unk_1E5BA8EC0;
    id v22 = v12;
    dispatch_async(v15, block);

    v14 = v22;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[9] == 1)
  {
    objc_super v3 = v2[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_3;
    block[3] = &unk_1E5BAD3B8;
    void block[4] = v2;
    v4 = &v21;
    id v21 = *(id *)(a1 + 40);
    long long v23 = *(_OWORD *)(a1 + 56);
    dispatch_queue_t v5 = &v22;
    id v22 = *(id *)(a1 + 48);
    dispatch_barrier_async(v3, block);
  }
  else
  {
    v6 = [v2 _daemonPlayActivityControllerConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_4;
    v16[3] = &unk_1E5BAD3E0;
    dispatch_queue_t v7 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    v4 = &v17;
    id v17 = v7;
    long long v19 = *(_OWORD *)(a1 + 56);
    dispatch_queue_t v5 = &v18;
    id v18 = *(id *)(a1 + 48);
    v8 = [v6 remoteObjectProxyWithErrorHandler:v16];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_2_49;
    v12[3] = &unk_1E5BAD3E0;
    id v11 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v11;
    long long v15 = *(_OWORD *)(a1 + 56);
    id v14 = *(id *)(a1 + 48);
    [v8 completePendingPlayActivityEvents:v13 forSessionToken:v9 result:v10 withReplyBlock:v12];
  }
}

void __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_3(void *a1)
{
  v2 = (void *)a1[4];
  id v3 = [v2 _revisionsIndexSetForPlayActivityEvents:a1[5]];
  [v2 _completePendingPlayEventsWithRevisionIndexSet:v3 forSessionToken:a1[7] withResult:a1[8] completionHandler:a1[6]];
}

void __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  dispatch_queue_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = [*(id *)(a1 + 40) count];
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    int v26 = 138413314;
    v27 = v9;
    __int16 v28 = 2114;
    id v29 = v3;
    __int16 v30 = 2048;
    uint64_t v31 = v10;
    __int16 v32 = 2048;
    uint64_t v33 = v11;
    __int16 v34 = 2048;
    uint64_t v35 = v12;
    LODWORD(v22) = 52;
    id v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_12;
    }
    dispatch_queue_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v22);
    free(v13);
    SSFileLog(v4, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v7);
  }

LABEL_12:
  unint64_t v20 = *(void **)(a1 + 48);
  if (v20)
  {
    id v21 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_47;
    block[3] = &unk_1E5BA7328;
    id v25 = v20;
    id v24 = v3;
    dispatch_async(v21, block);
  }
}

uint64_t __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_2_49(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  dispatch_queue_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = [*(id *)(a1 + 40) count];
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    int v26 = 138413314;
    v27 = v9;
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    __int16 v30 = 2048;
    uint64_t v31 = v11;
    __int16 v32 = 2048;
    uint64_t v33 = v12;
    __int16 v34 = 2114;
    id v35 = v3;
    LODWORD(v22) = 52;
    id v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_12;
    }
    dispatch_queue_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v22);
    free(v13);
    SSFileLog(v4, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v7);
  }

LABEL_12:
  unint64_t v20 = *(void **)(a1 + 48);
  if (v20)
  {
    id v21 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_50;
    block[3] = &unk_1E5BA7328;
    id v25 = v20;
    id v24 = v3;
    dispatch_async(v21, block);
  }
}

uint64_t __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)completePendingPlayActivityEventPersistentIDs:(id)a3 forSessionToken:(unint64_t)a4 withResult:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__SSVPlayActivityController_completePendingPlayActivityEventPersistentIDs_forSessionToken_withResult_completionHandler___block_invoke;
  block[3] = &unk_1E5BAD3B8;
  void block[4] = self;
  id v16 = v10;
  unint64_t v18 = a4;
  unint64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(serialQueue, block);
}

void __120__SSVPlayActivityController_completePendingPlayActivityEventPersistentIDs_forSessionToken_withResult_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__SSVPlayActivityController_completePendingPlayActivityEventPersistentIDs_forSessionToken_withResult_completionHandler___block_invoke_2;
  block[3] = &unk_1E5BAD3B8;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  dispatch_barrier_async(v3, block);
}

void __120__SSVPlayActivityController_completePendingPlayActivityEventPersistentIDs_forSessionToken_withResult_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [v2 _revisionsIndexSetForPlayActivityEventPersistentIDs:a1[5]];
  [v2 _completePendingPlayEventsWithRevisionIndexSet:v3 forSessionToken:a1[7] withResult:a1[8] completionHandler:a1[6]];
}

- (void)flushPendingPlayActivityEventsForEndpointIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SSVPlayActivityController *)self _daemonPlayActivityControllerConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E5BAD408;
  v17[4] = self;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  id v11 = [v8 remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E5BAD408;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 flushPlayActivityEventsForEndPointIdentifier:v13 withReplyBlock:v14];
}

void __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 40);
    int v24 = 138412802;
    id v25 = v9;
    __int16 v26 = 2114;
    id v27 = v3;
    __int16 v28 = 2114;
    uint64_t v29 = v10;
    LODWORD(v20) = 32;
    id v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v24, v20);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  id v18 = *(void **)(a1 + 48);
  if (v18)
  {
    id v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_51;
    block[3] = &unk_1E5BA7328;
    id v23 = v18;
    id v22 = v3;
    dispatch_async(v19, block);
  }
}

uint64_t __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 40);
    int v24 = 138412802;
    id v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v10;
    __int16 v28 = 2114;
    id v29 = v3;
    LODWORD(v20) = 32;
    id v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v24, v20);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  id v18 = *(void **)(a1 + 48);
  if (v18)
  {
    id v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_52;
    block[3] = &unk_1E5BA7328;
    id v23 = v18;
    id v22 = v3;
    dispatch_async(v19, block);
  }
}

uint64_t __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getHasPendingPlayEventsForEndpointIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__SSVPlayActivityController_getHasPendingPlayEventsForEndpointIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_1E5BA6FF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(serialQueue, block);
  }
}

void __96__SSVPlayActivityController_getHasPendingPlayEventsForEndpointIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __96__SSVPlayActivityController_getHasPendingPlayEventsForEndpointIdentifier_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5BAD430;
  id v4 = *(id *)(a1 + 48);
  [v1 _getFlushSessionInformationForEndpointIdentifier:v2 shouldAcquire:0 storeAccountID:0 shouldFilterStoreAccountID:0 withCompletionHandler:v3];
}

void __96__SSVPlayActivityController_getHasPendingPlayEventsForEndpointIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a4;
  id v7 = [a2 revisionsIndexSet];
  (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, [v7 count] != 0, v6);
}

- (void)getRevisionInformationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E5BA7350;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(serialQueue, v7);
  }
}

void __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  int v24 = __Block_byref_object_copy__62;
  id v25 = __Block_byref_object_dispose__62;
  id v26 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__62;
  id v18 = __Block_byref_object_dispose__62;
  id v19 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke_54;
  v13[3] = &unk_1E5BAD458;
  v13[4] = v2;
  v13[5] = v20;
  v13[6] = &v14;
  [v3 performTransactionWithBlock:v13];
  if (!v15[5] && !v22[5])
  {
    uint64_t v4 = SSError(@"SSErrorDomain", 100, 0, 0);
    uint64_t v5 = (void *)v22[5];
    v22[5] = v4;
  }
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5BAD480;
    id v9 = v6;
    id v10 = v20;
    id v11 = &v14;
    uint64_t v12 = &v21;
    dispatch_async(v7, block);
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);
}

uint64_t __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke_54(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(a1[4] + 56) currentEventsRevision];
  uint64_t v2 = [*(id *)(a1[4] + 56) eventsRevisionVersionToken];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

uint64_t __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
}

- (void)getPlayActivityEventsFromRevision:(unint64_t)a3 toRevision:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    if (a4)
    {
      serialQueue = self->_serialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_2;
      block[3] = &unk_1E5BAD4F8;
      void block[4] = self;
      unint64_t v15 = a3;
      unint64_t v16 = a4;
      id v14 = v8;
      dispatch_async(serialQueue, block);
      id v11 = v14;
    }
    else
    {
      uint64_t v12 = dispatch_get_global_queue(0, 0);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke;
      v17[3] = &unk_1E5BA8EC0;
      id v18 = v9;
      dispatch_async(v12, v17);

      id v11 = v18;
    }
  }
}

uint64_t __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__62;
  v13[4] = __Block_byref_object_dispose__62;
  id v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__62;
  v11[4] = __Block_byref_object_dispose__62;
  id v12 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E5BAD4A8;
  v9[4] = v2;
  v9[5] = v11;
  long long v10 = *(_OWORD *)(a1 + 48);
  v9[6] = v13;
  [v3 performTransactionWithBlock:v9];
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E5BAD4D0;
  id v6 = *(id *)(a1 + 40);
  id v7 = v11;
  id v8 = v13;
  dispatch_async(v4, v5);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

uint64_t __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_3(void *a1)
{
  v1 = *(void **)(a1[4] + 56);
  uint64_t v2 = *(void *)(a1[5] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v8 = *(id *)(v6 + 40);
  id obj = v3;
  [v1 getPlayActivityEvents:&obj relevantRevisionsIndexSet:0 withStartRevision:v4 endRevision:v5 additionalRevisionsIndexSet:0 ignoredRevisionsIndexSet:0 error:&v8];
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v8);
  return 0;
}

uint64_t __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)recordPlayActivityEvents:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
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
  id v11 = [v8 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    v10 &= 2u;
  }
  if (v10)
  {
    id v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    int v29 = 138412546;
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v31 = 2112;
    id v32 = v6;
    LODWORD(v23) = 22;
    uint64_t v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_12;
    }
    id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v29, v23);
    free(v13);
    SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
  }

LABEL_12:
  if ([v6 count])
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5BA6FF0;
    void block[4] = self;
    id v25 = v6;
    id v26 = v7;
    dispatch_async(serialQueue, block);

    uint64_t v21 = v25;
LABEL_16:

    goto LABEL_17;
  }
  if (v7)
  {
    id v22 = dispatch_get_global_queue(0, 0);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke;
    v27[3] = &unk_1E5BA8EC0;
    id v28 = v7;
    dispatch_async(v22, v27);

    uint64_t v21 = v28;
    goto LABEL_16;
  }
LABEL_17:
}

uint64_t __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[9] == 1)
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__62;
    v51 = __Block_byref_object_dispose__62;
    v52 = 0;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    v42[3] = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    uint64_t v3 = (void *)v2[7];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_3;
    v35[3] = &unk_1E5BAD520;
    v35[4] = v2;
    v37 = v42;
    id v36 = *(id *)(a1 + 40);
    v38 = &v43;
    v39 = &v47;
    v40 = v41;
    [v3 performTransactionWithBlock:v35];
    if (!*((unsigned char *)v44 + 24) && !v48[5])
    {
      uint64_t v4 = SSError(@"SSErrorDomain", 100, 0, 0);
      uint64_t v5 = (void *)v48[5];
      v48[5] = v4;
    }
    if (CFPreferencesGetAppBooleanValue(@"ShouldDebugLogRecordedEvents", @"com.apple.PlayActivityFeed", 0))
    {
      uint64_t v29 = 0;
      id v30 = &v29;
      uint64_t v31 = 0x3032000000;
      id v32 = __Block_byref_object_copy__62;
      uint64_t v33 = __Block_byref_object_dispose__62;
      id v34 = 0;
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(NSObject **)(v6 + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_4;
      block[3] = &unk_1E5BA6FC8;
      void block[4] = v6;
      void block[5] = &v29;
      dispatch_barrier_sync(v7, block);
      id v8 = objc_alloc_init(SSVPlayActivityDebugLogOperation);
      [(SSVPlayActivityDebugLogOperation *)v8 setPlayActivityEvents:*(void *)(a1 + 40)];
      [(id)v30[5] addOperation:v8];

      _Block_object_dispose(&v29, 8);
    }
    int v9 = dispatch_get_global_queue(0, 0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_5;
    v22[3] = &unk_1E5BAD548;
    id v25 = &v43;
    id v26 = v42;
    uint64_t v27 = v41;
    uint64_t v10 = *(void *)(a1 + 32);
    int v24 = &v47;
    v22[4] = v10;
    id v23 = *(id *)(a1 + 48);
    dispatch_async(v9, v22);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(v42, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
    id v11 = v52;
  }
  else
  {
    id v12 = [v2 _daemonPlayActivityControllerConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_6;
    v19[3] = &unk_1E5BAD408;
    uint64_t v13 = *(void **)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    id v20 = v13;
    id v21 = *(id *)(a1 + 48);
    uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v19];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_2_71;
    v16[3] = &unk_1E5BAD408;
    uint64_t v15 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    id v18 = *(id *)(a1 + 48);
    [v14 insertPlayActivityEvents:v17 withReplyBlock:v16];

    id v11 = v20;
  }
}

BOOL __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) currentEventsRevision];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
LABEL_3:
    uint64_t v7 = 0;
    uint64_t v8 = v2;
    while (1)
    {
      uint64_t v9 = v7;
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
      uint64_t v2 = v8 + v7 + 1;
      id v11 = *(void **)(*(void *)(a1 + 32) + 56);
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v12 + 40);
      char v13 = [v11 insertPlayActivityEvent:v10 withRevision:v8 + v9 + 1 returningError:&obj];
      objc_storeStrong((id *)(v12 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        break;
      }
      uint64_t v7 = v9 + 1;
      if (v5 == v9 + 1)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v2 = v8 + v7;
        if (v5) {
          goto LABEL_3;
        }
        uint64_t v2 = v8 + v9 + 1;
        break;
      }
    }
  }

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    return 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                + 24))
    return 1;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setCurrentEventsRevision:");
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 0;
}

void __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    [*(id *)(*(void *)(a1 + 32) + 16) setMaxConcurrentOperationCount:1];
    [*(id *)(*(void *)(a1 + 32) + 16) setName:@"com.apple.StoreServices.SSVPlayActivityController.debugLogOperationQueue"];
    [*(id *)(*(void *)(a1 + 32) + 16) setQualityOfService:17];
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

uint64_t __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_5(void *a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1[6] + 8) + 40)
    && *(unsigned char *)(*(void *)(a1[7] + 8) + 24)
    && *(void *)(*(void *)(a1[8] + 8) + 24) < *(void *)(*(void *)(a1[9] + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = a1[4];
    v8[0] = @"SSVPlayActivityControllerUserInfoKeyStartRevision";
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1[8] + 8) + 24) + 1];
    v8[1] = @"SSVPlayActivityControllerUserInfoKeyEndRevision";
    v9[0] = v5;
    uint64_t v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1[9] + 8) + 24)];
    v9[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    [v3 postNotificationName:@"SSVPlayActivityControllerDidRecordPlayActivityEventsNotification" object:v4 userInfo:v7];
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

void __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = [*(id *)(a1 + 40) count];
    int v24 = 138412802;
    id v25 = v9;
    __int16 v26 = 2114;
    id v27 = v3;
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    LODWORD(v20) = 32;
    id v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v24, v20);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  long long v18 = *(void **)(a1 + 48);
  if (v18)
  {
    long long v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_70;
    block[3] = &unk_1E5BA7328;
    id v23 = v18;
    id v22 = v3;
    dispatch_async(v19, block);
  }
}

uint64_t __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_2_71(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    uint64_t v10 = [*(id *)(a1 + 40) count];
    int v24 = 138412802;
    id v25 = v9;
    __int16 v26 = 2048;
    uint64_t v27 = v10;
    __int16 v28 = 2114;
    id v29 = v3;
    LODWORD(v20) = 32;
    id v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v24, v20);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  long long v18 = *(void **)(a1 + 48);
  if (v18)
  {
    long long v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_72;
    block[3] = &unk_1E5BA7328;
    id v23 = v18;
    id v22 = v3;
    dispatch_async(v19, block);
  }
}

uint64_t __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeFlushedPlayActivityEventsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__SSVPlayActivityController_removeFlushedPlayActivityEventsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5BA7350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __82__SSVPlayActivityController_removeFlushedPlayActivityEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _loadEndpointIdentifierInformationIfNeeded];
  uint64_t v2 = [(id)objc_opt_class() _requiredEndpointIdentifiers];
  id v3 = (void *)[v2 mutableCopy];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    unint64_t v8 = -1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        [v3 removeObject:v10];
        id v11 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v10];
        unint64_t v12 = [v11 currentRevision];
        uint64_t v13 = [v11 additionalPendingRevisionsIndexSet];
        if ([v13 count])
        {
          uint64_t v14 = [v13 firstIndex];
          uint64_t v15 = v14 - 1;
          if (v12 < v14 - 1) {
            uint64_t v15 = v12;
          }
          if (v14 > 0) {
            unint64_t v12 = v15;
          }
        }
        if (v8 >= v12) {
          unint64_t v8 = v12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);

    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && ![v3 count])
    {
      [*(id *)(a1 + 32) removePlayActivityEventsUpToRevision:v8 withCompletionHandler:*(void *)(a1 + 40)];
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v16 = *(void **)(a1 + 40);
  if (v16)
  {
    uint64_t v17 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SSVPlayActivityController_removeFlushedPlayActivityEventsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5BA8EC0;
    id v19 = v16;
    dispatch_async(v17, block);
  }
LABEL_21:
}

uint64_t __82__SSVPlayActivityController_removeFlushedPlayActivityEventsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePlayActivityEventsUpToRevision:(unint64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v7)
  {
    uint64_t v7 = +[SSLogConfig sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = [v7 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (!v11) {
    goto LABEL_12;
  }
  int v25 = 134217984;
  unint64_t v26 = a3;
  LODWORD(v21) = 12;
  unint64_t v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v25, v21);
    free(v12);
    SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
LABEL_12:
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5BAD5E8;
  id v23 = v6;
  unint64_t v24 = a3;
  void block[4] = self;
  id v20 = v6;
  dispatch_async(serialQueue, block);
}

void __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2[9] == 1)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__62;
    id v34 = __Block_byref_object_dispose__62;
    id v35 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 1;
    id v3 = (void *)v2[7];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_2;
    v25[3] = &unk_1E5BAD570;
    v25[4] = v2;
    v25[5] = &v26;
    uint64_t v4 = a1[6];
    v25[6] = &v30;
    v25[7] = v4;
    [v3 performTransactionWithBlock:v25];
    if (!*((unsigned char *)v27 + 24) && !v31[5])
    {
      uint64_t v5 = SSError(@"SSErrorDomain", 100, 0, 0);
      id v6 = (void *)v31[5];
      v31[5] = v5;
    }
    uint64_t v7 = (void *)a1[5];
    if (v7)
    {
      int v8 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_3;
      block[3] = &unk_1E5BAD598;
      id v23 = v7;
      unint64_t v24 = &v30;
      dispatch_async(v8, block);
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    int v9 = v35;
  }
  else
  {
    uint64_t v10 = [v2 _daemonPlayActivityControllerConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_4;
    v19[3] = &unk_1E5BAD5C0;
    unint64_t v12 = (void *)a1[5];
    uint64_t v11 = a1[6];
    v19[4] = a1[4];
    uint64_t v21 = v11;
    id v20 = v12;
    uint64_t v13 = [v10 remoteObjectProxyWithErrorHandler:v19];
    uint64_t v14 = (void *)a1[5];
    uint64_t v15 = a1[6];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_2_74;
    v16[3] = &unk_1E5BAD5C0;
    v16[4] = a1[4];
    uint64_t v18 = v15;
    id v17 = v14;
    [v13 removePlayActivityEventsUptoRevision:v15 withReplyBlock:v16];

    int v9 = v20;
  }
}

uint64_t __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 56);
  uint64_t v3 = a1[7];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 removePlayActivityEventsUpToRevision:v3 returningError:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
  return 1;
}

uint64_t __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 48);
    int v24 = 138412802;
    int v25 = v9;
    __int16 v26 = 2114;
    id v27 = v3;
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    LODWORD(v20) = 32;
    uint64_t v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v24, v20);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  uint64_t v18 = *(void **)(a1 + 40);
  if (v18)
  {
    id v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_73;
    block[3] = &unk_1E5BA7328;
    id v23 = v18;
    id v22 = v3;
    dispatch_async(v19, block);
  }
}

uint64_t __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_2_74(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 48);
    int v24 = 138412802;
    int v25 = v9;
    __int16 v26 = 2048;
    uint64_t v27 = v10;
    __int16 v28 = 2114;
    id v29 = v3;
    LODWORD(v20) = 32;
    uint64_t v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v24, v20);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  uint64_t v18 = *(void **)(a1 + 40);
  if (v18)
  {
    id v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_75;
    block[3] = &unk_1E5BA7328;
    id v23 = v18;
    id v22 = v3;
    dispatch_async(v19, block);
  }
}

uint64_t __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setCurrentRevision:(unint64_t)a3 revisionVersionToken:(id)a4 forEndpointIdentifier:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  if (v11)
  {
    serialQueue = self->_serialQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E5BAD610;
    void v17[4] = self;
    unint64_t v21 = a3;
    id v18 = v10;
    id v19 = v11;
    id v20 = v13;
    dispatch_async(serialQueue, v17);

    uint64_t v15 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v12)
  {
    uint64_t v16 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_1E5BA8EC0;
    id v23 = v13;
    dispatch_async(v16, block);

    uint64_t v15 = v23;
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[9] == 1)
  {
    id v3 = v2[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_3;
    block[3] = &unk_1E5BAD610;
    uint64_t v29 = *(void *)(a1 + 64);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v25 = v4;
    uint64_t v26 = v5;
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    dispatch_barrier_async(v3, block);

    int v6 = v25;
  }
  else
  {
    uint64_t v7 = [v2 _daemonPlayActivityControllerConnection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_5;
    v19[3] = &unk_1E5BAD638;
    uint64_t v8 = *(void *)(a1 + 64);
    int v9 = *(void **)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    uint64_t v23 = v8;
    id v20 = v9;
    id v21 = *(id *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    id v10 = [v7 remoteObjectProxyWithErrorHandler:v19];
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_2_78;
    v14[3] = &unk_1E5BAD638;
    v14[4] = *(void *)(a1 + 32);
    uint64_t v18 = v11;
    id v15 = v12;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    [v10 setRevision:v11 revisionVersionToken:v15 forEndpointIdentifier:v13 withReplyBlock:v14];

    int v6 = v20;
  }
}

void __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(_SSVPlayActivityEndpointRevisionInformation);
  [(_SSVPlayActivityEndpointRevisionInformation *)v2 setCurrentRevision:*(void *)(a1 + 64)];
  [(_SSVPlayActivityEndpointRevisionInformation *)v2 setRevisionVersionToken:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _setEndpointRevisionInformation:v2 forEndpointIdentifier:*(void *)(a1 + 48)];
  id v3 = *(void **)(a1 + 56);
  if (v3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5BA8EC0;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_5(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    uint64_t v10 = a1[8];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    int v26 = 138413314;
    id v27 = v9;
    __int16 v28 = 2114;
    id v29 = v3;
    __int16 v30 = 2048;
    uint64_t v31 = v10;
    __int16 v32 = 2114;
    uint64_t v33 = v11;
    __int16 v34 = 2114;
    uint64_t v35 = v12;
    LODWORD(v22) = 52;
    uint64_t v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_12;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v22);
    free(v13);
    SSFileLog(v4, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v7);
  }

LABEL_12:
  id v20 = (void *)a1[7];
  if (v20)
  {
    id v21 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_77;
    block[3] = &unk_1E5BA7328;
    id v25 = v20;
    id v24 = v3;
    dispatch_async(v21, block);
  }
}

uint64_t __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_2_78(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    uint64_t v10 = a1[8];
    uint64_t v11 = a1[5];
    uint64_t v12 = a1[6];
    int v26 = 138413314;
    id v27 = v9;
    __int16 v28 = 2048;
    uint64_t v29 = v10;
    __int16 v30 = 2114;
    uint64_t v31 = v11;
    __int16 v32 = 2114;
    uint64_t v33 = v12;
    __int16 v34 = 2114;
    id v35 = v3;
    LODWORD(v22) = 52;
    uint64_t v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_12;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v22);
    free(v13);
    SSFileLog(v4, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v7);
  }

LABEL_12:
  id v20 = (void *)a1[7];
  if (v20)
  {
    id v21 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_79;
    block[3] = &unk_1E5BA7328;
    id v25 = v20;
    id v24 = v3;
    dispatch_async(v21, block);
  }
}

uint64_t __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)_requiredEndpointIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SSVPlayActivityControllerEndpointIdentifierJingle";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)_acquirePendingPlayActivityEventsForEndpointIdentifier:(id)a3 withStoreAccountID:(unint64_t)a4 shouldFilterStoreAccountID:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v11)
  {
    if (v10)
    {
      serialQueue = self->_serialQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_2;
      v15[3] = &unk_1E5BAD6B0;
      v15[4] = self;
      id v16 = v10;
      unint64_t v18 = a4;
      BOOL v19 = a5;
      id v17 = v11;
      dispatch_async(serialQueue, v15);

      uint64_t v13 = v16;
    }
    else
    {
      uint64_t v14 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke;
      block[3] = &unk_1E5BA8EC0;
      id v21 = v11;
      dispatch_async(v14, block);

      uint64_t v13 = v21;
    }
  }
}

uint64_t __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[9] == 1)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_3;
    v19[3] = &unk_1E5BAD430;
    uint64_t v5 = *(void *)(a1 + 40);
    id v20 = *(id *)(a1 + 48);
    [v2 _getFlushSessionInformationForEndpointIdentifier:v5 shouldAcquire:1 storeAccountID:v3 shouldFilterStoreAccountID:v4 withCompletionHandler:v19];
    int v6 = v20;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _daemonPlayActivityControllerConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_4;
    v16[3] = &unk_1E5BAD408;
    uint64_t v8 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v8;
    id v18 = *(id *)(a1 + 48);
    int v9 = [v7 remoteObjectProxyWithErrorHandler:v16];
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_2_82;
    v13[3] = &unk_1E5BAD688;
    uint64_t v12 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v12;
    id v15 = *(id *)(a1 + 48);
    [v9 acquirePendingPlayActivityEventsForEndpointIdentifier:v14 storeAccountID:v10 shouldFilterStoreAccountID:v11 withReplyBlock:v13];

    int v6 = v17;
  }
}

void __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if ([v7 count]) {
    [v9 sessionToken];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    uint64_t v10 = *(void *)(a1 + 40);
    int v24 = 138412802;
    id v25 = v9;
    __int16 v26 = 2114;
    id v27 = v3;
    __int16 v28 = 2114;
    uint64_t v29 = v10;
    LODWORD(v20) = 32;
    uint64_t v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_12;
    }
    id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v24, v20);
    free(v11);
    SSFileLog(v4, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  id v18 = *(void **)(a1 + 48);
  if (v18)
  {
    BOOL v19 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_81;
    block[3] = &unk_1E5BA7328;
    id v23 = v18;
    id v22 = v3;
    dispatch_async(v19, block);
  }
}

uint64_t __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_2_82(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v9)
  {
    id v9 = +[SSLogConfig sharedConfig];
  }
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    v11 &= 2u;
  }
  if (v11)
  {
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    uint64_t v15 = [v7 count];
    uint64_t v16 = *(void *)(a1 + 40);
    int v32 = 138412802;
    uint64_t v33 = v14;
    __int16 v34 = 2048;
    uint64_t v35 = v15;
    __int16 v36 = 2114;
    uint64_t v37 = v16;
    LODWORD(v26) = 32;
    uint64_t v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_12;
    }
    uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v32, v26);
    free(v17);
    SSFileLog(v9, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v12);
  }

LABEL_12:
  int v24 = *(void **)(a1 + 48);
  if (v24)
  {
    id v25 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_83;
    block[3] = &unk_1E5BAD660;
    id v30 = v24;
    id v28 = v7;
    uint64_t v31 = a3;
    id v29 = v8;
    dispatch_async(v25, block);
  }
}

uint64_t __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_83(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[7], a1[5]);
}

- (void)_completePendingPlayEventsWithRevisionIndexSet:(id)a3 forSessionToken:(unint64_t)a4 withResult:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v12)
  {
    uint64_t v12 = +[SSLogConfig sharedConfig];
  }
  int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  uint64_t v15 = [v12 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    int v16 = v14;
  }
  else {
    int v16 = v14 & 2;
  }
  if (v16)
  {
    int v136 = 138412802;
    id v137 = v10;
    __int16 v138 = 2048;
    unint64_t v139 = a4;
    __int16 v140 = 2048;
    unint64_t v141 = a5;
    LODWORD(v122) = 32;
    v118 = &v136;
    uint64_t v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_13;
    }
    uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v136, v122);
    free(v17);
    SSFileLog(v12, @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
  }

LABEL_13:
  if (a4)
  {
    int v24 = [(SSVPlayActivityController *)self _sessionInformationForSessionToken:a4];
    id v25 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v25)
    {
      id v25 = +[SSLogConfig sharedConfig];
    }
    int v26 = objc_msgSend(v25, "shouldLog", v118);
    if ([v25 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    id v28 = [v25 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
      int v29 = v27;
    }
    else {
      int v29 = v27 & 2;
    }
    if (v29)
    {
      int v136 = 138412290;
      id v137 = v24;
      LODWORD(v122) = 12;
      v119 = &v136;
      id v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30) {
        goto LABEL_26;
      }
      id v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v136, v122);
      free(v30);
      SSFileLog(v25, @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v28);
    }

LABEL_26:
    uint64_t v37 = [v24 endpointIdentifier];
    if (!v24)
    {
      BOOL v83 = 0;
LABEL_124:
      v116 = dispatch_get_global_queue(0, 0);
      v128[0] = MEMORY[0x1E4F143A8];
      v128[1] = 3221225472;
      v128[2] = __121__SSVPlayActivityController__completePendingPlayEventsWithRevisionIndexSet_forSessionToken_withResult_completionHandler___block_invoke_86;
      v128[3] = &unk_1E5BAD6D8;
      BOOL v133 = v83;
      id v129 = v37;
      v130 = self;
      id v131 = 0;
      id v132 = v11;
      id v117 = v37;
      dispatch_async(v116, v128);

      goto LABEL_125;
    }
    uint64_t v38 = [v24 revisionsIndexSet];
    v39 = (void *)[v38 mutableCopy];

    if (![v10 count])
    {
      BOOL v83 = 0;
LABEL_119:
      if (objc_msgSend(v39, "count", v119))
      {
        [v24 setRevisionsIndexSet:v39];
      }
      else
      {
        [(NSMutableArray *)self->_pendingFlushingSessions removeObject:v24];
        if (![(NSMutableArray *)self->_pendingFlushingSessions count])
        {
          pendingFlushingSessions = self->_pendingFlushingSessions;
          self->_pendingFlushingSessions = 0;
        }
      }

      goto LABEL_124;
    }
    v127 = self;
    v40 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v40)
    {
      v40 = +[SSLogConfig sharedConfig];
    }
    int v41 = objc_msgSend(v40, "shouldLog", v119);
    if ([v40 shouldLogToDisk]) {
      int v42 = v41 | 2;
    }
    else {
      int v42 = v41;
    }
    uint64_t v43 = [v40 OSLogObject];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
      int v44 = v42;
    }
    else {
      int v44 = v42 & 2;
    }
    if (v44)
    {
      int v136 = 138412546;
      id v137 = v10;
      __int16 v138 = 2112;
      unint64_t v139 = (unint64_t)v39;
      LODWORD(v122) = 22;
      v120 = &v136;
      uint64_t v45 = (void *)_os_log_send_and_compose_impl();

      if (!v45) {
        goto LABEL_40;
      }
      uint64_t v43 = objc_msgSend(NSString, "stringWithCString:encoding:", v45, 4, &v136, v122);
      free(v45);
      SSFileLog(v40, @"%@", v46, v47, v48, v49, v50, v51, (uint64_t)v43);
    }

LABEL_40:
    [v39 removeIndexes:v10];
    v52 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v52)
    {
      v52 = +[SSLogConfig sharedConfig];
    }
    int v53 = objc_msgSend(v52, "shouldLog", v120);
    if ([v52 shouldLogToDisk]) {
      int v54 = v53 | 2;
    }
    else {
      int v54 = v53;
    }
    v55 = [v52 OSLogObject];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO)) {
      int v56 = v54;
    }
    else {
      int v56 = v54 & 2;
    }
    if (v56)
    {
      int v136 = 138412290;
      id v137 = v39;
      LODWORD(v122) = 12;
      v121 = &v136;
      v57 = (void *)_os_log_send_and_compose_impl();

      if (!v57) {
        goto LABEL_52;
      }
      v55 = objc_msgSend(NSString, "stringWithCString:encoding:", v57, 4, &v136, v122);
      free(v57);
      SSFileLog(v52, @"%@", v58, v59, v60, v61, v62, v63, (uint64_t)v55);
    }

LABEL_52:
    v124 = v39;

    v64 = v37;
    id v65 = [(SSVPlayActivityController *)v127 _copyEndpointRevisionInformationForEndpointIdentifier:v37];
    v66 = [v65 revisionVersionToken];
    v67 = [v24 revisionVersionToken];
    int v68 = [v66 isEqualToString:v67];

    if (v68)
    {
      v123 = v65;
      v69 = [v65 additionalPendingRevisionsIndexSet];
      v125 = (void *)[v69 mutableCopy];

      v70 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v70)
      {
        v70 = +[SSLogConfig sharedConfig];
      }
      int v71 = objc_msgSend(v70, "shouldLog", v121);
      if ([v70 shouldLogToDisk]) {
        int v72 = v71 | 2;
      }
      else {
        int v72 = v71;
      }
      v73 = [v70 OSLogObject];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO)) {
        int v74 = v72;
      }
      else {
        int v74 = v72 & 2;
      }
      uint64_t v37 = v64;
      if (v74)
      {
        int v136 = 138412290;
        id v137 = v125;
        LODWORD(v122) = 12;
        v119 = &v136;
        v75 = (void *)_os_log_send_and_compose_impl();

        v39 = v124;
        if (!v75)
        {
LABEL_81:

          if (a5 == 1)
          {
            id v104 = v125;
            self = v127;
            if (!v125) {
              id v104 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            }
            objc_msgSend(v104, "addIndexes:", v10, v119);
            id v126 = v104;
            [v123 setAdditionalPendingRevisionsIndexSet:v104];
            v99 = +[SSLogConfig sharedStoreServicesConfig];
            if (!v99)
            {
              v99 = +[SSLogConfig sharedConfig];
            }
            int v105 = [v99 shouldLog];
            if ([v99 shouldLogToDisk]) {
              int v106 = v105 | 2;
            }
            else {
              int v106 = v105;
            }
            v102 = [v99 OSLogObject];
            if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO)) {
              int v107 = v106;
            }
            else {
              int v107 = v106 & 2;
            }
            if (v107)
            {
              int v136 = 138412290;
              id v137 = v126;
              LODWORD(v122) = 12;
              v119 = &v136;
              goto LABEL_112;
            }
LABEL_114:
            v90 = v123;
            goto LABEL_115;
          }
          v98 = v125;
          self = v127;
          if (!a5 && v125)
          {
            [v125 removeIndexes:v10];
            if (![v125 count])
            {

              v98 = 0;
            }
            id v126 = v98;
            objc_msgSend(v123, "setAdditionalPendingRevisionsIndexSet:", v98, v119);
            v99 = +[SSLogConfig sharedStoreServicesConfig];
            if (!v99)
            {
              v99 = +[SSLogConfig sharedConfig];
            }
            int v100 = [v99 shouldLog];
            if ([v99 shouldLogToDisk]) {
              int v101 = v100 | 2;
            }
            else {
              int v101 = v100;
            }
            v102 = [v99 OSLogObject];
            if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO)) {
              int v103 = v101;
            }
            else {
              int v103 = v101 & 2;
            }
            if (v103)
            {
              int v136 = 138412290;
              id v137 = v126;
              LODWORD(v122) = 12;
              v119 = &v136;
LABEL_112:
              v108 = (void *)_os_log_send_and_compose_impl();

              v90 = v123;
              if (!v108)
              {
                v98 = v126;
                goto LABEL_117;
              }
              v102 = objc_msgSend(NSString, "stringWithCString:encoding:", v108, 4, &v136, v122);
              free(v108);
              SSFileLog(v99, @"%@", v109, v110, v111, v112, v113, v114, (uint64_t)v102);
LABEL_115:
              v98 = v126;

LABEL_117:
              BOOL v83 = [(SSVPlayActivityController *)self _setEndpointRevisionInformation:v90 forEndpointIdentifier:v37];
              goto LABEL_118;
            }
            goto LABEL_114;
          }
          BOOL v83 = 0;
          v90 = v123;
LABEL_118:

          goto LABEL_119;
        }
        v73 = objc_msgSend(NSString, "stringWithCString:encoding:", v75, 4, &v136, v122);
        free(v75);
        SSFileLog(v70, @"%@", v76, v77, v78, v79, v80, v81, (uint64_t)v73);
      }
      else
      {
        v39 = v124;
      }

      goto LABEL_81;
    }
    v84 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v84)
    {
      v84 = +[SSLogConfig sharedConfig];
    }
    int v85 = objc_msgSend(v84, "shouldLog", v121);
    if ([v84 shouldLogToDisk]) {
      int v86 = v85 | 2;
    }
    else {
      int v86 = v85;
    }
    v87 = [v84 OSLogObject];
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO)) {
      int v88 = v86;
    }
    else {
      int v88 = v86 & 2;
    }
    if (v88)
    {
      LOWORD(v136) = 0;
      LODWORD(v122) = 2;
      v119 = &v136;
      v89 = (void *)_os_log_send_and_compose_impl();

      v90 = v65;
      uint64_t v37 = v64;
      v91 = v124;
      if (!v89)
      {
LABEL_99:

        BOOL v83 = 0;
        v98 = v91;
        v39 = 0;
        self = v127;
        goto LABEL_118;
      }
      v87 = objc_msgSend(NSString, "stringWithCString:encoding:", v89, 4, &v136, v122);
      free(v89);
      SSFileLog(v84, @"%@", v92, v93, v94, v95, v96, v97, (uint64_t)v87);
    }
    else
    {
      v90 = v65;
      uint64_t v37 = v64;
      v91 = v124;
    }

    goto LABEL_99;
  }
  if (v11)
  {
    v82 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__SSVPlayActivityController__completePendingPlayEventsWithRevisionIndexSet_forSessionToken_withResult_completionHandler___block_invoke;
    block[3] = &unk_1E5BA8EC0;
    id v135 = v11;
    dispatch_async(v82, block);

    int v24 = v135;
LABEL_125:
  }
}

uint64_t __121__SSVPlayActivityController__completePendingPlayEventsWithRevisionIndexSet_forSessionToken_withResult_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __121__SSVPlayActivityController__completePendingPlayEventsWithRevisionIndexSet_forSessionToken_withResult_completionHandler___block_invoke_86(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 32))
  {
    uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v7 = @"SSVPlayActivityControllerUserInfoKeyEndpointIdentifier";
    v8[0] = v3;
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v2 postNotificationName:@"SSVPlayActivityControllerEndpointRevisionInformationDidChangeNotification" object:v4 userInfo:v5];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (id)_daemonPlayActivityControllerConnection
{
  if (!self->_writingStyle && !self->_daemonPlayActivityControllerConnection)
  {
    uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.itunescloudd.playactivity" options:0];
    daemonPlayActivityControllerConnection = self->_daemonPlayActivityControllerConnection;
    self->_daemonPlayActivityControllerConnection = v3;

    int v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF9DBE18];
    int v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    [v5 setClasses:v8 forSelector:sel_insertPlayActivityEvents_withReplyBlock_ argumentIndex:0 ofReply:0];

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    [v5 setClasses:v11 forSelector:sel_insertPlayActivityEvents_withReplyBlock_ argumentIndex:0 ofReply:0];

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    int v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    [v5 setClasses:v14 forSelector:sel_completePendingPlayActivityEvents_forSessionToken_result_withReplyBlock_ argumentIndex:0 ofReply:0];

    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    [v5 setClasses:v17 forSelector:sel_acquirePendingPlayActivityEventsForEndpointIdentifier_storeAccountID_shouldFilterStoreAccountID_withReplyBlock_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)self->_daemonPlayActivityControllerConnection setRemoteObjectInterface:v5];
    [(NSXPCConnection *)self->_daemonPlayActivityControllerConnection setInterruptionHandler:&__block_literal_global_28];
    [(NSXPCConnection *)self->_daemonPlayActivityControllerConnection setInvalidationHandler:&__block_literal_global_154];
    [(NSXPCConnection *)self->_daemonPlayActivityControllerConnection resume];
  }
  uint64_t v18 = self->_daemonPlayActivityControllerConnection;
  return v18;
}

void __68__SSVPlayActivityController__daemonPlayActivityControllerConnection__block_invoke()
{
  v0 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v0)
  {
    v0 = +[SSLogConfig sharedConfig];
  }
  int v1 = [v0 shouldLog];
  if ([v0 shouldLogToDisk]) {
    int v2 = v1 | 2;
  }
  else {
    int v2 = v1;
  }
  uint64_t v3 = [v0 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    int v4 = v2;
  }
  else {
    int v4 = v2 & 2;
  }
  if (!v4) {
    goto LABEL_12;
  }
  v13[0] = 0;
  LODWORD(v12) = 2;
  int v5 = (void *)_os_log_send_and_compose_impl();

  if (v5)
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, v13, v12);
    free(v5);
    SSFileLog(v0, @"%@", v6, v7, v8, v9, v10, v11, (uint64_t)v3);
LABEL_12:
  }
}

void __68__SSVPlayActivityController__daemonPlayActivityControllerConnection__block_invoke_152()
{
  v0 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v0)
  {
    v0 = +[SSLogConfig sharedConfig];
  }
  int v1 = [v0 shouldLog];
  if ([v0 shouldLogToDisk]) {
    int v2 = v1 | 2;
  }
  else {
    int v2 = v1;
  }
  uint64_t v3 = [v0 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
    int v4 = v2;
  }
  else {
    int v4 = v2 & 2;
  }
  if (!v4) {
    goto LABEL_12;
  }
  v13[0] = 0;
  LODWORD(v12) = 2;
  int v5 = (void *)_os_log_send_and_compose_impl();

  if (v5)
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithCString:encoding:", v5, 4, v13, v12);
    free(v5);
    SSFileLog(v0, @"%@", v6, v7, v8, v9, v10, v11, (uint64_t)v3);
LABEL_12:
  }
}

- (id)_copyEndpointRevisionInformationForEndpointIdentifier:(id)a3
{
  id v4 = a3;
  [(SSVPlayActivityController *)self _loadEndpointIdentifierInformationIfNeeded];
  int v5 = [(NSMutableDictionary *)self->_endpointIdentifierToEndpointRevisionInformation objectForKey:v4];

  uint64_t v6 = (void *)[v5 copy];
  return v6;
}

- (void)_getFlushSessionInformationForEndpointIdentifier:(id)a3 shouldAcquire:(BOOL)a4 storeAccountID:(unint64_t)a5 shouldFilterStoreAccountID:(BOOL)a6 withCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5BAD778;
  v16[4] = self;
  id v17 = v12;
  BOOL v20 = a6;
  BOOL v21 = a4;
  id v18 = v13;
  unint64_t v19 = a5;
  id v14 = v13;
  id v15 = v12;
  [(SSVPlayActivityController *)self getRevisionInformationWithCompletionHandler:v16];
}

void __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_2;
  v15[3] = &unk_1E5BAD750;
  id v16 = v8;
  uint64_t v17 = v9;
  id v18 = *(id *)(a1 + 40);
  id v19 = v7;
  __int16 v23 = *(_WORD *)(a1 + 64);
  id v12 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v21 = a2;
  uint64_t v22 = v11;
  id v20 = v12;
  id v13 = v7;
  id v14 = v8;
  dispatch_barrier_async(v10, v15);
}

void __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__62;
  v68[4] = __Block_byref_object_dispose__62;
  id v69 = *(id *)(a1 + 32);
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__62;
  v66[4] = __Block_byref_object_dispose__62;
  id v67 = 0;
  int v2 = (_SSVPlayActivityEndpointRevisionInformation *)[*(id *)(a1 + 40) _copyEndpointRevisionInformationForEndpointIdentifier:*(void *)(a1 + 48)];
  uint64_t v3 = v2;
  if (!v2)
  {
    if (!*(void *)(a1 + 72)) {
      goto LABEL_37;
    }
LABEL_10:
    uint64_t v3 = objc_alloc_init(_SSVPlayActivityEndpointRevisionInformation);
    [(_SSVPlayActivityEndpointRevisionInformation *)v3 setRevisionVersionToken:*(void *)(a1 + 56)];
    goto LABEL_11;
  }
  id v4 = *(void **)(a1 + 56);
  int v5 = [(_SSVPlayActivityEndpointRevisionInformation *)v2 revisionVersionToken];
  if (([v4 isEqualToString:v5] & 1) == 0)
  {

LABEL_9:
    if (!*(void *)(a1 + 72))
    {
      uint64_t v3 = 0;
LABEL_37:

      int v24 = 0;
      if (!*(unsigned char *)(a1 + 89))
      {
        char v32 = 0;
        id v18 = 0;
        goto LABEL_40;
      }
      id v18 = 0;
      goto LABEL_39;
    }
    goto LABEL_10;
  }
  BOOL v6 = [(_SSVPlayActivityEndpointRevisionInformation *)v3 currentRevision] > *(void *)(a1 + 72);

  if (v6) {
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 72)) {
    goto LABEL_37;
  }
LABEL_11:
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 40) + 40);
  id v8 = 0;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v63 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v13 = [v12 endpointIdentifier];
        int v14 = [v13 isEqualToString:*(void *)(a1 + 48)];

        if (v14)
        {
          id v15 = [v12 revisionsIndexSet];
          if ([v15 count])
          {
            if (v8) {
              [v8 addIndexes:v15];
            }
            else {
              id v8 = (void *)[v15 mutableCopy];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v9);
  }

  id v16 = [(_SSVPlayActivityEndpointRevisionInformation *)v3 additionalPendingRevisionsIndexSet];
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = __Block_byref_object_copy__62;
  uint64_t v60 = __Block_byref_object_dispose__62;
  id v61 = 0;
  uint64_t v17 = *(void **)(*(void *)(a1 + 40) + 56);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_3;
  v45[3] = &unk_1E5BAD700;
  id v18 = v3;
  __int16 v55 = *(_WORD *)(a1 + 88);
  uint64_t v19 = *(void *)(a1 + 40);
  uint64_t v46 = v18;
  uint64_t v47 = v19;
  uint64_t v50 = v66;
  uint64_t v51 = &v56;
  uint64_t v20 = *(void *)(a1 + 80);
  uint64_t v53 = *(void *)(a1 + 72);
  uint64_t v54 = v20;
  id v21 = v16;
  id v48 = v21;
  id v22 = v8;
  id v49 = v22;
  v52 = v68;
  [v17 performTransactionWithBlock:v45];
  unint64_t v23 = [(id)v57[5] lastIndex];
  if ([(id)v57[5] count])
  {
    int v24 = objc_alloc_init(_SSVPlayActivityFlushSessionInformation);
    id v25 = (void *)[(id)v57[5] mutableCopy];
    [(_SSVPlayActivityFlushSessionInformation *)v24 setRevisionsIndexSet:v25];

    [(_SSVPlayActivityFlushSessionInformation *)v24 setRevisionVersionToken:*(void *)(a1 + 56)];
    [(_SSVPlayActivityFlushSessionInformation *)v24 setEndpointIdentifier:*(void *)(a1 + 48)];
    CFUUIDRef v26 = CFUUIDCreate(0);
    uint64_t v27 = *(_OWORD *)&CFUUIDGetUUIDBytes(v26);
    CFRelease(v26);
    [(_SSVPlayActivityFlushSessionInformation *)v24 setSessionToken:v27];
    if (*(unsigned char *)(a1 + 89))
    {
      [(_SSVPlayActivityEndpointRevisionInformation *)v18 setAdditionalPendingRevisionsIndexSet:v57[5]];
      if ([(_SSVPlayActivityEndpointRevisionInformation *)v18 currentRevision] > v23) {
        unint64_t v23 = [(_SSVPlayActivityEndpointRevisionInformation *)v18 currentRevision];
      }
      [(_SSVPlayActivityEndpointRevisionInformation *)v18 setCurrentRevision:v23];
    }
  }
  else
  {
    int v24 = 0;
  }

  _Block_object_dispose(&v56, 8);
  if (*(unsigned char *)(a1 + 89))
  {
    if (v24)
    {
      id v28 = *(void **)(*(void *)(a1 + 40) + 40);
      if (!v28)
      {
        uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        uint64_t v30 = *(void *)(a1 + 40);
        uint64_t v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;

        id v28 = *(void **)(*(void *)(a1 + 40) + 40);
      }
      [v28 addObject:v24];
    }
LABEL_39:
    [*(id *)(a1 + 40) _setEndpointRevisionInformation:v18 forEndpointIdentifier:*(void *)(a1 + 48)];
    char v32 = 1;
    goto LABEL_40;
  }
  char v32 = 0;
LABEL_40:
  uint64_t v33 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_4;
  block[3] = &unk_1E5BAD728;
  id v41 = *(id *)(a1 + 64);
  int v42 = v66;
  uint64_t v43 = v68;
  char v44 = v32;
  uint64_t v34 = *(void *)(a1 + 40);
  uint64_t v35 = *(void **)(a1 + 48);
  uint64_t v38 = v24;
  uint64_t v39 = v34;
  id v40 = v35;
  uint64_t v36 = v24;
  dispatch_async(v33, block);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);
}

uint64_t __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentRevision];
  unint64_t v3 = *(void *)(a1 + 88);
  if (v2 + 1 <= v3) {
    uint64_t v4 = v2 + 1;
  }
  else {
    uint64_t v4 = 0;
  }
  if (v2 + 1 <= v3) {
    uint64_t v5 = *(void *)(a1 + 88);
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL v6 = *(void **)(*(void *)(a1 + 40) + 56);
  int v7 = *(unsigned __int8 *)(a1 + 105);
  if (*(unsigned char *)(a1 + 104))
  {
    if (*(unsigned char *)(a1 + 105))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v10 = *(void **)(v8 + 40);
      uint64_t v9 = (id *)(v8 + 40);
      id v43 = v10;
      uint64_t v11 = &v43;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v9 = 0;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v19 = *(void **)(v16 + 40);
    id v18 = (id *)(v16 + 40);
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(a1 + 96);
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 56);
    uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
    id v25 = *(void **)(v23 + 40);
    int v24 = (void **)(v23 + 40);
    id v41 = v25;
    id obj = v17;
    [v6 getPlayActivityEvents:v11 relevantRevisionsIndexSet:&obj withStartRevision:v4 endRevision:v5 storeAccountID:v20 additionalRevisionsIndexSet:v21 ignoredRevisionsIndexSet:v22 error:&v41];
    if (v7) {
      objc_storeStrong(v9, v43);
    }
    objc_storeStrong(v18, obj);
    CFUUIDRef v26 = v41;
  }
  else
  {
    if (*(unsigned char *)(a1 + 105))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      int v14 = *(void **)(v12 + 40);
      id v13 = (id *)(v12 + 40);
      id v40 = v14;
      id v15 = &v40;
    }
    else
    {
      id v15 = 0;
      id v13 = 0;
    }
    uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v30 = *(void **)(v27 + 40);
    uint64_t v29 = (id *)(v27 + 40);
    id v28 = v30;
    uint64_t v31 = *(void *)(a1 + 48);
    uint64_t v32 = *(void *)(a1 + 56);
    uint64_t v33 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v34 = *(void **)(v33 + 40);
    int v24 = (void **)(v33 + 40);
    uint64_t v38 = v34;
    id v39 = v28;
    [v6 getPlayActivityEvents:v15 relevantRevisionsIndexSet:&v39 withStartRevision:v4 endRevision:v5 additionalRevisionsIndexSet:v31 ignoredRevisionsIndexSet:v32 error:&v38];
    if (v7) {
      objc_storeStrong(v13, v40);
    }
    objc_storeStrong(v29, v39);
    CFUUIDRef v26 = v38;
  }
  id v35 = v26;
  uint64_t v36 = *v24;
  *int v24 = v35;

  return 0;
}

void __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
  if (*(unsigned char *)(a1 + 80))
  {
    unint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v7 = @"SSVPlayActivityControllerUserInfoKeyEndpointIdentifier";
    v8[0] = v4;
    BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v3 postNotificationName:@"SSVPlayActivityControllerEndpointRevisionInformationDidChangeNotification" object:v5 userInfo:v6];
  }
}

- (void)_loadEndpointIdentifierInformationIfNeeded
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (self->_hasLoadedEndpointRevisionInformation) {
    return;
  }
  uint64_t v2 = self;
  self->_hasLoadedEndpointRevisionInformation = 1;
  [(SSVPlayActivityController *)self _setupNotifyTokenIfNeeded];
  unint64_t v3 = (void *)CFPreferencesCopyAppValue(@"SSVPlayActivityEndpointRevisionInformation", @"com.apple.itunesstored");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_33;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v34 = v3;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (!v5) {
    goto LABEL_32;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v40;
  id v36 = v4;
  uint64_t v37 = v2;
  uint64_t v35 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v40 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v4 objectForKey:v9];
        if ([v10 length])
        {
          uint64_t v11 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v12 = objc_opt_class();
          id v38 = 0;
          id v13 = [v11 unarchivedObjectOfClass:v12 fromData:v10 error:&v38];
          id v14 = v38;
          if (v14)
          {
            id v15 = +[SSLogConfig sharedStoreServicesConfig];
            if (!v15)
            {
              id v15 = +[SSLogConfig sharedConfig];
            }
            int v16 = objc_msgSend(v15, "shouldLog", v32, v33);
            if ([v15 shouldLogToDisk]) {
              int v17 = v16 | 2;
            }
            else {
              int v17 = v16;
            }
            id v18 = [v15 OSLogObject];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              int v19 = v17;
            }
            else {
              int v19 = v17 & 2;
            }
            if (v19)
            {
              uint64_t v20 = objc_opt_class();
              int v43 = 138543618;
              char v44 = v20;
              __int16 v45 = 2114;
              id v46 = v14;
              id v21 = v20;
              LODWORD(v33) = 22;
              uint64_t v32 = &v43;
              uint64_t v22 = (void *)_os_log_send_and_compose_impl();

              if (v22)
              {
                id v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v43, v33);
                free(v22);
                SSFileLog(v15, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v18);
                goto LABEL_22;
              }
            }
            else
            {
LABEL_22:
            }
            id v4 = v36;
            uint64_t v2 = v37;
            uint64_t v7 = v35;
          }
          if (v13)
          {
            endpointIdentifierToEndpointRevisionInformation = v2->_endpointIdentifierToEndpointRevisionInformation;
            if (!endpointIdentifierToEndpointRevisionInformation)
            {
              uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
              uint64_t v31 = v2->_endpointIdentifierToEndpointRevisionInformation;
              v2->_endpointIdentifierToEndpointRevisionInformation = (NSMutableDictionary *)v30;

              endpointIdentifierToEndpointRevisionInformation = v2->_endpointIdentifierToEndpointRevisionInformation;
            }
            -[NSMutableDictionary setObject:forKey:](endpointIdentifierToEndpointRevisionInformation, "setObject:forKey:", v13, v9, v32);
          }
        }
        continue;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v47 count:16];
  }
  while (v6);
LABEL_32:

  unint64_t v3 = v34;
LABEL_33:
}

- (id)_revisionsIndexSetForPlayActivityEvents:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__62;
  int v16 = __Block_byref_object_dispose__62;
  id v17 = 0;
  table = self->_table;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SSVPlayActivityController__revisionsIndexSetForPlayActivityEvents___block_invoke;
  void v9[3] = &unk_1E5BAD7A0;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(SSVPlayActivityTable *)table performTransactionWithBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __69__SSVPlayActivityController__revisionsIndexSetForPlayActivityEvents___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) revisionsIndexSetForPlayActivityEvents:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

- (id)_revisionsIndexSetForPlayActivityEventPersistentIDs:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__62;
  int v16 = __Block_byref_object_dispose__62;
  id v17 = 0;
  table = self->_table;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__SSVPlayActivityController__revisionsIndexSetForPlayActivityEventPersistentIDs___block_invoke;
  void v9[3] = &unk_1E5BAD7A0;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(SSVPlayActivityTable *)table performTransactionWithBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __81__SSVPlayActivityController__revisionsIndexSetForPlayActivityEventPersistentIDs___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) revisionsIndexSetForPlayActivityEventPersistentIDs:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

- (id)_sessionInformationForSessionToken:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_pendingFlushingSessions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "sessionToken", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_setEndpointRevisionInformation:(id)a3 forEndpointIdentifier:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(SSVPlayActivityController *)self _loadEndpointIdentifierInformationIfNeeded];
  id v8 = [(NSMutableDictionary *)self->_endpointIdentifierToEndpointRevisionInformation objectForKey:v7];
  uint64_t v9 = v8;
  if (v8 == v6 || ([v8 isEqual:v6] & 1) != 0)
  {
    BOOL v10 = 0;
    goto LABEL_38;
  }
  uint64_t v11 = (void *)CFPreferencesCopyAppValue(@"SSVPlayActivityEndpointRevisionInformation", @"com.apple.itunesstored");
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = 0;
    }
  }
  endpointIdentifierToEndpointRevisionInformation = self->_endpointIdentifierToEndpointRevisionInformation;
  if (!v6)
  {
    [(NSMutableDictionary *)endpointIdentifierToEndpointRevisionInformation removeObjectForKey:v7];
    if (![(NSMutableDictionary *)self->_endpointIdentifierToEndpointRevisionInformation count])
    {
      uint64_t v29 = self->_endpointIdentifierToEndpointRevisionInformation;
      self->_endpointIdentifierToEndpointRevisionInformation = 0;
    }
    long long v15 = (void *)[v11 mutableCopy];
    int v16 = 0;
    goto LABEL_26;
  }
  if (!endpointIdentifierToEndpointRevisionInformation)
  {
    long long v13 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    long long v14 = self->_endpointIdentifierToEndpointRevisionInformation;
    self->_endpointIdentifierToEndpointRevisionInformation = v13;

    endpointIdentifierToEndpointRevisionInformation = self->_endpointIdentifierToEndpointRevisionInformation;
  }
  [(NSMutableDictionary *)endpointIdentifierToEndpointRevisionInformation setObject:v6 forKey:v7];
  long long v15 = (void *)[v11 mutableCopy];
  id v37 = 0;
  int v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:0 requiringSecureCoding:1 error:&v37];
  id v17 = v37;
  if (v17)
  {
    id v36 = v16;
    id v18 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v18)
    {
      id v18 = +[SSLogConfig sharedConfig];
    }
    int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      v19 |= 2u;
    }
    uint64_t v20 = [v18 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      v19 &= 2u;
    }
    if (v19)
    {
      id v21 = objc_opt_class();
      int v38 = 138543618;
      long long v39 = v21;
      __int16 v40 = 2114;
      id v41 = v17;
      id v35 = v21;
      LODWORD(v34) = 22;
      uint64_t v33 = &v38;
      uint64_t v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_21:

        int v16 = v36;
        goto LABEL_22;
      }
      uint64_t v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v38, v34);
      free(v22);
      SSFileLog(v18, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v20);
    }

    goto LABEL_21;
  }
LABEL_22:

LABEL_26:
  if (objc_msgSend(v16, "length", v33))
  {
    if (!v15) {
      long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    }
    [v15 setObject:v16 forKey:v7];
  }
  else
  {
    [v15 removeObjectForKey:v7];
  }
  if (![v15 count])
  {

    long long v15 = 0;
  }
  if (v11 != v15 && ([v11 isEqualToDictionary:v15] & 1) == 0)
  {
    CFPreferencesSetAppValue(@"SSVPlayActivityEndpointRevisionInformation", v15, @"com.apple.itunesstored");
    CFPreferencesAppSynchronize(@"com.apple.itunesstored");
    [(SSVPlayActivityController *)self _setupNotifyTokenIfNeeded];
    if (self->_hasValidEndpointRevisionInformationDidChangeNotifyToken)
    {
      int endpointRevisionInformationDidChangeNotifyToken = self->_endpointRevisionInformationDidChangeNotifyToken;
      pid_t v31 = getpid();
      notify_set_state(endpointRevisionInformationDidChangeNotifyToken, v31);
      notify_post("com.apple.StoreServices.SSVPlayActivityControllerEndpointRevisionInformationDidChange");
    }
  }

  BOOL v10 = 1;
LABEL_38:

  return v10;
}

- (void)_setupNotifyTokenIfNeeded
{
  if (!self->_hasSetupEndpointRevisionInformationDidChangeNotifyToken)
  {
    self->_hasSetupEndpointRevisionInformationDidChangeNotifyToken = 1;
    objc_initWeak(&location, self);
    uint64_t v3 = dispatch_get_global_queue(0, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__SSVPlayActivityController__setupNotifyTokenIfNeeded__block_invoke;
    v5[3] = &unk_1E5BA7F98;
    objc_copyWeak(&v6, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.StoreServices.SSVPlayActivityControllerEndpointRevisionInformationDidChange", &self->_endpointRevisionInformationDidChangeNotifyToken, v3, v5);

    self->_hasValidEndpointRevisionInformationDidChangeNotifyToken = v4 == 0;
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __54__SSVPlayActivityController__setupNotifyTokenIfNeeded__block_invoke(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    if (!notify_get_state(a2, &state64))
    {
      uint64_t v4 = state64;
      if (v4 != getpid())
      {
        CFPreferencesAppSynchronize(@"com.apple.itunesstored");
        uint64_t v5 = WeakRetained[1];
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __54__SSVPlayActivityController__setupNotifyTokenIfNeeded__block_invoke_2;
        v6[3] = &unk_1E5BA7040;
        id v7 = WeakRetained;
        dispatch_barrier_async(v5, v6);
      }
    }
  }
}

void __54__SSVPlayActivityController__setupNotifyTokenIfNeeded__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 36) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (unint64_t)writingStyle
{
  return self->_writingStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonPlayActivityControllerConnection, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_pendingFlushingSessions, 0);
  objc_storeStrong((id *)&self->_endpointIdentifierToEndpointRevisionInformation, 0);
  objc_storeStrong((id *)&self->_debugLogOperationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end