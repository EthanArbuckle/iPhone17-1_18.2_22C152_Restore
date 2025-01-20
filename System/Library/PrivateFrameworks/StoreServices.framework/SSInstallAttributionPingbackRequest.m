@interface SSInstallAttributionPingbackRequest
- (SSInstallAttributionPingbackRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation SSInstallAttributionPingbackRequest

- (void)startWithCompletionBlock:(id)a3
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
      v22 = "-[SSInstallAttributionPingbackRequest startWithCompletionBlock:]";
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
  v19[2] = __64__SSInstallAttributionPingbackRequest_startWithCompletionBlock___block_invoke;
  v19[3] = &unk_1E5BA6EE0;
  v19[4] = self;
  id v20 = v4;
  id v17 = v4;
  [(SSRequest *)self _startWithMessageID:201 messageBlock:v19];
}

void __64__SSInstallAttributionPingbackRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      int v7 = SSError(@"SSErrorDomain", 121, 0, 0);
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v6 = xpc_dictionary_get_value(v4, "1");
      int v7 = (void *)[v5 initWithXPCEncoding:v6];
    }
    v8 = dispatch_get_global_queue(0, 0);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __64__SSInstallAttributionPingbackRequest_startWithCompletionBlock___block_invoke_2;
    uint64_t v14 = &unk_1E5BA7328;
    id v9 = *(id *)(a1 + 40);
    id v15 = v7;
    id v16 = v9;
    id v10 = v7;
    dispatch_async(v8, &v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v11, v12, v13, v14);
}

uint64_t __64__SSInstallAttributionPingbackRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  return xpc_dictionary_create(0, 0, 0);
}

- (SSInstallAttributionPingbackRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSInstallAttributionPingbackRequest;
    int v6 = [(SSRequest *)&v8 init];
  }
  else
  {

    int v6 = 0;
  }

  return v6;
}

@end