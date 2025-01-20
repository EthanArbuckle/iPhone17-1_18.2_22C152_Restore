@interface SSRequest
+ (BOOL)_allowMultipleCallbacks;
- (BOOL)shouldCancelAfterTaskExpiration;
- (BOOL)start;
- (BOOL)usesTaskCompletionAssertions;
- (SSRequestDelegate)delegate;
- (id)_initSSRequest;
- (void)__beginBackgroundTask;
- (void)__endBackgroundTask;
- (void)_beginBackgroundTask;
- (void)_cancelBackgroundTaskExpirationTimer;
- (void)_endBackgroundTask;
- (void)_expireBackgroundTask;
- (void)_shutdownRequest;
- (void)_shutdownRequestWithMessageID:(int64_t)a3;
- (void)_startWithMessageID:(int64_t)a3 messageBlock:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)disconnect;
- (void)setDelegate:(id)a3;
- (void)setShouldCancelAfterTaskExpiration:(BOOL)a3;
- (void)setUsesTaskCompletionAssertions:(BOOL)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation SSRequest

- (id)_initSSRequest
{
  v7.receiver = self;
  v7.super_class = (Class)SSRequest;
  v2 = [(SSRequest *)&v7 init];
  if (v2)
  {
    id v3 = (id) [[NSString alloc] initWithFormat:@"com.apple.StoreServices.%@.%p", objc_opt_class(), v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_callState = 0;
  }
  return v2;
}

- (void)dealloc
{
  taskAssertion = self->_taskAssertion;
  if (taskAssertion)
  {
    [(BKSProcessAssertion *)taskAssertion invalidate];
    dispatch_queue_t v4 = self->_taskAssertion;
    self->_taskAssertion = 0;
  }
  backgroundTaskExpirationTimer = self->_backgroundTaskExpirationTimer;
  if (backgroundTaskExpirationTimer) {
    dispatch_source_cancel(backgroundTaskExpirationTimer);
  }
  [(SSXPCConnection *)self->_requestConnection setDisconnectBlock:0];
  [(SSXPCConnection *)self->_responseConnection setMessageBlock:0];
  v6.receiver = self;
  v6.super_class = (Class)SSRequest;
  [(SSRequest *)&v6 dealloc];
}

- (void)cancel
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    objc_super v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      int v18 = 136446210;
      v19 = "-[SSRequest cancel]";
      LODWORD(v16) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_super v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v18, v16);
      free(v8);
      SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__SSRequest_cancel__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __19__SSRequest_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutdownRequestWithMessageID:63];
}

- (void)disconnect
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      id v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    objc_super v6 = [v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      int v7 = v5;
    }
    else {
      int v7 = v5 & 2;
    }
    if (v7)
    {
      int v18 = 136446210;
      v19 = "-[SSRequest disconnect]";
      LODWORD(v16) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_super v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v18, v16);
      free(v8);
      SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__SSRequest_disconnect__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __23__SSRequest_disconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutdownRequestWithMessageID:64];
}

- (BOOL)start
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __18__SSRequest_start__block_invoke;
  v3[3] = &unk_1E5BA8720;
  v3[4] = self;
  [(SSRequest *)self startWithCompletionBlock:v3];
  return 1;
}

void __18__SSRequest_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__SSRequest_start__block_invoke_2;
  v5[3] = &unk_1E5BA7018;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __18__SSRequest_start__block_invoke_2(uint64_t a1)
{
  int v5 = [*(id *)(a1 + 32) delegate];
  if (*(void *)(a1 + 40))
  {
    char v2 = objc_opt_respondsToSelector();
    id v3 = v5;
    if ((v2 & 1) == 0) {
      goto LABEL_7;
    }
    [v5 request:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
  }
  else
  {
    char v4 = objc_opt_respondsToSelector();
    id v3 = v5;
    if ((v4 & 1) == 0) {
      goto LABEL_7;
    }
    [v5 requestDidFinish:*(void *)(a1 + 32)];
  }
  id v3 = v5;
LABEL_7:
}

- (void)startWithCompletionBlock:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    SSError(@"SSErrorDomain", 100, 0, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v4, v5);
  }
}

- (void)setShouldCancelAfterTaskExpiration:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SSRequest_setShouldCancelAfterTaskExpiration___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __48__SSRequest_setShouldCancelAfterTaskExpiration___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)shouldCancelAfterTaskExpiration
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SSRequest_shouldCancelAfterTaskExpiration__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__SSRequest_shouldCancelAfterTaskExpiration__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

+ (BOOL)_allowMultipleCallbacks
{
  return 0;
}

- (void)_beginBackgroundTask
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SSRequest__beginBackgroundTask__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __33__SSRequest__beginBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__beginBackgroundTask");
}

- (void)_endBackgroundTask
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SSRequest__endBackgroundTask__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SSRequest__endBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__endBackgroundTask");
}

- (void)_shutdownRequest
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SSRequest__shutdownRequest__block_invoke;
  block[3] = &unk_1E5BA7040;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SSRequest__shutdownRequest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _shutdownRequestWithMessageID:0];
}

- (void)_startWithMessageID:(int64_t)a3 messageBlock:(id)a4
{
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  int v7 = (void *)[(SSRequest *)self copyXPCEncoding];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke;
  block[3] = &unk_1E5BA87E8;
  block[4] = self;
  uint64_t v14 = &v16;
  id v9 = v6;
  id v13 = v9;
  int64_t v15 = a3;
  id v10 = v7;
  id v12 = v10;
  dispatch_sync(dispatchQueue, block);
  if (*((unsigned char *)v17 + 24)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Request already started"];
  }

  _Block_object_dispose(&v16, 8);
}

void __46__SSRequest__startWithMessageID_messageBlock___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  if (v2[5] || v2[6])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v2, "__beginBackgroundTask");
    char v3 = [(id)objc_opt_class() _allowMultipleCallbacks];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v4 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    int v7 = *(void **)(*(void *)(a1 + 32) + 40);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke_2;
    v18[3] = &unk_1E5BA8770;
    objc_copyWeak(&v20, &location);
    char v21 = v3;
    id v19 = *(id *)(a1 + 48);
    [v7 setDisconnectBlock:v18];
    uint64_t v8 = objc_alloc_init(SSXPCConnection);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;

    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke_4;
    v14[3] = &unk_1E5BA87C0;
    objc_copyWeak(&v16, &location);
    char v17 = v3;
    id v15 = *(id *)(a1 + 48);
    [v11 setMessageBlock:v14];
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v12, "0", *(void *)(a1 + 64));
    xpc_dictionary_set_value(v12, "1", *(xpc_object_t *)(a1 + 40));
    id v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) createXPCEndpoint];
    xpc_dictionary_set_value(v12, "2", v13);
    [*(id *)(*(void *)(a1 + 32) + 40) sendMessage:v12];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __46__SSRequest__startWithMessageID_messageBlock___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke_3;
    block[3] = &unk_1E5BA8748;
    id v6 = WeakRetained;
    char v8 = *(unsigned char *)(a1 + 48);
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v4, block);
  }
}

void __46__SSRequest__startWithMessageID_messageBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = 0;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(*(void *)(a1 + 32) + 64), (unint64_t *)&v2, 1uLL, memory_order_relaxed, memory_order_relaxed);
  if (!v2 || *(unsigned char *)(a1 + 48))
  {
    char v3 = [*(id *)(*(void *)(a1 + 32) + 48) messageBlock];
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 40);

      if (v4)
      {
        uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        v5();
      }
    }
  }
}

void __46__SSRequest__startWithMessageID_messageBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke_5;
    v7[3] = &unk_1E5BA8798;
    char v8 = WeakRetained;
    char v11 = *(unsigned char *)(a1 + 48);
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __46__SSRequest__startWithMessageID_messageBlock___block_invoke_5(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = 0;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(*(void *)(result + 32) + 64), (unint64_t *)&v2, 1uLL, memory_order_relaxed, memory_order_relaxed);
  if (!v2 || *(unsigned char *)(result + 56))
  {
    if (*(void *)(result + 48))
    {
      result = *(void *)(result + 40);
      if (result)
      {
        result = MEMORY[0x1A62689E0]();
        if (result == MEMORY[0x1E4F14590])
        {
          id v3 = *(uint64_t (**)(void))(*(void *)(v1 + 48) + 16);
          return v3();
        }
      }
    }
  }
  return result;
}

- (void)__beginBackgroundTask
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!self->_taskAssertion)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.itunesstored.%@.%p", objc_opt_class(), self];
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
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v29 = 138412290;
      id v30 = (id)objc_opt_class();
      id v8 = v30;
      LODWORD(v26) = 12;
      v25 = &v29;
      id v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_13:

        id v16 = (BKSProcessAssertion *)[objc_alloc(MEMORY[0x1E4F4E280]) initWithPID:getpid() flags:5 reason:4 name:v3 withHandler:0];
        taskAssertion = self->_taskAssertion;
        self->_taskAssertion = v16;

        goto LABEL_14;
      }
      id v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v29, v26);
      free(v9);
      SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_13;
  }
LABEL_14:
  [(SSRequest *)self _cancelBackgroundTaskExpirationTimer];
  uint64_t v18 = +[SSWeakReference weakReferenceWithObject:self];
  id v19 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  backgroundTaskExpirationTimer = self->_backgroundTaskExpirationTimer;
  self->_backgroundTaskExpirationTimer = v19;

  char v21 = self->_backgroundTaskExpirationTimer;
  dispatch_time_t v22 = dispatch_time(0, 25000000000);
  dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
  v23 = self->_backgroundTaskExpirationTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __34__SSRequest___beginBackgroundTask__block_invoke;
  handler[3] = &unk_1E5BA7040;
  id v28 = v18;
  id v24 = v18;
  dispatch_source_set_event_handler(v23, handler);
  dispatch_resume((dispatch_object_t)self->_backgroundTaskExpirationTimer);
}

void __34__SSRequest___beginBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) object];
  uint64_t v2 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v2)
  {
    uint64_t v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  int v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v15) = 138412290;
  *(void *)((char *)&v15 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  id v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v15, v14, v15);
    free(v7);
    SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:
  }
  [v1 _endBackgroundTask];
}

- (void)_cancelBackgroundTaskExpirationTimer
{
  backgroundTaskExpirationTimer = self->_backgroundTaskExpirationTimer;
  if (backgroundTaskExpirationTimer)
  {
    dispatch_source_cancel(backgroundTaskExpirationTimer);
    int v4 = self->_backgroundTaskExpirationTimer;
    self->_backgroundTaskExpirationTimer = 0;
  }
}

- (void)__endBackgroundTask
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_taskAssertion)
  {
    int v3 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v3)
    {
      int v3 = +[SSLogConfig sharedConfig];
    }
    int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    id v6 = [v3 OSLogObject];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      v5 &= 2u;
    }
    if (v5)
    {
      LODWORD(v18) = 138412290;
      *(void *)((char *)&v18 + 4) = objc_opt_class();
      id v7 = *(id *)((char *)&v18 + 4);
      LODWORD(v17) = 12;
      uint64_t v16 = &v18;
      uint64_t v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        [(BKSProcessAssertion *)self->_taskAssertion invalidate];
        taskAssertion = self->_taskAssertion;
        self->_taskAssertion = 0;

        goto LABEL_14;
      }
      id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v18, v17, v18);
      free(v8);
      SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_13;
  }
LABEL_14:
  [(SSRequest *)self _cancelBackgroundTaskExpirationTimer];
}

- (void)_expireBackgroundTask
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v3 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v3)
  {
    int v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  int v21 = 138412290;
  id v22 = (id)objc_opt_class();
  id v7 = v22;
  LODWORD(v18) = 12;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v21, v18);
    free(v8);
    SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:
  }
  long long v15 = [(SSXPCConnection *)self->_requestConnection disconnectBlock];
  uint64_t v16 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSRequest__expireBackgroundTask__block_invoke;
  block[3] = &unk_1E5BA7328;
  void block[4] = self;
  id v20 = v15;
  id v17 = v15;
  dispatch_async(v16, block);

  [(SSRequest *)self _cancelBackgroundTaskExpirationTimer];
}

void __34__SSRequest__expireBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(NSObject **)(v3 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SSRequest__expireBackgroundTask__block_invoke_2;
  block[3] = &unk_1E5BA7040;
  void block[4] = v3;
  dispatch_async(v4, block);
}

uint64_t __34__SSRequest__expireBackgroundTask__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[16]) {
    uint64_t v2 = 63;
  }
  else {
    uint64_t v2 = 64;
  }
  return [v1 _shutdownRequestWithMessageID:v2];
}

- (void)_shutdownRequestWithMessageID:(int64_t)a3
{
  requestConnection = self->_requestConnection;
  if (requestConnection)
  {
    if (a3)
    {
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v6, "0", a3);
      [(SSXPCConnection *)self->_requestConnection sendMessage:v6];

      requestConnection = self->_requestConnection;
    }
    [(SSXPCConnection *)requestConnection setDisconnectBlock:0];
    id v7 = self->_requestConnection;
    self->_requestConnection = 0;
  }
  [(SSXPCConnection *)self->_responseConnection setMessageBlock:0];
  responseConnection = self->_responseConnection;
  self->_responseConnection = 0;

  [(SSRequest *)self __endBackgroundTask];
}

- (SSRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)usesTaskCompletionAssertions
{
  return self->_usesTaskCompletionAssertions;
}

- (void)setUsesTaskCompletionAssertions:(BOOL)a3
{
  self->_usesTaskCompletionAssertions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_backgroundTaskExpirationTimer, 0);
  objc_storeStrong((id *)&self->_responseConnection, 0);
  objc_storeStrong((id *)&self->_requestConnection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end