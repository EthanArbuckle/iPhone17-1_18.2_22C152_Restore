@interface SSVRefreshSubscriptionRequest
- (BOOL)isRequestingOfflineSlot;
- (SSAuthenticationContext)authenticationContext;
- (SSVRefreshSubscriptionRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setAuthenticationContext:(id)a3;
- (void)setRequestingOfflineSlot:(BOOL)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)startWithResponseBlock:(id)a3;
@end

@implementation SSVRefreshSubscriptionRequest

- (void)startWithResponseBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
    v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v21 = 136446210;
      v22 = "-[SSVRefreshSubscriptionRequest startWithResponseBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v21, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__SSVRefreshSubscriptionRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:147 messageBlock:v19];
}

void __56__SSVRefreshSubscriptionRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      int v7 = SSError(@"SSErrorDomain", 121, 0, 0);
      v10 = 0;
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v6 = xpc_dictionary_get_value(v4, "2");
      int v7 = (void *)[v5 initWithXPCEncoding:v6];

      v8 = [SSVSubscriptionResponse alloc];
      int v9 = xpc_dictionary_get_value(v4, "3");
      v10 = [(SSVSubscriptionResponse *)v8 initWithXPCEncoding:v9];
    }
    uint64_t v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__SSVRefreshSubscriptionRequest_startWithResponseBlock___block_invoke_2;
    block[3] = &unk_1E5BA6EB8;
    id v12 = *(id *)(a1 + 40);
    id v17 = v7;
    id v18 = v12;
    uint64_t v16 = v10;
    id v13 = v7;
    uint64_t v14 = v10;
    dispatch_async(v11, block);
  }
  [*(id *)(a1 + 32) _shutdownRequest];
}

uint64_t __56__SSVRefreshSubscriptionRequest_startWithResponseBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SSVRefreshSubscriptionRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5BA8210;
  id v7 = v4;
  id v5 = v4;
  [(SSVRefreshSubscriptionRequest *)self startWithResponseBlock:v6];
}

uint64_t __58__SSVRefreshSubscriptionRequest_startWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SSVRefreshSubscriptionRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSVRefreshSubscriptionRequest;
    int v6 = [(SSRequest *)&v12 init];
    if (v6)
    {
      v8 = [SSAuthenticationContext alloc];
      int v9 = xpc_dictionary_get_value(v5, "0");
      uint64_t v10 = [(SSAuthenticationContext *)v8 initWithXPCEncoding:v9];
      authenticationContext = v6->_authenticationContext;
      v6->_authenticationContext = (SSAuthenticationContext *)v10;

      v6->_requestingOfflineSlot = xpc_dictionary_get_BOOL(v5, "1");
    }
  }
  else
  {

    int v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_authenticationContext);
  xpc_dictionary_set_BOOL(v3, "1", self->_requestingOfflineSlot);
  return v3;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (BOOL)isRequestingOfflineSlot
{
  return self->_requestingOfflineSlot;
}

- (void)setRequestingOfflineSlot:(BOOL)a3
{
  self->_requestingOfflineSlot = a3;
}

- (void).cxx_destruct
{
}

@end